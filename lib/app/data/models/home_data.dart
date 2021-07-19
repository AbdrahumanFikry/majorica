class HomeData {
  List<MyRooms>? myRooms;
  String? wiFiName;
  Map<String, String>? requests;

  HomeData({
    this.myRooms,
    this.wiFiName,
    this.requests,
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['myRooms'] != null) {
      myRooms = <MyRooms>[];
      json['myRooms'].forEach((v) {
        myRooms!.add(MyRooms.fromJson(v));
      });
    }
    wiFiName = json['WiFiName'];
    requests = json['requests'];
  }
}

class MyRooms {
  String? iD;
  String? roomNumber;
  String? checkoutDate;
  String? wifiPassword;
  bool? dND;
  bool? requestable;
  String? status;
  String? statusColor;

  MyRooms({
    this.iD,
    this.roomNumber,
    this.checkoutDate,
    this.wifiPassword,
    this.dND,
    this.requestable,
    this.status,
    this.statusColor,
  });

  MyRooms.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    roomNumber = json['roomNumber'];
    checkoutDate = json['checkoutDate'];
    wifiPassword = json['WifiPassword'];
    dND = json['DND'];
    requestable = json['requestable'];
    status = json['status'];
    statusColor = json['statusColor'];
  }
}
