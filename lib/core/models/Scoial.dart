import 'package:equatable/equatable.dart';class Social extends Equatable {  late String id;  late String name;  late String link;  Social.fromJson(Map<String, dynamic> json)      : id = json['id'],        name = json['name'],        link = json['link'];  @override  List<Object?> get props => [id, name, link];}