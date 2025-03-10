extension ListExt<T> on List<T>? {
  ///
  /// Check null or empty
  ///
  bool get isEmptyOrNull => this == null || this!.isEmpty;
  bool get isNotEmptyOrNull => this != null && this!.isNotEmpty;
  bool get isOnlyEmpty => this != null && this!.isEmpty;

  ///
  /// Get element
  ///
  T? firstOrElseNull(bool Function(T element) condition) {
    for (T element in this ?? []) {
      if (condition(element)) return element;
    }
    return null;
  }

  T? lastOrElseNull(bool Function(T element) condition) {
    for (T element in (this ?? []).reversed) {
      if (condition(element)) return element;
    }
    return null;
  }

  T? elementAtIndexOrElseNull(int index) {
    if (this.isEmptyOrNull || (index < 0 || this!.length <= index)) return null;
    return this![index];
  }

  List<T> reverseWithCondition({bool reverse = true}) {
    if (reverse) {
      return (this ?? []).reversed.toList();
    }
    return this ?? [];
  }

  ///
  /// Insert one or list
  ///
  List<T> insertList(List<T> newList) => [...(this ?? []), ...newList];
  List<T> insertFirst(T data) => [data, ...(this ?? [])];
  List<T> insertLast(T data) => [...(this ?? []), data];

  ///
  /// Delete
  ///
  List<T> deleteAt(int index) {
    if (this.isEmptyOrNull || (index < 0 || this!.length <= index)) return [];
    List<T> newList = [...this!];
    newList.removeAt(index);
    return newList;
  }

  List<T> delete(bool Function(T element) condition) =>
      (this ?? []).where((element) => !condition(element)).toList();

  ///
  /// Update
  ///
  List<T> update(
          T Function(T element) onUpdate, bool Function(T element) condition) =>
      <T>[...(this ?? [])]
          .map((element) => condition(element) ? onUpdate(element) : element)
          .toList();

  List<T> updateAt(T Function(T element) onUpdate, int index) {
    if (this.isEmptyOrNull || (index < 0 || this!.length <= index)) return [];
    List<T> newList = [...this!];
    newList[index] = onUpdate(newList[index]);
    return newList;
  }

  ///
  /// Remove duplicate element
  ///
  List<T> removeDuplicate(String Function(T element) primaryKey,
      String Function(T element) identify) {
    final distinctPrimaryKeys =
        (this ?? []).map((element) => identify(element)).toSet().toList();
    return (this ?? [])
        .where((element) => distinctPrimaryKeys.contains(primaryKey(element)))
        .toList();
  }

  List<T> toggle(T data, String Function(T) identify) {
    if ((this ?? []).any((element) => identify(element) == identify(data))) {
      return this!
          .where((element) => identify(element) != identify(data))
          .toList();
    } else {
      return [...(this ?? []), data];
    }
  }
}
