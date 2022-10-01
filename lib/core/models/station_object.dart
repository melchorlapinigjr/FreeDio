import 'package:equatable/equatable.dart';

class StationObject extends Equatable {
  String? name;
  String? url;
  String? image;

  StationObject({this.name, this.url, this.image});

  factory StationObject.fromJson(Map<String, dynamic> json) => StationObject(
        name: json['name'],
        url: json['url'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'image': image,
      };

  @override
  List<Object?> get props => [name, url, image];
}
