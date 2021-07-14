import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import '_hive_type_ids.dart';

part 'app_links.g.dart';

@HiveType(typeId: appLinksTypeId)
class AppLinks extends HiveObject {
  @HiveField(1)
  late String? androidStore;

  @HiveField(2)
  late String? appleStore;

  @HiveField(3)
  late String? tOS;
}
