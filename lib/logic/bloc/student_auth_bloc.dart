import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/student_auth_repository.dart';
import 'student_auth_event.dart';
import 'student_auth_state.dart';


class StudentAuthBloc extends Bloc<StudentAuthEvent, StudentAuthState> {
  final StudentAuthRepository studentAuthRepository;

  StudentAuthBloc({required this.studentAuthRepository})
      : super(StudentAuthInitial()) {
    on<LoginStudentRequested>(_onLoginStudentRequested);
    on<RegisterStudentRequested>(_onRegisterStudentRequested);
    on<LogoutStudentRequested>(_onLogoutStudentRequested);
  }

  Future<void> _onLoginStudentRequested(
      LoginStudentRequested event, Emitter<StudentAuthState> emit) async {
    emit(StudentAuthLoading());
    try {
      final token = await studentAuthRepository.login(event.email, event.password);
      emit(StudentAuthSuccess(token: token));
    } catch (e) {
      emit(StudentAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onRegisterStudentRequested(
      RegisterStudentRequested event, Emitter<StudentAuthState> emit) async {
    emit(StudentAuthLoading());
    try {
      await studentAuthRepository.register(event.studentData);
      emit(StudentAuthRegistered());
    } catch (e) {
      emit(StudentAuthFailure(errorMessage: e.toString()));
    }
  }

  void _onLogoutStudentRequested(
      LogoutStudentRequested event, Emitter<StudentAuthState> emit) {
    emit(StudentAuthInitial());
  }
}
