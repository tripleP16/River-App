import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
    initialLocation: '/',
    routes:  <RouteBase>[
        GoRoute(
            path: '/',
            pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
        ),
        GoRoute(
            path: '/state-provider',
            pageBuilder: (context, state) => const MaterialPage(child: StateProviderScreen()),
        ),
    ]
);