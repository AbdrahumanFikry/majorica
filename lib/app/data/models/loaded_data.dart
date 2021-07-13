class AppLoadedData {
  UserViewModel? user;
  AppSettings? appSettings;
  List<RoomGroups>? roomGroups;
  List<RoomPackages>? roomPackages;

  AppLoadedData({
    this.user,
    this.appSettings,
    this.roomGroups,
    this.roomPackages,
  });

  AppLoadedData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserViewModel.fromJson(json['user']) : null;
    appSettings = json['appSettings'] != null
        ? AppSettings.fromJson(json['appSettings'])
        : null;
    if (json['roomGroups'] != null) {
      roomGroups = <RoomGroups>[];
      json['roomGroups'].forEach((v) {
        roomGroups!.add(RoomGroups.fromJson(v));
      });
    }
    if (json['roomPackages'] != null) {
      roomPackages = <RoomPackages>[];
      json['roomPackages'].forEach((v) {
        roomPackages!.add(RoomPackages.fromJson(v));
      });
    }
  }
}

class UserViewModel {
  String? name;
  bool? payBalance;
  int? points;

  UserViewModel({
    this.name,
    this.payBalance,
    this.points,
  });

  UserViewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    payBalance = json['payBalance'];
    points = json['points'];
  }
}

class AppSettings {
  List<String>? appBG;
  AppLinks? appLinks;
  List<String>? contactUs;

  AppSettings({
    this.appBG,
    this.appLinks,
    this.contactUs,
  });

  AppSettings.fromJson(Map<String, dynamic> json) {
    appBG = json['appBG'].cast<String>();
    appLinks =
        json['appLinks'] != null ? AppLinks.fromJson(json['appLinks']) : null;
    contactUs = json['contactus'].cast<String>();
  }
}

class AppLinks {
  String? androidStore;
  String? appleStore;
  String? tOS;

  AppLinks({
    this.androidStore,
    this.appleStore,
    this.tOS,
  });

  AppLinks.fromJson(Map<String, dynamic> json) {
    androidStore = json['androidStore'];
    appleStore = json['appleStore'];
    tOS = json['TOS'];
  }
}

class RoomGroups {
  int? groupId;
  String? name;
  String? desc;
  int? maxSleeps;
  List<String>? images;

  RoomGroups({
    this.groupId,
    this.name,
    this.desc,
    this.maxSleeps,
    this.images,
  });

  RoomGroups.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    name = json['name'];
    desc = json['desc'];
    maxSleeps = json['maxSleeps'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupId'] = groupId;
    data['name'] = name;
    data['desc'] = desc;
    data['maxSleeps'] = maxSleeps;
    data['images'] = images;
    return data;
  }
}

class RoomPackages {
  int? packageId;
  String? name;
  int? price;

  RoomPackages({
    this.packageId,
    this.name,
    this.price,
  });

  RoomPackages.fromJson(Map<String, dynamic> json) {
    packageId = json['packageId'];
    name = json['name'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['packageId'] = packageId;
    data['name'] = name;
    data['Price'] = price;
    return data;
  }
}
