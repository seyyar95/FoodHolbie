import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe/home_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe/home_recipe_event.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe/home_recipe_state.dart';
import 'package:foodmania/src/features/recipes/presentation/provider/home_view_provider.dart';
import 'package:foodmania/src/features/recipes/presentation/widgets/home_tags.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/shared/widgets/button.dart';
import 'package:foodmania/src/utils/responsive.dart';
import '../../../../utils/constants/snackbars.dart';
import '../../../../utils/loading_overlay.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bool isExpanded = false;
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  late final HomeRecipeBloc _recipeBloc;

  @override
  void initState() {
    super.initState();
    _recipeBloc = BlocProvider.of<HomeRecipeBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _recipeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> chosenItems = context.watch<HomeViewProvider>().items;

    List<String> vegetables = [
      'Flour',
      'Sugar',
      'Eggs',
      'Badimcan',
      'Kartof',
      'Tomato',
      'Cheese',
    ];

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: context.isPlatformWeb
                      ? context.mediaQueryWidth * .25
                      : context.mediaQueryWidth,
                  height: context.mediaQueryHeight * .8,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: context.isPlatformWeb ? 0 : 25,
                      left: 16,
                      right: 16,
                    ),
                    children: [
                      const SizedBox(height: kIsWeb ? 0 : 24),
                      if (chosenItems.isNotEmpty)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(bottom: 32.h),
                          child: wrapping(chosenItems, true, context),
                        ),
                      accordion('Ingredients', vegetables, context),
                    ],
                  ),
                ),
                BlocConsumer<HomeRecipeBloc, HomeRecipeState>(
                  listener: (context, state) {
                    if (state is HomeRecipeSuccess) {
                      context.router.push(
                        ResultsRoute(recipes: state.recipes!),
                      );
                    } else if (state is HomeRecipeLoading) {
                      //_loadingOverlay.show(context);
                    } else if (state is HomeRecipeFailed) {
                      //_loadingOverlay.hide();
                      showAboutDialog(
                        context: context,
                        children: [
                          Text(state.error!.toString()),
                        ],
                      );
                    } else {
                      // _loadingOverlay.hide();
                    }
                  },
                  builder: (context, state) => const SizedBox(),
                ),
                Responsive(
                  maxWidth: context.isPlatformWeb
                      ? context.mediaQueryWidth * .2
                      : 450,
                  child: ManiacButton(
                    onTap: () {
                      if (chosenItems.isEmpty) {
                        showErrorSnack(
                          context,
                          errorText: 'Ən azı bir ingredient seçin.',
                        );
                        return;
                      }
                      _recipeBloc.add(
                        HomeRecipeInput(ingredients: chosenItems),
                      );
                    },
                    title: 'Axtar',
                  ),
                )
              ],
            ),
            if (context.isPlatformWeb)
              Expanded(
                child: BlocBuilder<HomeRecipeBloc, HomeRecipeState>(
                  builder: (context, state) {
                    if (state is HomeRecipeSuccess) {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 30),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.mediaQueryWidth < 400
                              ? 2
                              : context.mediaQueryWidth ~/ 200,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) => const SizedBox(),
                        itemCount: state.recipes!.length,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Column accordion(String title, List<String> items, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ExpansionTile(
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(vertical: 20),
        title: Text(
          title,
          style: ConstantTextTheme.displayLarge!.copyWith(fontSize: 18),
        ),
        children: [
          wrapping(items, false, context),
        ],
      ),
    ],
  );
}

Container wrapping(List<String> items, bool chosen, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 12,
      runSpacing: 12.h,
      children: List.generate(
        items.length,
        (index) {
          return InkWell(
            borderRadius: BorderRadius.circular(32.r),
            onTap: () {
              chosen
                  ? null
                  : context.read<HomeViewProvider>().addItem(items[index]);
            },
            child: HomeTags(
              title: items[index],
              chosenItem: chosen,
            ),
          );
        },
      ),
    ),
  );
}
