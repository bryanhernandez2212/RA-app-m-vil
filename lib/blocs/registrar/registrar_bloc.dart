import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'registrar_event.dart';
part 'registrar_state.dart';

class RegistrarBloc extends Bloc<RegistrarEvent, RegistrarState> {
  RegistrarBloc()
      : super(const RegistrarState(
          message: '',
          errorEmail: '',
          errorFullName: '',
          errorPassword: '',
          errorRepetirPassword: '',
          fullName: '',
          email: '',
          password: '',
          repeatPassword: '',
        )) {
    on<ErrorRegistrarPasswordRepeatEvent>((event, emit) => emit(
          state.copyWith(errorRepetirPassword: event.error),
        ));
    on<ValidoRegistrarPasswordRepeatEvent>(
        (event, emit) => emit(state.copyWith(errorRepetirPassword: '')));

    on<ErrorRegistrarEmailEvent>(
        (event, emit) => emit(state.copyWith(errorEmail: event.error)));

    on<ValidoRegistrarEmailEvent>(
        (event, emit) => emit(state.copyWith(errorEmail: '')));

    on<ErrorRegistrarNameEvent>(
        (event, emit) => emit(state.copyWith(errorFullName: event.error)));

    on<ErrorRegistrarNameEmptyEvent>(
        (event, emit) => emit(state.copyWith(errorFullName: event.error)));
    on<ValidoRegistrarNameEvent>(
        (event, emit) => emit(state.copyWith(errorFullName: '')));
    on<ErrorRegistrarPasswordEvent>(
        (event, emit) => emit(state.copyWith(errorPassword: event.error)));
    on<ErrorRegistrarPasswordShortEvent>(
        (event, emit) => emit(state.copyWith(errorPassword: event.error)));
    on<ValidoRegistrarPasswordEvent>(
        (event, emit) => emit(state.copyWith(errorPassword: '')));

    on<RegistrarMessageEvent>((event, emit) => emit(
      state.copyWith(message: event.message)
    ));

    on<RegistrarFullNameEvent>((event, emit) => emit(state.copyWith(fullName: event.value)));
    on<RegistrarEmailEvent>((event, emit) => emit(state.copyWith(email: event.value)));
    on<RegistrarPassowordEvent>((event, emit) => emit(state.copyWith(password: event.value)));
    on<RegistrarRepeatPasswordEvent>((event, emit) => emit(state.copyWith(repeatPassword: event.value)));
  }
}
