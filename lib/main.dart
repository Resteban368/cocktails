import 'package:cocktails_app/blocs/bloc/cocktail_bloc.dart';
import 'package:cocktails_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main()async  {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}



class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => CocktailBloc()),
     
    ], child: const MainApp());
  }
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      //quitar el banner de debug
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
     theme: ThemeData.light(),


      
    );
  }
}
