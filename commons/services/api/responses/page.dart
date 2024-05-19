import 'package:json_annotation/json_annotation.dart';

import 'pageable.dart';
import 'sort.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  final List content;
  final Pageable pageable;
  final int totalPages;
  final int totalElements;
  final bool last;
  final int size;
  final int number;
  // final bool first;
  final Sort sort;
  final int numberOfElements;
  final bool empty;

  Page(this.content, this.pageable, this.totalPages, this.totalElements, this.last, this.size, this.number, this.sort, this.numberOfElements, this.empty);

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  static Page get construct => Page([], Pageable(Sort(false, false, false), 0, 0, 0, false, false), 0, 0, false, 0, 0, Sort(false, false, false), 0, false);
}
