class ClosetModel {
  final int id;
  final String title;
  final String createdAt;
  final String updatedAt;

  ClosetModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClosetModel.fromJson(Map<String, dynamic> json) {
    return ClosetModel(
      id: json['id'],
      title: json['title'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
