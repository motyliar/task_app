import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_button_state.dart';

class SwitchButtonCubit extends Cubit<SwitchButtonState> {
  SwitchButtonCubit() : super(SwitchButtonState(deadline: DateTime.now()));

  void changePriority() {
    emit(state.copyWith(isPriority: !state.isPriority));
  }

  void changeDeadline(DateTime deadline) {
    emit(state.copyWith(deadline: deadline));
  }
}
