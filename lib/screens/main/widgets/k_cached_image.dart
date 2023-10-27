import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../gen/assets.gen.dart';

class KCachedImage extends StatelessWidget {
  KCachedImage({
    super.key,
    required this.image,
    this.height = 70,
    this.width = 60,
    this.radius = 60,
  });

  final String image;
  double height;
  double width;
  double radius;

  @override
  Widget build(BuildContext context) {
    // show image in modal
    showImageModal() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, image) {
                        return Image(
                          width: double.infinity,
                          image: image,
                          fit: BoxFit.cover,
                        );
                      },
                      placeholder: (context, url) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Assets.images.dogPlaceholder.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                      errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Assets.images.dogPlaceholder.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                   Positioned(
                     top:20,
                      right:30,
                      child:GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const CircleAvatar(
                          backgroundColor: AppColors.secondaryColor,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () => showImageModal(),
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            Assets.images.dogPlaceholder.path,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
        errorWidget: (context, url, error) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            Assets.images.dogPlaceholder.path,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
