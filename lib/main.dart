import 'package:elden_ring_cl/features/boss/presentation/bloc/home_bosses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/boss/presentation/pages/bosses_screen.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  // Needs to initiate the [Dependency Injection] before the app start
  // To make every single dependency registered before the UI
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<HomeBossesBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BossesScreen',
        home: const BossesScreen(),
      ),
    );
  }
}
