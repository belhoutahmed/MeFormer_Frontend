import 'package:equatable/equatable.dart';

abstract class StudentAuthEvent extends Equatable {
  const StudentAuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginStudentRequested extends StudentAuthEvent {
  final String email;
  final String password;

  const LoginStudentRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class RegisterStudentRequested extends StudentAuthEvent {
  final Map<String, dynamic> studentData;

  const RegisterStudentRequested(this.studentData);

  @override
  List<Object?> get props => [studentData];
}

class LogoutStudentRequested extends StudentAuthEvent {}
