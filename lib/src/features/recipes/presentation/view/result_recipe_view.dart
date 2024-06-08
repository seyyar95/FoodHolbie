import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe_bloc/home_recipe_bloc.dart';

@RoutePage()
class ResultRecipeView extends StatefulWidget {
  const ResultRecipeView({super.key});

  @override
  State<ResultRecipeView> createState() => _ResultRecipeViewState();
}

class _ResultRecipeViewState extends State<ResultRecipeView> {
  late List list;
  @override
  void initState() {
    super.initState();
    list = BlocProvider.of<HomeRecipeBloc>(context).state.recipes!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Text(list.length.toString()),
        ),
      ),
    );
  }
}
