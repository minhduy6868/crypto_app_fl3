import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/generated/translations.g.dart';
import '/services/models/api_page_response/api_page_response.dart';
import '../../animations/circular_loading_animation.dart';
import '/shared_customization/data/debouncer.dart';
import '../../extensions/meta_ext.dart';
import '/shared_customization/extensions/scroll_controller_ext.dart';
import '../app_refresh_indicator.dart';
import '../texts/app_text.dart';

class AppList<T> extends StatefulWidget {
  final ScrollController? scrollController;
  final Future<void> Function() onReload;
  final Future Function(int page)? onLoadMore;
  final Widget Function(T item) onItemRender;
  final ApiPageResponse<T>? sourceData;
  final String? errorMessage;
  final EdgeInsets padding;
  final Widget? emptyListIcon;
  final Widget? separatedWidget;
  final Widget? prefixListWidget;
  final double mainAxisSpacing;

  const AppList({
    super.key,
    this.scrollController,
    required this.sourceData,
    required this.onItemRender,
    required this.onReload,
    this.onLoadMore,
    this.errorMessage,
    this.emptyListIcon,
    this.separatedWidget,
    this.prefixListWidget,
    this.padding = EdgeInsets.zero,
    this.mainAxisSpacing = 0,
  });

  @override
  State<AppList<T>> createState() => _AppListState<T>();
}

class _AppListState<T> extends State<AppList<T>> {
  late final ScrollController _scrollController =
      widget.scrollController ?? ScrollController();
  List<T>? get sources => widget.sourceData?.data;
  bool isLoadingMore = false;
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 100));

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScrollHandle);
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScrollHandle);
    super.dispose();
  }

  void onScrollHandle() {
    if (widget.onLoadMore != null &&
        _scrollController.loadMorePointPassed &&
        (widget.sourceData?.meta?.canNextPage ?? false) &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
      _debouncer.call(() {
        widget.onLoadMore
            ?.call(widget.sourceData!.meta!.nextPage)
            .then((value) {
          setState(() {
            isLoadingMore = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AppRefreshIndicator(
          onRefresh: widget.onReload,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxHeight: widget.errorMessage != null ||
                          (sources == null || sources!.isEmpty)
                      ? constraints.maxHeight
                      : double.infinity),
              width: constraints.maxWidth,
              padding: widget.padding.copyWith(
                  bottom: widget.padding.bottom +
                      MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisAlignment: widget.errorMessage != null ||
                        (sources == null || sources!.isEmpty)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  ///
                  /// Error message
                  ///
                  if (widget.errorMessage != null) ...[
                    Center(
                      child: AppText(
                        widget.errorMessage ?? "",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]

                  ///
                  /// Loading
                  ///
                  else if (sources == null)
                    const Center(child: CircularLoadingAnimation())

                  ///
                  /// Sources empty
                  ///
                  else if (sources != null && sources!.isEmpty) ...[
                    if (widget.emptyListIcon != null)
                      widget.emptyListIcon!
                    else
                      Center(
                        child: AppText(
                          tr(LocaleKeys.CommonData_ListDataIsEmpty),
                          color: AppColors.primaryHintText,
                          fontWeight: FontWeight.w600,
                          size: 18,
                          textAlign: TextAlign.center,
                        ),
                      )
                  ]

                  ///
                  /// Render list
                  ///
                  else
                    ...List.generate(sources!.length, (index) => index)
                        .fold<List<Widget>>(
                            <Widget>[],
                            (previousValue, index) => [
                                  ...previousValue,
                                  widget.onItemRender(sources![index]),
                                  if (widget.separatedWidget != null &&
                                      index < sources!.length - 1)
                                    widget.separatedWidget!,
                                  if (widget.mainAxisSpacing > 0)
                                    SizedBox(
                                      height: widget.mainAxisSpacing,
                                    )
                                ]),

                  ///
                  /// Loading more
                  ///
                  if (isLoadingMore)
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const CircularLoadingAnimation(),
                      const SizedBox(width: 8),
                      AppText(tr(LocaleKeys.CommonData_LoadingMore))
                    ]),

                  ///
                  /// Center if error or empty
                  ///
                  if (widget.errorMessage != null ||
                      (sources != null && sources!.isEmpty))
                    const Spacer()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
