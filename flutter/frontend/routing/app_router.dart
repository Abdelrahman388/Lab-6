import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/dependency_injection.dart';
import 'package:frontend/features/login/logic/cubit/login_cubit.dart';
import 'package:frontend/features/login/ui/screens/login_screen.dart';
import 'package:frontend/features/register/logic/cubit/signup_cubit.dart';
import 'package:frontend/features/register/ui/screens/signup_screen.dart';
import '/Users/MAC/Documents/Lab-6/flutter/frontend/routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
    
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<RegisterCubit>(),
                  child: SignupScreen(),
                ));
      
      default:
        return null;
    }
  }
}
