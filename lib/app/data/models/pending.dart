import 'package:majorica/app/data/models/room_package.dart';

class PendingRoom {
  final int id;
  final String? name;
  final int? sleeps;
  final String? image;
  final double? total;
  final DateTime? startDate;
  final DateTime? endDate;
  final RoomPackage? roomPackage;
  ReserveInfo? reserveInfo;

  PendingRoom({
    required this.id,
    required this.name,
    required this.sleeps,
    required this.image,
    required this.total,
    required this.startDate,
    required this.endDate,
    required this.roomPackage,
    this.reserveInfo,
  });
}

class ReserveInfo {
  int? groupId;
  int? nightsTotal;
  int? nightsFinalPrice;
  Map<String, dynamic>? nightPrices;
  int? packageId;
  int? packagePrice;
  bool? offer;
  String? offerName;

  ReserveInfo({
    this.groupId,
    this.nightsTotal,
    this.nightsFinalPrice,
    this.nightPrices,
    this.packageId,
    this.packagePrice,
    this.offer,
    this.offerName,
  });

  ReserveInfo.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    nightsTotal = json['nightsTotal'];
    nightsFinalPrice = json['nightsFinalPrice'];
    nightPrices = json['nightPrices'];
    offer = json['offer'];
    offerName = json['offerName'];
    packagePrice = json['packagePrice'];
  }
}
