import 'package:json_annotation/json_annotation.dart';

import 'sort.dart';

part 'pageable.g.dart';

@JsonSerializable()
class Pageable {
  final Sort sort;
  final int pageSize;
  final int pageNumber;
  final int offset;
  final bool paged;
  final bool unpaged;

  Pageable(this.sort, this.pageSize, this.pageNumber, this.offset, this.paged, this.unpaged);

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}
