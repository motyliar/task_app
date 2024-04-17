import 'package:bloc/bloc.dart';

class SwitchButtonCubit extends Cubit<bool> {
  SwitchButtonCubit() : super(false);

  void changePriority() {
    emit(!state);
  }
}
