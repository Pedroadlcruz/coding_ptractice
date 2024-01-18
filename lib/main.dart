import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mamagement_challenge/users/organizations_cubit/organizations_cubit.dart';
import 'package:state_mamagement_challenge/users/users_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => OrganizationsCubit(),
        child: const UsersScreen(),
      ),
    );
  }
}
