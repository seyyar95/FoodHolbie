import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/recipe_detail/recipe_detail_bloc.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

class RecipeCard extends StatefulWidget {
  final String? name, url;
  final int id;
  const RecipeCard({
    Key? key,
    required this.name,
    required this.id,
    required this.url,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<RecipeDetailBloc>().add(RecipeDetail(id: widget.id));
        context.router.push(
          RecipeDetailRoute(
            id: widget.id,
            name: widget.name!,
            url: widget.url!,
          ),
        );
      },
      child: Responsive(
        maxWidth: 220,
        child: Container(
          width: 200.w,
          height: 164,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.url ??
                    'https://www.shutterstock.com/image-vector/empty-background-style-png-blank-260nw-676832590.jpg',
              ),
              scale: 1,
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
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
