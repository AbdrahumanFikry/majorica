class MyReservations {
  List<Reservation>? upComming;
  List<Reservation>? past;

  MyReservations({
    this.upComming,
    this.past,
  });

  MyReservations.fromJson(Map<String, dynamic> json) {
    if (json['upcomming'] != null) {
      upComming = <Reservation>[];
      json['upcomming'].forEach((v) {
        upComming!.add(Reservation.fromJson(v));
      });
    }
    if (json['past'] != null) {
      past = <Reservation>[];
      json['past'].forEach((v) {
        past!.add(Reservation.fromJson(v));
      });
    }
  }
}

class Reservation {
  String? iD;
  String? date;
  DateTime? checkIn;
  DateTime? checkOut;
  String? reservationTotal;
  List<ReservationDetails>? reservation;
  String? sleeps;
  String? roomType;
  String? roomPackage;
  String? offerName;
  String? statusText;
  String? statusColor;
  PaymentDetails? paymentDetails;
  String? refundable;
  String? refundableColor;

  Reservation({
    this.iD,
    this.date,
    this.checkIn,
    this.checkOut,
    this.reservationTotal,
    this.reservation,
    this.sleeps,
    this.roomType,
    this.roomPackage,
    this.offerName,
    this.statusText,
    this.statusColor,
    this.paymentDetails,
    this.refundable,
    this.refundableColor,
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    date = json['Date'];
    checkIn = DateTime.tryParse(json['CheckIn'].toString());
    checkOut = DateTime.tryParse(json['CheckOut'].toString());
    reservationTotal = json['ReservationTotal'];
    if (json['Reservation'] != null) {
      reservation = <ReservationDetails>[];
      json['Reservation'].forEach((v) {
        reservation!.add(ReservationDetails.fromJson(v));
      });
    }
    sleeps = json['Sleeps'];
    roomType = json['RoomType'];
    roomPackage = json['RoomPackage'];
    offerName = json['OfferName'];
    statusText = json['StatusText'];
    statusColor = json['StatusColor'];
    paymentDetails = json['paymentDetails'] != null
        ? PaymentDetails.fromJson(json['paymentDetails'])
        : null;
    refundable = json['Refundable'];
    refundableColor = json['RefundableColor'];
  }
}

class ReservationDetails {
  String? date;
  int? price;

  ReservationDetails({
    this.date,
    this.price,
  });

  ReservationDetails.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    price = json['Price'];
  }
}

class PaymentDetails {
  String? paymentID;
  String? paymentAmount;
  String? reservationIDs;
  String? orderRefID;

  PaymentDetails({
    this.paymentID,
    this.paymentAmount,
    this.reservationIDs,
    this.orderRefID,
  });

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    paymentID = json['PaymentID'];
    paymentAmount = json['PaymentAmount'];
    reservationIDs = json['ReservationIDs'];
    orderRefID = json['OrderRefID'];
  }
}
