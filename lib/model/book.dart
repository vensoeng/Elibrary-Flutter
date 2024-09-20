import 'package:Elibrary/model/closet.dart';
import 'package:Elibrary/model/floor.dart';
import 'package:Elibrary/model/range.dart';

class BookModel {
  final dynamic id;
  final String title;
  final String descript;
  final dynamic length;
  final dynamic star;
  final int range_id;
  final int closet_id;
  final int floor_id;
  final int popular;
  final String img;
  final String create;
  final String update;
  final RangeModel range;
  final ClosetModel closet;
  final FloorModel floor;

  BookModel(
      {required this.id,
      required this.title,
      required this.descript,
      required this.length,
      required this.star,
      required this.range_id,
      required this.closet_id,
      required this.floor_id,
      required this.popular,
      required this.img,
      required this.closet,
      required this.range,
      required this.floor,
      required this.create,
      required this.update});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      descript: json['descript'],
      length: json['length'],
      star: json['star'],
      range_id: json['range_id'],
      closet_id: json['closet_id'],
      floor_id: json['floor_id'],
      popular: json['popular'],
      img: json['img'],
      range: RangeModel.fromJson(json['range']),
      closet: ClosetModel.fromJson(json['closet']),
      floor: FloorModel.fromJson(json['floor']),
      create: json['created_at'],
      update: json['updated_at'],
    );
  }
}
