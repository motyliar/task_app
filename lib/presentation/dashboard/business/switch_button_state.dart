part of 'switch_button.dart';

class SwitchButtonState extends Equatable {
  const SwitchButtonState({this.isPriority = false, required this.deadline});
  final bool isPriority;
  final DateTime deadline;

  SwitchButtonState copyWith({bool? isPriority, DateTime? deadline}) =>
      SwitchButtonState(
          isPriority: isPriority ?? this.isPriority,
          deadline: deadline ?? this.deadline);

  @override
  List<Object> get props => [isPriority, deadline];
}
