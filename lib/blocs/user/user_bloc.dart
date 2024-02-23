import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
            fullName: '', email: '', contenido: '',)) {
    on<UserEmailEvent>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
    on<UserFullNameEvent>(
      (event, emit) => emit(state.copyWith(fullName: event.fullName)),
    );
  }
}
