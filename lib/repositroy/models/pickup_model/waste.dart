class PickupBag {
  int id;
  String bagCode;
  String wasteType;

  PickupBag({
    this.id,
    this.bagCode,
    this.wasteType,
  });

  factory PickupBag.fromJson(Map<String, dynamic> json) => PickupBag(
        id: json["id"] ?? '',
        bagCode: json["bag_code"] ?? '',
        wasteType: json["waste_type"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? '',
        "bag_code": bagCode ?? '',
        "waste_type": wasteType ?? '',
      };
  PickupBag copyWith({
    int id,
    String bagCode,
    String wasteType,
  }) {
    return PickupBag(
      id: id ?? this.id,
      bagCode: bagCode ?? this.bagCode,
      wasteType: wasteType ?? this.wasteType,
    );
  }
}
