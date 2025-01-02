import 'package:bookly_app_clean/Core/utils/functions/simple_bloc_observer.dart';
import 'package:bookly_app_clean/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_clean/Features/splash/presentation/views/splash_screen.dart';
import 'package:bookly_app_clean/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'Core/utils/functions/set_up_service_locator.dart';
import 'Features/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'Features/home/presentation/manager/fetch_newest_books_cubit/newest_books_cubit.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setUpServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
            FeaturedBooksCubit(FetchFeaturedBooksUseCase(
            getIt.get<HomeRepoImpl>()),
            ),),
        BlocProvider(create: (context) =>
            NewestBooksCubit(FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>()),
            ),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(color: kPrimaryColor)),
        home: const SplashScreen(),
      ),
    );
  }
}


