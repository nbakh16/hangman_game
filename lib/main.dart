import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/core.dart';

void main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: AppColor.primary,
  //   ),
  // );

  // await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.providers,
      child: BlocBuilder<GlobalCubit, GlobalState>(
        buildWhen: (previous, current) =>
            (previous.selectedLanguage != current.selectedLanguage) || (previous.themeMode != current.themeMode),
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Hangman',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            locale: state.selectedLanguage.locale,
            // supportedLocales: AppLocalizations.supportedLocales,
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            // themeMode: state.themeMode,
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }
}
