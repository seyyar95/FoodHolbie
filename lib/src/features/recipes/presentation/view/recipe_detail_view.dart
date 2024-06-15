import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/features/recipes/presentation/widgets/custom_sliver_appbar.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

import '../../../../utils/responsive.dart';
import '../widgets/directions.dart';
import '../widgets/ingredients.dart';

@RoutePage()
class RecipeDetailView extends StatelessWidget {
  final int id;
  final String name, url;
  const RecipeDetailView({
    super.key,
    @PathParam('id') required this.id,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _buildRecipeAppBar(context),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(
              context,
              expandedHeight: MediaQuery.of(context).size.height * 0.45,
              imageAsset: url,
              recipeTitle: name,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFoodDescription(
                  description:
                      "This One Pot Lightly Creamy Pasta is quick, delicious, and your new favorite pasta dish. Cemembert, mushrooms, tomatoes, peas, and basil make up this unbelievably amazing dish!",
                ),
                SizedBox(
                  height: 44.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildShortInformation(
                      iconAsset: "assets/components/clock_icon.svg",
                      text: "20 min",
                      context: context,
                    ),
                    SizedBox(
                      width: 32.w,
                    ),
                    _buildShortInformation(
                      iconAsset: "assets/components/fire_icon.svg",
                      text: "200",
                      context: context,
                    ),
                  ],
                ),
                SizedBox(
                  height: 88.h,
                ),
                const Ingredients(),
                SizedBox(
                  height: 40.h,
                ),
                const DirectionsStepper(),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildFoodDescription({required String description}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(top: 85.h),
      child: Text(
        description,
        style: ConstantTextTheme.displayMedium?.copyWith(
          color: Colors.black,
          fontSize: 16,
          letterSpacing: -0.55,
        ),
      ),
    );
  }

  Widget _buildShortInformation({
    required String iconAsset,
    required String text,
    required BuildContext context,
  }) {
    return Responsive(
      maxWidth: 90,
      maxHeight: 140,
      child: Container(
        width: 60.w,
        height: 85.w,
        padding: const EdgeInsets.all(7),
        decoration: ShapeDecoration(
          color: const Color(0xFFEA6D6D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.w),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Responsive(
              maxWidth: 60,
              maxHeight: 60,
              child: Container(
                height: 40.w,
                width: 40.w,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.w),
                  ),
                ),
                child: SvgPicture.asset(
                  iconAsset,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  text,
                  style: ConstantTextTheme.displayLarge?.copyWith(
                    fontSize: context.mediaQueryWidth < 768 ? 12 : 16,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
