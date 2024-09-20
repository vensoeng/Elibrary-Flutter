class FloorModel {
  final int id;
  final String title;
  final String createdAt;
  final String updatedAt;

  FloorModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
      id: json['id'],
      title: json['title'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
