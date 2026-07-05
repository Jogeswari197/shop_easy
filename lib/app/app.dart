import 'package:flutter/material.dart';

import 'router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shop Easy',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}