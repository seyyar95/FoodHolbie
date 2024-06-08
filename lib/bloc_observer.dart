import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver { 
   @override 
   void onEvent(Bloc bloc, Object? event) { 
     super.onEvent(bloc, event); 
     debugPrint('''================== Cubit Event ================== 
 runtimeType : ${bloc.runtimeType} 
 event       : $event 
 =================================================='''); 
   } 
  
   @override 
   void onError(BlocBase bloc, Object error, StackTrace stackTrace) { 
     debugPrint('''================== Cubit Error ================== 
 runtimeType : ${bloc.runtimeType} 
 error       : $error 
 stackTrace  : $stackTrace 
 =================================================='''); 
     super.onError(bloc, error, stackTrace); 
   } 
  
   @override 
   void onChange(BlocBase bloc, Change change) { 
     super.onChange(bloc, change); 
     debugPrint('''================== Cubit Change ================== 
 runtimeType : ${bloc.runtimeType} 
 change      : $change 
 =================================================='''); 
   } 
  
   @override 
   void onTransition(Bloc bloc, Transition transition) { 
     super.onTransition(bloc, transition); 
     debugPrint('''================== Cubit Transition ================== 
 runtimeType : ${bloc.runtimeType} 
 transition  : $transition 
 ======================================================'''); 
   } 
 }