// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rxdart/rxdart.dart';

import '/shared_customization/helpers/image_helper.dart';
import '/shared_customization/helpers/dialogs/dialog_helper.dart';
import '../../buttons/app_icon_button.dart';
import '../../app_container.dart';
import '/app_common_data/app_colors.dart';
import '/generated/translations.g.dart';
import '/shared_customization/extensions/list_ext.dart';
import '/shared_customization/extensions/scroll_controller_ext.dart';
import '../../app_layout.dart';
import '../../texts/app_text.dart';

class AppGalleryWidget extends StatefulWidget {
  final bool multiSelection;
  final bool withCameraOption;
  final bool withVideoOption;
  const AppGalleryWidget({
    super.key,
    required this.withCameraOption,
    required this.multiSelection,
    required this.withVideoOption,
  });

  @override
  State<AppGalleryWidget> createState() => _AppGalleryWidgetState();
}

class _AppGalleryWidgetState extends State<AppGalleryWidget> {
  late BehaviorSubject<List<AssetEntity>?> assetSubject;
  late BehaviorSubject<List<String>> selectedItems;
  late final ScrollController _scrollController;
  Map<String, Widget> assetWidgetMap = {};
  bool isLoadingMore = false;
  int paging = 30;
  int nextPage = 0;
  AssetPathEntity? path;
  int? totalAssetCount;
  double? screenWidth;
  BuildContext? _context;

  @override
  void initState() {
    super.initState();
    assetSubject = BehaviorSubject<List<AssetEntity>?>();
    selectedItems = BehaviorSubject<List<String>>.seeded([]);
    _scrollController = ScrollController();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    assetSubject.close();
    selectedItems.close();
  }

  _getData() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend(
        requestOption: const PermissionRequestOption(
      androidPermission:
          AndroidPermission(type: RequestType.common, mediaLocation: false),
      iosAccessLevel: IosAccessLevel.readWrite,
    ));
    if (ps.isAuth || ps.hasAccess) {
      await _getPath();
      await _getListAssetEntity();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (_context != null) {
          showConfirmDialog(
            context,
            title: tr(LocaleKeys.Permission_GalleryPermissionPurpose),
            content: tr(LocaleKeys.Permission_PleaseAccessGalleryPermission),
            onAccept: () {
              Navigator.pop(_context!);
              openAppSettings();
            },
            onReject: Navigator.of(_context!).pop,
          );
        }
      });
    }
  }

  Future<void> _getPath() async {
    try {
      final listPath = await PhotoManager.getAssetPathList(
        hasAll: true,
        onlyAll: true,
        type: widget.withVideoOption ? RequestType.common : RequestType.image,
      );
      if (listPath.isNotEmptyOrNull) {
        path = listPath.first;
        totalAssetCount = await path!.assetCountAsync;
        debugPrint('DEBUG: ===> Asset total count: $totalAssetCount');
      } else {
        assetSubject.addError(tr(LocaleKeys.CommonData_CantLoadData));
      }
    } catch (err) {
      assetSubject.addError(tr(LocaleKeys.CommonData_CantLoadData));
    }
  }

  Future<void> _getListAssetEntity() async {
    if (path == null) return;
    try {
      isLoadingMore = true;
      debugPrint('DEBUG: ===> Get asset page $nextPage');
      List<AssetEntity> list =
          await path!.getAssetListPaged(page: nextPage, size: paging);
      List<Widget> widgets = await Future.wait(list.map((e) async {
        return Image.memory(
          (await e.thumbnailDataWithSize(ThumbnailSize(
              (screenWidth! / 2).round(), (screenWidth! / 2).round())))!,
          fit: BoxFit.cover,
        );
      }).toList());
      for (var element in list) {
        assetWidgetMap[element.id] = widgets[list.indexOf(element)];
      }
      assetSubject.value = [...(assetSubject.valueOrNull ?? []), ...list];
      isLoadingMore = false;
      if (list.isEmpty || list.length < paging) {
        nextPage = 0;
      } else {
        nextPage++;
      }
    } catch (err) {
      assetSubject.addError(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;
    _context = context;
    return StreamBuilder<List<AssetEntity>?>(
        stream: assetSubject.stream,
        builder: (context, assetSnapshot) {
          return AppLayout(
            title: tr(LocaleKeys.CommonData_Gallery),
            appBarColor: AppColors.white,
            backgroundColor: AppColors.primaryBackground,
            leading: AppIconButton(
                onPressed: Navigator.of(context).pop, icon: Icons.close),
            actions: [
              if (widget.multiSelection)
                StreamBuilder<List<String>>(
                    stream: selectedItems.stream,
                    builder: ((context, snapshot) => snapshot
                            .data.isNotEmptyOrNull
                        ? IconButton(
                            onPressed: () async {
                              List<AssetEntity> selectedAssets = snapshot.data!
                                  .map((e) => assetSnapshot.data!
                                      .firstWhere((element) => element.id == e))
                                  .toList();
                              List<File?> selectedFiles = await Future.wait(
                                  selectedAssets.map((e) => e.originFile));
                              Navigator.of(context).pop(selectedFiles);
                            },
                            icon: const Icon(
                              Icons.check,
                              color: AppColors.primaryIconColor,
                            ))
                        : const SizedBox.shrink()))
            ],
            body: StreamBuilder<List<String>>(
                stream: selectedItems.stream,
                builder: (context, selectedSnapshot) {
                  List<String> selectedImageIds = selectedSnapshot.data ?? [];
                  if (assetSnapshot.hasError) {
                    return Center(
                      child: AppText(assetSnapshot.error.toString()),
                    );
                  } else if (assetSnapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor),
                    );
                  }
                  if (assetSnapshot.hasData &&
                      assetSnapshot.data!.isEmpty &&
                      widget.withCameraOption == false) {
                    return const Center(
                      child: Icon(
                        Icons.dns_rounded,
                        size: 32,
                      ),
                    );
                  }
                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollUpdateNotification &&
                          _scrollController.loadMorePointPassed &&
                          isLoadingMore == false &&
                          (totalAssetCount ?? 0) > 0 &&
                          (assetSnapshot.data ?? []).length <
                              totalAssetCount! &&
                          nextPage > 0) {
                        _getListAssetEntity();
                      }
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Wrap(spacing: 2, runSpacing: 2, children: [
                        if (widget.withCameraOption)
                          GestureDetector(
                            onTap: () async {
                              File? file =
                                  await ImagePickerHelper.takePhotoFromCamera(
                                      context: _context!);
                              if (file != null) {
                                Navigator.of(_context!).pop(<File>[file]);
                              }
                            },
                            child: Container(
                              width: (screenWidth! - 4) / 3,
                              height: (screenWidth! - 4) / 3,
                              color: AppColors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: AppColors.primaryNormalText
                                        .withOpacity(0.6),
                                    size: 26,
                                  ),
                                  const SizedBox(height: 4),
                                  AppText(
                                    tr(LocaleKeys.CommonData_TakeAPhoto),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ...(assetSnapshot.data ?? [])
                            .map((e) => SizedBox(
                                  width: (screenWidth! - 4) / 3,
                                  height: (screenWidth! - 4) / 3,
                                  child: GestureDetector(
                                      onTap: () async {
                                        selectedItems.value = selectedImageIds
                                            .toggle(e.id, (p0) => p0);
                                        if (!widget.multiSelection) {
                                          AssetEntity selectedAsset =
                                              assetSnapshot.data!.firstWhere(
                                                  (element) =>
                                                      element.id == e.id);
                                          Navigator.of(context).pop(
                                              await Future.wait(
                                                  [selectedAsset.originFile]));
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: assetWidgetMap[e.id] ??
                                                const SizedBox.shrink(),
                                          ),
                                          if (selectedImageIds.contains(e.id))
                                            Positioned(
                                                top: 8,
                                                right: 8,
                                                child: AppContainer(
                                                    width: 20,
                                                    height: 20,
                                                    alignment: Alignment.center,
                                                    color:
                                                        AppColors.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    border: Border.all(
                                                        color: AppColors.white,
                                                        width: 1),
                                                    child: AppText(
                                                      '${selectedImageIds.indexOf(e.id) + 1}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: AppColors.white,
                                                    ))),
                                          if (e.videoDuration.inSeconds > 0)
                                            Positioned(
                                                bottom: 8,
                                                left: 8,
                                                child: AppText(
                                                  '${'${(e.duration / 60).floor()}'.padLeft(2, '0')}:${'${(e.duration % 60)}'.padLeft(2, '0')}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                ))
                                        ],
                                      )),
                                ))
                            .toList(),
                        if (isLoadingMore)
                          SizedBox(
                            width: screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: AppText(
                                tr(LocaleKeys.CommonData_LoadingMore),
                                textAlign: TextAlign.center,
                                size: 12,
                                color: AppColors.primaryNormalText
                                    .withOpacity(0.6),
                              ),
                            ),
                          )
                      ]),
                    ),
                  );
                }),
          );
        });
  }
}
