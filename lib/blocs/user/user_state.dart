part of 'user_bloc.dart';

class UserState extends Equatable{
  final String fullName;
  final String email;
  final String contenido;
  const UserState ({
    required this.fullName,
    required this.email,
    required this.contenido,
  });

  UserState copyWith({
    String? fullName,
    String? email,
    String? contenido,
  }) =>
    UserState(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      contenido: contenido ?? this.contenido,
      );

  @override
  List<Object> get props => [fullName, email, contenido];
}