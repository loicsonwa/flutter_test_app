import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/constants/constants.dart';
import 'package:flutter_test_app/constants/router/app_router.dart';
import 'package:flutter_test_app/constants/theme/color.dart';
import 'package:flutter_test_app/constants/theme/style.dart';
import 'package:flutter_test_app/data/repository/item_repository.dart';
import 'package:flutter_test_app/logic/bloc_observer.dart';
import 'package:flutter_test_app/logic/cubit/item_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarColor: white,
    systemNavigationBarDividerColor: white,
  ));

  HydratedBlocOverrides.runZoned(
        () => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ItemCubit(itemRepo: ItemRepository()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      themeMode: ThemeMode.light,
      theme: ThemeUtils.defaultAppThemeData,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
