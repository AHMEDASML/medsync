import 'package:get/get.dart';
import 'package:medsync/global/localization/language/ar_language.dart';
import 'package:medsync/global/localization/language/en_language.dart';
import 'package:medsync/global/localization/language/fr_language.dart';

class LocaleApp implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'ar': AR, 'en': EN, 'fr': FR};
}
