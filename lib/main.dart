import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_llm_frontend/presentation/pages/activities_page.dart';
import 'package:tp_llm_frontend/presentation/pages/articles_page.dart';
import 'package:tp_llm_frontend/presentation/pages/chat_page.dart';
import 'package:tp_llm_frontend/presentation/pages/exercises_page.dart';
import 'package:tp_llm_frontend/presentation/pages/home.dart';
import 'package:tp_llm_frontend/presentation/pages/live_courses_page.dart';
import 'package:tp_llm_frontend/presentation/pages/profile_page.dart';
import 'package:tp_llm_frontend/presentation/pages/recommendations_page.dart';
import 'package:tp_llm_frontend/presentation/pages/register_page.dart';
import 'logic/bloc/student_auth_bloc.dart';
import 'logic/repositories/student_auth_repository.dart';
import 'presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => StudentAuthRepository(),
      child: BlocProvider(
        create: (context) => StudentAuthBloc(
          studentAuthRepository: context.read<StudentAuthRepository>(),
        ),
        child: MaterialApp(
          title: 'Education App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const LoginPage(), // Set the main page
          routes: {
            '/main': (context) => const MainPage(),
            '/home': (context) => const Home(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/articles': (context) => const ArticlesPage(),
            '/exercises': (context) => const ExercisesPage(),
            '/liveCourses': (context) => const LiveCoursesPage(),
            '/chat': (context) => const ChatPage(),
            '/recommendations': (context) => const RecommendationsPage(),
            '/activities': (context) => const ActivitiesPage(),
          },
        ),
      ),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),          // Replace with your Home page
    const ArticlesPage(),  // Replace with your Courses page
    const ExercisesPage(), // Replace with your Exercises page
    const ProfilePage(),   // Replace with your Profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}