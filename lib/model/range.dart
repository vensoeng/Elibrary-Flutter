class RangeModel {
  final int id;
  final String title;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  RangeModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory RangeModel.fromJson(Map<String, dynamic> json) {
    return RangeModel(
      id: json['id'],
      title: json['title'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
