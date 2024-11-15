import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_e_coomerce/controller/product_controller.dart';

import 'package:trogon_e_coomerce/routes/app_routes.dart';
import 'package:trogon_e_coomerce/view/widgets/app_widgets.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/appe1.png',
      'assets/apple2.png',
      'assets/apple3.png',
      'assets/apple4.png',
    ];
    final kWidth = MediaQuery.sizeOf(context).width;
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppGoogleFontText(
                    text: 'focus store',
                    size: 20,
                    weight: FontWeight.bold,
                    color: Colors.black),
              ],
            ),
            10.verticalSpace,
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.black,
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayCurve: Curves.easeInOut,
                        enableInfiniteScroll: true,
                      ),
                      items: images.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  20.verticalSpace,
                  AppGoogleFontText(
                    text: 'New Arrivals',
                    size: 15,
                    weight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  5.verticalSpace,
                  Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (productController.productList.isEmpty) {
                      return const Center(child: Text('No products found.'));
                    } else {
                      return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productController.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisExtent: 150,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            final products =
                                productController.productList[index];
                            return GestureDetector(
                                onTap: () {
                                  AppRoutes.gotoProductScreen(
                                      product: products);
                                },
                                child: ProductWidget(
                                  kWidth: kWidth,
                                  product: products,
                                ));
                          });
                    }
                  }),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
