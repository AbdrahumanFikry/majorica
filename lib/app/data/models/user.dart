import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import '_hive_type_ids.dart';

part 'user.g.dart';

@HiveType(typeId: userTypeId)
class User extends HiveObject {
  @HiveField(1)
  late String name;

  @HiveField(2)
  late bool payBalance;

  @HiveField(3)
  late int points;

  @HiveField(4)
  late String sessionID;
}
