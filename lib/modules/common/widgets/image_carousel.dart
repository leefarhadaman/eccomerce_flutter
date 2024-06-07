import 'package:devfaru_eccomerce/modules/common/models/image_carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  ImageCarousel({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    final ImageCarouselController controller =
        Get.put(ImageCarouselController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                controller.updateIndex(index);
              },
            ),
            items: imageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url, fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                        return Center(child: Text('Failed to load image'));
                      }),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageUrls.map((url) {
                int index = imageUrls.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentIndex.value == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
