
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/widget/ink_well/no_splash_ink_well.dart';
import 'package:shopify_example/src/common/widget/progress_indicator/default_circular_progress_indicator.dart';

class CachedNetworkImagesWidget extends StatelessWidget {
  const CachedNetworkImagesWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 6.0,
    this.onTap,
    this.border,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;
  final Function()? onTap;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) => NoSplashInkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: CachedNetworkImage(
            key: ValueKey(imageUrl),
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: width,
            height: height,
            imageBuilder: (
              BuildContext context,
              ImageProvider imageProvider,
            ) =>
                Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: border,
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (
              BuildContext context,
              String url,
              Object error,
            ) =>
                SizedBox(
              height: height,
              width: width,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            progressIndicatorBuilder: (
              BuildContext context,
              String url,
              DownloadProgress loadingProgress,
            ) =>
                SizedBox(
              height: height,
              width: width,
              child: Center(
                child: DefaultCircularProgressIndicator(
                  value: loadingProgress.progress != null
                      ? loadingProgress.downloaded / loadingProgress.progress!
                      : null,
                ),
              ),
            ),
          ),
        ),
      );
}
