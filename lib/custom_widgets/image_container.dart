import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.borderRadius,
      this.boxDecoration,
      this.marginRight});
  final String imageUrl;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxDecoration? boxDecoration;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: width,
      margin: EdgeInsets.only(right: marginRight ?? 0),
      decoration: boxDecoration,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircularProgressIndicator(),
            ),
          ),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
