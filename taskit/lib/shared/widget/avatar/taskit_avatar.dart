import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taskit/shared/config/app/app_config.dart';

class TaskitAvatar extends StatelessWidget {
  final String? imagePath;
  final double size;

  const TaskitAvatar({super.key, this.imagePath, this.size = 40});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.isEmpty) {
      return CircleAvatar(radius: size / 2, child: const Icon(Icons.person));
    }

    return CachedNetworkImage(
      imageUrl: AppConfigs.imageUrl(imagePath!),
      cacheKey: imagePath,
      placeholder: (context, url) => Container(
        width: size,
        height: size,
        color: Colors.grey[200],
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
