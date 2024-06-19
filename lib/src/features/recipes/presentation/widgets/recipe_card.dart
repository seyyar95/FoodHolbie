import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/recipe_detail/recipe_detail_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/save_recipe/save_recipe_bloc.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

class RecipeCard extends StatefulWidget {
  final String? name, url;
  final int id;
  final bool iconChecker;
  const RecipeCard({
    Key? key,
    required this.name,
    required this.id,
    required this.url,
    required this.iconChecker,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      maxWidth: 220,
      child: SizedBox(
        width: 200.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                context.read<RecipeDetailBloc>().add(
                      RecipeDetail(id: widget.id),
                    );
                context.router.push(
                  RecipeDetailRoute(
                    id: widget.id,
                    name: widget.name!,
                    url: widget.url!,
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.network(
                  widget.url ??
                      'https://www.shutterstock.com/image-vector/empty-background-style-png-blank-260nw-676832590.jpg',
                  fit: BoxFit.cover,
                  height: 118,
                  width: 200,
                ),
              ),
            ),
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
                          onTap: () {
                            context.read<SaveRecipeBloc>().add(
                                  SaveID(id: widget.id),
                                );
                          },
                          child: widget.iconChecker
                              ? SvgPicture.asset(
                                  "assets/components/bookmark_icon.svg",
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/components/bookmark_unfilled.svg",
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
