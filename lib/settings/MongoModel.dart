// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MongoModel {
  final String hotelName;
  final String hotelImg;
  final String hotelAlamat;
  final String hotelDeskripsi;

  MongoModel({
    required this.hotelName,
    required this.hotelImg,
    required this.hotelAlamat,
    required this.hotelDeskripsi,
  });

  MongoModel copyWith({
    String? hotelName,
    String? hotelImg,
    String? hotelAlamat,
    String? hotelDeskripsi,
  }) {
    return MongoModel(
      hotelName: hotelName ?? this.hotelName,
      hotelImg: hotelImg ?? this.hotelImg,
      hotelAlamat: hotelAlamat ?? this.hotelAlamat,
      hotelDeskripsi: hotelDeskripsi ?? this.hotelDeskripsi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hotelName': hotelName,
      'hotelImg': hotelImg,
      'hotelAlamat': hotelAlamat,
      'hotelDeskripsi': hotelDeskripsi,
    };
  }

  factory MongoModel.fromMap(Map<String, dynamic> map) {
    return MongoModel(
      hotelName: map['hotelName'] as String,
      hotelImg: map['hotelImg'] as String,
      hotelAlamat: map['hotelAlamat'] as String,
      hotelDeskripsi: map['hotelDeskripsi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MongoModel.fromJson(String source) =>
      MongoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MongoModel(hotelName: $hotelName, hotelImg: $hotelImg, hotelAlamat: $hotelAlamat, hotelDeskripsi: $hotelDeskripsi)';
  }

  @override
  bool operator ==(covariant MongoModel other) {
    if (identical(this, other)) return true;

    return other.hotelName == hotelName &&
        other.hotelImg == hotelImg &&
        other.hotelAlamat == hotelAlamat &&
        other.hotelDeskripsi == hotelDeskripsi;
  }

  @override
  int get hashCode {
    return hotelName.hashCode ^
        hotelImg.hashCode ^
        hotelAlamat.hashCode ^
        hotelDeskripsi.hashCode;
  }
}
