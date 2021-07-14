class AvailableRoomDetails {
  int? count;
  double? price;

  AvailableRoomDetails({
    this.count,
    this.price,
  });

  AvailableRoomDetails.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    price = double.tryParse(json['price'].toString()) ?? 0.0;
  }
}
