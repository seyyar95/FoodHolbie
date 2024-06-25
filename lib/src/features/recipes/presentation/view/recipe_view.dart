import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/daily_suggestion/daily_suggestion_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/search_recipe/search_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/widgets/recipe_card.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/snackbars.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/loading_overlay.dart';
import 'package:foodmania/src/utils/responsive.dart';

import '../../domain/entity/recipe_entity.dart';
import '../bloc/save_recipe/save_recipe_bloc.dart';

@RoutePage()
class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late final SearchRecipeBloc _recipeBloc;
  final TextEditingController _searchController = TextEditingController();
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  void initState() {
    super.initState();
    _recipeBloc = BlocProvider.of<SearchRecipeBloc>(context);
    BlocProvider.of<DailySuggestionBloc>(context)
        .add(const DailySuggestionEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _recipeBloc.close();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context
                .read<DailySuggestionBloc>()
                .add(const DailySuggestionEvent());
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              SizedBox(
                height: 24.h,
              ),
              _buildSearchField(),
              SizedBox(
                height: 25.h,
              ),
              _buildSectionTitle("Gündəlik tövsiyyələr"),
              BlocBuilder<DailySuggestionBloc, DailySuggestionState>(
                builder: (context, state) {
                  if (state is DailySuggestionSuccess) {
                    final List<RecipeEntity> recipes = state.recipes!;
                    return SizedBox(
                      height: (recipes.length / 2).round() * 190,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.mediaQueryWidth < 400
                              ? 2
                              : context.mediaQueryWidth ~/ 200,
                          childAspectRatio: 1,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) => RecipeCard(
                          name: recipes[index].name,
                          id: recipes[index].id!,
                          url: recipes[index].url,
                        ),
                        itemCount: recipes.length,
                      ),
                    );
                  } else if (state is DailySuggestionFailed) {
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
      ),
    );
  }

  Align _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: ConstantTextTheme.displayMedium?.copyWith(
          fontSize: 16,
          letterSpacing: -0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return BlocListener<SearchRecipeBloc, SearchRecipeState>(
      listener: (context, state) {
        if (state is SearchRecipeSuccess) {
          _loadingOverlay.hide();
          context.router.push(ResultsRoute(recipes: state.recipes!));
        } else if (state is SearchRecipeInProgress) {
          _loadingOverlay.show(context);
        } else if (state is SearchRecipesFailed) {
          _loadingOverlay.hide();
          showErrorSnack(context, errorText: state.error!.error.toString());
        } else {
          _loadingOverlay.hide();
        }
      },
      child: TextField(
        controller: _searchController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            _recipeBloc.add(
              SearchRecipeByNameInput(value),
            );
          } else {
            showErrorSnack(context, errorText: 'Boşluğu doldur');
          }
        },
        style: ConstantTextTheme.displayMedium,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          filled: true,
          fillColor: const Color(0xFFD7D7D7).withOpacity(0.2),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.r),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 8,
            ),
            child: Responsive(
              maxWidth: 22,
              child: SizedBox(
                height: 16,
                width: 16.w,
                child: SvgPicture.asset(
                  "assets/components/search_icon.svg",
                ),
              ),
            ),
          ),
          hintText: "Search any recipe",
        ),
      ),
    );
  }
}
