import 'package:crypto_app/services/models/meta/meta.dart';

extension MetaExt on Meta? {
  bool get canNextPage => this == null
      ? false
      : ((this!.nextPage > this!.currentPage) &&
          (this!.totalPages > this!.currentPage));
}
