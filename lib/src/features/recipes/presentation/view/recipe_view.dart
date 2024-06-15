import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/search_recipe/search_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/widgets/recipe_card.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/snackbars.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/loading_overlay.dart';
import 'package:foodmania/src/utils/responsive.dart';

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
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 24.h,
                      ),
                      _buildSearchField(),
                      SizedBox(
                        height: 36.h,
                      ),
                      _buildSectionTitle("Gündəlik Tövsiyyə"),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 164.h,
                        child: _buildHorizontalListView(),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SectionHeaderDelegate(
                    child: _buildSectionTitle("Bütün Reseptlər"),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.mediaQueryWidth < 400
                        ? 2
                        : context.mediaQueryWidth ~/ 200,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 15,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        const SizedBox(), //const RecipeCard(name: "BigMac"),
                    childCount: 16,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  sliver: const SliverToBoxAdapter(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildHorizontalListView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const SizedBox(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: 5,
    );
  }

  Align _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: ConstantTextTheme.displayMedium
            ?.copyWith(fontSize: 16, letterSpacing: -0.5),
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
            showErrorSnack(context, errorText: 'Boşluğu doldur gijd');
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

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SectionHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
