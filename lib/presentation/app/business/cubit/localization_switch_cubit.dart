import 'package:bloc/bloc.dart';

const String _polishLanguage = 'pl';
const String _englishLanguage = 'en';

class LocalizationSwitchCubit extends Cubit<String> {
  LocalizationSwitchCubit() : super(_englishLanguage);

  void changeLanguage() {
    if (state == _polishLanguage) {
      emit(_englishLanguage);
    } else {
      emit(_polishLanguage);
    }
  }
}
