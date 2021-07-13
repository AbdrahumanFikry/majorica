import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:flutter/cupertino.dart';

class SettingsRepo extends ActiveRepo<String, dynamic> {
  @override
  String get boxName => 'settings';

  String get cachedLang => getValueById('cachedLang').toString();

  Future setCachedLang(String? value) async => dataBox.put('cachedLang', value);
}
