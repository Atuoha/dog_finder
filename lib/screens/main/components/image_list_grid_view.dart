import 'dart:io';

import 'package:flutter/material.dart';
import '../../../common/models/dog_image.dart';
import '../../../common/theme/styles_manager.dart';
import '../widgets/k_cached_image.dart';

class ImageListGridView extends StatelessWidget {
  const ImageListGridView({
    super.key,
    required this.imageItems,
  });

  final List<DogImageItem> imageItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  Platform.isAndroid ? MediaQuery.sizeOf(context).height / 1.4:MediaQuery.sizeOf(context).height / 1.49,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: imageItems.length,
        itemBuilder: (BuildContext context, int index) {
          var item =
              imageItems[index].message;

          return imageItems.isNotEmpty
              ? KCachedImage(
            image: item,
          )
              : Center(
            child: Text(
              'Dog Image is Empty',
              style: getBoldStyle(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}