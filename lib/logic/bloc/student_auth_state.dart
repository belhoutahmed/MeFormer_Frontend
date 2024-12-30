import 'package:equatable/equatable.dart';

abstract class StudentAuthState extends Equatable {
  const StudentAuthState();

  @override
  List<Object?> get props => [];
}

class StudentAuthInitial extends StudentAuthState {}

class StudentAuthLoading extends StudentAuthState {}

class StudentAuthSuccess extends StudentAuthState {
  final String token;

  const StudentAuthSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

class StudentAuthRegistered extends StudentAuthState {}

class StudentAuthFailure extends StudentAuthState {
  final String errorMessage;

  const StudentAuthFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
