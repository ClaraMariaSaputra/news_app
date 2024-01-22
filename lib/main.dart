import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/bloc/splash/splash_cubit.dart';
import 'package:news_app/pages/splash_page.dart';
import 'package:sizer/sizer.dart';
import 'injection.dart' as git;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  git.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => git.locator<SplashCubit>()..init(),
          ),
          BlocProvider(
            create: (context) => git.locator<NewsBloc>(),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return GlobalLoaderOverlay(
              overlayColor: Colors.black.withOpacity(0.4),
              useDefaultLoading: true,
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "News App",
                home: SplashPage(),
              ),
            );
          },
        ));
  }
}
