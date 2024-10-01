import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String path;
  final double size;
  final Color color;
  final Color? background;

  const AppIcon(this.path,
      {super.key,
      this.size = 25,
      this.color = Colors.transparent,
      this.background});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: background,
      child: CachedNetworkImage(
        imageUrl: path,
        //color: color,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
