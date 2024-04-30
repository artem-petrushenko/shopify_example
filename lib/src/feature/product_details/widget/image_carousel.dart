import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/widget/image/network/cached_network_images_widget.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    super.key,
    required this.imagesUrls,
  });

  final List<String> imagesUrls;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _pageController;
  final ValueNotifier _currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 245.0,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imagesUrls.length,
              itemBuilder: (context, index) => ValueListenableBuilder(
                valueListenable: _currentIndex,
                builder: (BuildContext context, value, Widget? child) =>
                    AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                  margin: EdgeInsets.all(
                    _currentIndex.value == index ? 0.0 : 26.0,
                  ),
                  child: CachedNetworkImagesWidget(
                    imageUrl: widget.imagesUrls[index],
                    borderRadius: 16.0,
                  ),
                ),
              ),
              onPageChanged: (int index) => _currentIndex.value = index,
            ),
          ),
          if (widget.imagesUrls.length > 1)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imagesUrls.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: SizedBox(
                      width: 6.0,
                      height: 6.0,
                      child: ValueListenableBuilder(
                        valueListenable: _currentIndex,
                        builder: (context, value, child) => DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: value == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
}
