import 'package:book_app/core/utils/custom_item.dart';
import 'package:book_app/core/utils/rating.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 85,
          width: 65,
          child: CustomItem(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.volumeInfo.title,
                style: Styles.mediumStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                book.volumeInfo.authors?.first ?? '',
                style: Styles.subtitleStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '133.99 \$',
                    style: Styles.boldStyle,
                  ),
                  Rating(
                    rating: 0,
                    ratingCount: book.volumeInfo.pageCount ?? 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
