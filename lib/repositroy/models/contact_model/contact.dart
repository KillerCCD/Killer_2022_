class Contact {
  int id;
  String number;

  Contact({
    this.id,
    this.number,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      number: json['number'],
    );
  }
  Map toMap() {
    return {
      'id': id ?? '',
      'phoneNumber': number ?? ' ',
    };
  }
}
