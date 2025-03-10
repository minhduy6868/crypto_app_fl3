

import '../../services/models/meta/meta.dart';
import '/services/models/api_page_response/api_page_response.dart';
import '/shared_customization/extensions/list_ext.dart';

extension ApiPageResponseExt<T> on ApiPageResponse<T>? {
  ///
  /// Check null or empty
  ///
  bool get isEmptyOrNull => this == null || this!.data.isEmptyOrNull;
  bool get isNotEmptyOrNull => this != null && this!.data.isNotEmptyOrNull;
  bool get isOnlyEmpty => this != null && this!.data.isOnlyEmpty;

  ///
  /// Get element
  ///
  T? firstOrElseNull(bool Function(T element) condition) {
    for (T element in this?.data ?? []) {
      if (condition(element)) return element;
    }
    return null;
  }

  T? lastOrElseNull(bool Function(T element) condition) {
    for (T element in (this?.data ?? []).reversed) {
      if (condition(element)) return element;
    }
    return null;
  }

  T? elementAtIndexOrElseNull(int index) {
    if (this.isEmptyOrNull || (index < 0 || this!.data!.length <= index)) {
      return null;
    }
    return this!.data![index];
  }

  ApiPageResponse<T> reverseWithCondition({bool reverse = true}) {
    return ApiPageResponse<T>(
      data: reverse ? (this?.data ?? []).reversed.toList() : (this?.data ?? []),
      errors: this?.errors,
      message: this?.message,
      meta: this?.meta,
      status: this?.status,
    );
  }

  ///
  /// Insert one or list
  ///
  ApiPageResponse<T> insertPage(ApiPageResponse<T> newList,
      {bool Function(T element)? removeDuplicate}) {
    if (newList.meta?.currentPage == 1) return newList;
    return ApiPageResponse<T>(
      status: this?.status,
      errors: this?.errors,
      message: this?.message,
      data: <T>[...(this?.data ?? []), ...(newList.data ?? [])]
          .where((element) => !(removeDuplicate?.call(element) ?? false))
          .toList(),
      meta: newList.meta,
    );
  }

  ApiPageResponse<T> insertFirst(T data,
      {bool Function(T element)? removeIfDuplicate}) =>
      ApiPageResponse<T>(
        status: this?.status,
        errors: this?.errors,
        message: this?.message,
        data: <T>[
          data,
          ...(this?.data ?? [])
              .where((element) => !(removeIfDuplicate?.call(element) ?? false))
              .toList()
        ],
        meta: (this?.meta ??
            const Meta(currentPage: 1, totalCount: 0, totalPages: 1))
            .copyWith(totalCount: (this?.meta?.totalCount ?? 0) + 1),
      );
  ApiPageResponse<T> insertLast(T data,
      {bool Function(T element)? removeDuplicate}) =>
      ApiPageResponse<T>(
        status: this?.status,
        errors: this?.errors,
        message: this?.message,
        data: <T>[...(this?.data ?? []), data]
            .where((element) => !(removeDuplicate?.call(element) ?? false))
            .toList(),
        meta: (this?.meta ??
            const Meta(currentPage: 1, totalCount: 0, totalPages: 1))
            .copyWith(totalCount: (this?.meta?.totalCount ?? 0) + 1),
      );

  ///
  /// Delete a element
  ///
  ApiPageResponse<T> delete(bool Function(T element) condition) =>
      ApiPageResponse<T>(
          status: this?.status,
          message: this?.message,
          meta: this?.meta,
          errors: this?.errors,
          data: <T>[...(this?.data ?? [])]
              .where((element) => !condition(element))
              .toList());

  ///
  /// Update a element
  ///
  ApiPageResponse<T> update(
      T Function(T element) onUpdate, bool Function(T element) condition) =>
      ApiPageResponse<T>(
          status: this?.status,
          message: this?.message,
          meta: this?.meta,
          errors: this?.errors,
          data: <T>[...(this?.data ?? [])]
              .map(
                  (element) => condition(element) ? onUpdate(element) : element)
              .toList());
}
