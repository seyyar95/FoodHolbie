import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';
import 'package:foodmania/src/features/recipes/presentation/widgets/recipe_card.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';

@RoutePage()
class ResultsView extends StatelessWidget {
  final List<RecipeEntity> recipes;
  const ResultsView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 50,
          splashRadius: 25,
          icon: SvgPicture.asset(
            "assets/components/back-button-2.svg",
          ),
          onPressed: () => context.router.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.mediaQueryWidth < 400
                ? 2
                : context.mediaQueryWidth ~/ 200,
            childAspectRatio: 1.2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => RecipeCard(
            name: recipes[index].name,
            preparationTime: recipes[index].time,
          ),
          itemCount: recipes.length,
        ),
      ),
    );
  }
}
