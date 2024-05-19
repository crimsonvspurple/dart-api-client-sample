import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(explicitToJson: true)
class Pagination {
  final String pageSize;
  final String pageNumber;
  final String pageSort;
  final List<String> pageSortValues;

  Pagination(this.pageSize, this.pageNumber, this.pageSort, this.pageSortValues);

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
