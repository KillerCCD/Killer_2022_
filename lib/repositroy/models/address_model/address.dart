class Address {
  String customerAddress;
  String building;
  String apartment;
  String floor;
  String entrance;
  String comment;
  String latitude;

  String longitude;
  String placeId;
  int id;

  Address(
      {this.customerAddress,
      this.building,
      this.latitude,
      this.longitude,
      this.apartment,
      this.floor,
      this.entrance,
      this.comment,
      this.placeId,
      this.id});

  bool isExpanded = false;

  Map toMap() {
    return {
      'customer_address': customerAddress ?? '',
      'building': building,
      'apartment': apartment ?? '',
      'floor': floor ?? '',
      'entrance': entrance ?? '',
      'comment': comment ?? '',
      'latitude': latitude ?? '',
      'longitude': longitude ?? '',
      'placeId': placeId ?? '',
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      customerAddress: json['customer_address'] as String,
      building: json['building'] as String,
      apartment: json['apartment'] as String,
      floor: json['floor'] as String,
      entrance: json['entrance'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      placeId: json['placeId'] as String,
      id: json['id'] as int,
    );
  }
}
