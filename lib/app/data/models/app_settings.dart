import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/app_links.dart';
import '_hive_type_ids.dart';

part 'app_settings.g.dart';

@HiveType(typeId: appSettingsTypeId)
class AppSettings extends HiveObject {
  @HiveField(1)
  late List<String>? appBG;

  @HiveField(2)
  late List<String>? contactUs;

  @HiveField(4)
  late AppLinks? appLinks;
}
