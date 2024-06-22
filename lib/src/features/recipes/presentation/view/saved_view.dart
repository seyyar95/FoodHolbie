import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/get_saved/get_saved_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/save_recipe/save_recipe_bloc.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';

import '../widgets/recipe_card.dart';

@RoutePage()
class SavedView extends StatefulWidget {
  const SavedView({super.key});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  void initState() {
    context.read<GetSavedBloc>().add(const GetSavedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 30, left: 10),
          child: Text(
            'My Saved Recipes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetSavedBloc>().add(const GetSavedEvent());
        },
        child: ListView(
          children: [
            BlocBuilder<GetSavedBloc, GetSavedState>(
              builder: (context, state) {
                if (state is GetSavedSuccess) {
                  final List<RecipeEntity> recipes = state.recipes!;
                  Saved.savedRecipes = state.recipes!
                      .map(
                        (e) => e.id!,
                      )
                      .toSet();
                  return SizedBox(
                    height: (recipes.length / 2).round() * 180,
                    child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 15),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.mediaQueryWidth < 400
                            ? 2
                            : context.mediaQueryWidth ~/ 200,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) =>
                          BlocBuilder<SaveRecipeBloc, SaveRecipeState>(
                        builder: (context, state) {
                          return RecipeCard(
                            name: recipes[index].name,
                            id: recipes[index].id!,
                            url: recipes[index].url,
                          );
                        },
                      ),
                      itemCount: recipes.length,
                    ),
                  );
                } else if (state is GetSavedFailed) {
                  return Center(
                    child: Text(
                      state.error!.message.toString(),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
