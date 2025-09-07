import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../functions/handle_url.dart';
import '../utils/imports_manager.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.url,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (url == null) {
      imageWidget = EmptyImage(width: width, height: height);
    } else if (url!.contains('svg')) {
      imageWidget = SvgPicture.network(
        handleUrl(url!),
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      final imageUrl = handleUrl(url!);
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, imageProvider) => Skeletonizer(child: Bone()),
        errorWidget:
            (context, url, error) => EmptyImage(width: width, height: height),
      );
    }

    return GestureDetector(
      onTap: () {
        if (url != null && !url!.contains('svg')) {
          Get.to(FullScreenImage(imageUrl: handleUrl(url!)));
        }
      },
      child: imageWidget,
    );
  }
}

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key, required this.width, required this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.emptyImage,
      width: width,
      height: height,
      fit: BoxFit.cover,
      color: AppColors.black,
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
