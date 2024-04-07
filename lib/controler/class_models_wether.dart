// city_model.dart

class City {
  String name;
  Map<String, String> localNames;
  double lat;
  double lon;
  String country;
  String state;

  City({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      localNames: Map<String, String>.from(json['local_names']),
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      country: json['country'],
      state: json['state'],
    );
  }
}
