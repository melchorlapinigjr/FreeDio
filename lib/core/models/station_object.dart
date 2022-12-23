import 'package:equatable/equatable.dart';
import 'package:free_radio_philippines/core/models/station_data_object.dart';

class StationObject extends Equatable {
  String? name;
  String? url;
  String? image;
  StationDataObject? stationDataObject;

  StationObject({this.name, this.url, this.image, this.stationDataObject});

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
