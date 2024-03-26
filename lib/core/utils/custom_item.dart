import 'package:book_app/core/utils/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //   return ClipRRect(
    //     borderRadius: BorderRadius.circular(12),
    //     child: CachedNetworkImage(
    //       imageUrl: imageUrl,
    //       fit: BoxFit.fill,
    //       errorWidget: (context, url, error) => const Icon(Icons.error),
    //       placeholder: (context, url) => const CustomLoadingWidge(),
    //     ),
    //   );
    // }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: imageProvider,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => const CustomLoadingWidge(),
    );
  }
}
