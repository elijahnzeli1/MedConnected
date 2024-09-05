import 'package:flutter/material.dart';
import 'package:medconnected/providers/appointment_provider.dart';
import 'package:medconnected/providers/consultation_provider.dart';
import 'package:medconnected/providers/theme_provider.dart';
import 'package:medconnected/providers/user_provider.dart';
import 'package:medconnected/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Import the library that defines NotificationService
import 'package:medconnected/localizations/app_localizations.dart'; // Import the library that defines AppLocalizations

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => ConsultationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class NotificationService {
  Future<void> initialize() async {
    // Add your implementation here
    // For example, you can request permission for notifications
    await _requestNotificationPermission();
    // You can also handle the initialization of other notification-related services
    await _initializeNotificationServices();
  }

  Future<void> _requestNotificationPermission() async {
    // Implement the logic to request notification permission
  }

  Future<void> _initializeNotificationServices() async {
    // Implement the logic to initialize notification services
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _buildSplashScreen() {
    // Define the implementation of the splash screen here
    return Container(); // Replace SplashScreen() with the desired widget for the splash screen
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'MedConnect',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: _buildSplashScreen(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
          ],
        );
      },
    );
  }
}
