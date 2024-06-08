import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

class RecipeCard extends StatefulWidget {
  final String? name;
  final int? preparationTime;
  const RecipeCard({Key? key, required this.name, this.preparationTime}) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed("/recipe-detail/1"),
      child: Responsive(
        maxWidth: 220,
        child: Container(
          width: 200.w,
          height: 164,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/components/mock_image.jpg"),
              scale: 1,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFF252525),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Text(
                            widget.name!,
                            style: ConstantTextTheme.displayMedium?.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: 12.w,
                          child: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/components/bookmark_unfilled.svg",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
