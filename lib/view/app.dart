import 'package:flutter/material.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/auth/signIn/sign_in_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pro Mentors',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.white,
            surfaceTintColor: AppColor.white,
            actionsIconTheme:
                IconThemeData(color: Color.fromARGB(255, 45, 78, 104)),
          ),
          scaffoldBackgroundColor: AppColor.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        // initialRoute: AppRoutes.splash,
        // onGenerateRoute: AppRoutes.generateRoute,
        home: const ResponsiveWrapper());
  }
}

class ResponsiveWrapper extends StatelessWidget {
  const ResponsiveWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double mobileWidth = 480.0;
        return Center(
          child: SizedBox(
            width: constraints.maxWidth > mobileWidth
                ? mobileWidth
                : constraints.maxWidth,
            child: SignInPage(),
          ),
        );
      },
    );
  }
}
