import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DecorationCachedNetworkImage extends StatelessWidget {
  final String? tag;
  final String? imageUrl;
  final Widget error;
  const DecorationCachedNetworkImage({
    super.key,
    this.tag,
    required this.error,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return tag == null
        ? buildNormal()
        : Hero(tag: tag!, child: imageUrl == null ? error : buildNormal());
  }

  buildCached() => CachedNetworkImage(
        imageUrl: imageUrl!,
        imageBuilder: (context, imageProvider) => DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  buildNormal() => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      );
}
