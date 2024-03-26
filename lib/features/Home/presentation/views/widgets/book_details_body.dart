import 'package:book_app/core/utils/custom_item.dart';
import 'package:book_app/core/utils/rating.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'also_like_list_view.dart';
import 'custom_app_bar.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Uri _url = Uri.parse(bookModel.volumeInfo.previewLink ?? '');

    return SafeArea(
        child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                CustomAppBar(
                  leadingWidget: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                  trealingWidget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: CustomItem(
                      imageUrl:
                          bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  bookModel.volumeInfo.title,
                  style: Styles.largeStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  bookModel.volumeInfo.authors?[0] ?? '',
                  style: Styles.subtitleStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Rating(
                  rating: 0,
                  ratingCount: bookModel.volumeInfo.pageCount ?? 0,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'FREE',
                            style: Styles.semiboldStyle
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Free preview',
                              style: Styles.semiboldStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'You can also like',
                      style: Styles.semiboldStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AlsoLikeListView(
                    displyedId: bookModel.id,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
