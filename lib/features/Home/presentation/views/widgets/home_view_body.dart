import 'package:book_app/constants.dart';
import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_app_bar.dart';
import 'horrizontal_list_view.dart';
import 'vertical_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Custom AppBar
                  CustomAppBar(
                    leadingWidget: SizedBox(
                      height: 20,
                      child: Image.asset(kPrimaryLogo),
                    ),
                    trealingWidget: IconButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kSearchView);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                  //ListView
                  const HorizontalListView(),
                  const Padding(
                    padding: EdgeInsets.only(top: 22, bottom: 8),
                    child: Text(
                      'Best Sales',
                      style: Styles.mediumStyle,
                    ),
                  ),
                ],
              ),
            ),
            const SliverFillRemaining(
              child: VerticalListView(),
            ),
          ],
        ),
      ),
    );
  }
}
