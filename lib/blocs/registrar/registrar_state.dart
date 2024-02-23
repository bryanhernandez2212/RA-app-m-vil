part of 'registrar_bloc.dart';

class RegistrarState extends Equatable {
  final String errorFullName;
  final String errorEmail;
  final String errorPassword;
  final String errorRepetirPassword;
  final String message;
  final String fullName;
  final String email;
  final String password;
  final String repeatPassword;


  const RegistrarState({
    required this.message,
    required this.errorFullName,
    required this.errorEmail,
    required this.errorPassword,
    required this.errorRepetirPassword,
    required this.fullName,
    required this.email,
    required this.password,
    required this.repeatPassword,

  });
  RegistrarState copyWith({
    String? message,
    String? errorFullName,
    String? errorEmail,
    String? errorPassword,
    String? errorRepetirPassword,
    String? fullName,
    String? email,
    String? password,
    String? repeatPassword,


  }) =>
      RegistrarState(
        message:  message ?? this.message,
          errorFullName: errorFullName ?? this.errorFullName,
          errorEmail: errorEmail ?? this.errorEmail,
          errorPassword: errorPassword ?? this.errorPassword,
          errorRepetirPassword:
              errorRepetirPassword ?? this.errorRepetirPassword,
          fullName:fullName ?? this.fullName,
          email:email ?? this.email,
          password:password ?? this.password,
          repeatPassword:repeatPassword ?? this.repeatPassword,          

      );
  @override
  List<Object> get props =>
      [errorEmail, errorFullName, errorPassword, errorRepetirPassword, message,fullName,email,password,repeatPassword];
}
