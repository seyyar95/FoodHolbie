import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

import '../../domain/entity/recipe_entity.dart';

class Ingredients extends StatefulWidget {
  final List<IngredientEntity> ingredients;
  const Ingredients({super.key, required this.ingredients});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  int _serve = 1;

  void _incrementServe() {
    setState(() {
      _serve++;
    });
  }

  void _decrementServe() {
    setState(() {
      if (_serve > 1) {
        _serve--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServeCounter(),
          SizedBox(height: 28.h),
          Column(
            children: List.generate(
              widget.ingredients.length,
              (index) {
                IngredientEntity ingredient = widget.ingredients[index];
                return _buildIngredientItem(
                  ingredientPhoto: ingredient.img!,
                  ingredientName: ingredient.name!,
                  ingredientAmount: ingredient.quantity!,
                );
              },
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }

  Widget _buildServeCounter() {
    return Row(
      children: [
        InkWell(
          onTap: _decrementServe,
          child: Responsive(
            maxWidth: 35,
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset("assets/components/minus_icon.svg"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            "Serves $_serve",
            style: ConstantTextTheme.displayLarge?.copyWith(fontSize: 16),
          ),
        ),
        InkWell(
          onTap: _incrementServe,
          child: Responsive(
            maxWidth: 35,
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset("assets/components/plus_icon.svg"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem({
    required String ingredientPhoto,
    required String ingredientName,
    required String ingredientAmount,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              ingredientPhoto,
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Text(
                ingredientAmount,
                style: ConstantTextTheme.displayMedium?.copyWith(fontSize: 16),
              ),
            ),
          ),
          Text(
            ingredientName,
            style: ConstantTextTheme.displayMedium?.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}
