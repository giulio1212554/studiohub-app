import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studio_hub/core/auth/auth_provider.dart';
import 'package:studio_hub/core/notifications/notification_service.dart';
import 'package:studio_hub/core/router/app_router.dart';
import 'package:studio_hub/core/supabase/supabase_client.dart';
import 'package:studio_hub/core/theme/app_theme.dart';
import 'package:studio_hub/features/auth/presentation/login_page.dart';
import 'package:studio_hub/features/reminders/data/reminders_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.init();
  await AppSupabase.init();
  runApp(const ProviderScope(child: StudioHubApp()));
}

class StudioHubApp extends ConsumerStatefulWidget {
  const StudioHubApp({super.key});

  @override
  ConsumerState<StudioHubApp> createState() => _StudioHubAppState();
}

class _StudioHubAppState extends ConsumerState<StudioHubApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = ref.read(reminderSettingsProvider);
      NotificationService.instance.scheduleDaily(settings);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return MaterialApp(
        title: 'StudioHub',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: const LoginPage(),
      );
    }

    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'StudioHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
