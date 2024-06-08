import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

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

  double _parseIngredientAmount(String ingredientAmount) {
    final RegExp regex = RegExp(r'(\d+(?:\.\d+)?)');
    final match = regex.firstMatch(ingredientAmount);
    if (match != null) {
      final String value = match.group(0)!;
      return double.parse(value);
    } else {
      return 0.0;
    }
  }

  String _parseIngredientUnit(String ingredientAmount) {
    final RegExp regex = RegExp(r'(g|gram|cup)');
    final match = regex.firstMatch(ingredientAmount.toLowerCase());
    if (match != null) {
      return match.group(0)!;
    } else {
      return "";
    }
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
          _buildIngredientItem(
            ingredientPhoto: "assets/components/carrot_mock.png",
            ingredientName: "Pasta",
            ingredientAmount: "200g",
          ),
          _buildIngredientItem(
            ingredientPhoto: "assets/components/carrot_mock.png",
            ingredientName: "Carrot",
            ingredientAmount: "5 cup",
          ),
          _buildIngredientItem(
            ingredientPhoto: "assets/components/carrot_mock.png",
            ingredientName: "Paprika tozu",
            ingredientAmount: "6",
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
    final double parsedAmount = _parseIngredientAmount(ingredientAmount);
    final String unit = _parseIngredientUnit(ingredientAmount);
    final String amountText = (parsedAmount * _serve).toStringAsFixed(0);

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            child: Image.asset(
              ingredientPhoto,
            ),
          ),
          SizedBox(
            width: 52.w,
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              "$amountText $unit",
              style: ConstantTextTheme.displayMedium?.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 42.w,
          ),
          Container(
            width: 55.w,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              ingredientName,
              style: ConstantTextTheme.displayMedium?.copyWith(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
