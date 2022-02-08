import 'waste.dart';

class Pickup {
  final int? addressId;
  //final Address address;
  final String? date;
  final String? timeBegin;
  final String? timeEnd;
  final List<PickupBag>? pickupBag;
  final String? noteForDriver;
  final int? id;
  final int? newBags;
  Pickup({
    // this.address,
    this.addressId,
    this.newBags,
    this.date,
    this.timeBegin,
    this.timeEnd,
    this.pickupBag,
    this.noteForDriver,
    this.id,
  });

  Map<dynamic, dynamic> toMap() {
    return {
      'address_id': addressId ?? '',
      'this.newBags': this.newBags ?? '',
      //'address': address.toMap() ?? null,
      'date': date ?? '',
      'timeBegin': timeBegin ?? '',
      'timeEnd': timeEnd ?? '',
      "pickupBag": List<dynamic>.from(pickupBag!.map((x) => x.toMap())),
      'noteForDriver': noteForDriver ?? '',
      'newBags': newBags ?? 0
    };
  }

  factory Pickup.fromJson(Map<dynamic, dynamic> json) {
    return Pickup(
      addressId: json['address_id'] as int,
      //address: Address.fromJson(json['address']),
      date: json['order_date'] as String,
      timeBegin: json['order_start_time'] as String,
      timeEnd: json['order_time_end'] as String,
      pickupBag: List<PickupBag>.from(
          json["pickup_bag"].map((x) => PickupBag.fromJson(x))),
      noteForDriver: json['comment_customer'] as String,
      newBags: json['newBags'] as int,
      id: json['id'] as int,
    );
  }
}
