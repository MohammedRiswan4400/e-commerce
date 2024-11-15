import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_e_coomerce/model/product_model.dart';
import 'package:trogon_e_coomerce/routes/app_routes.dart';
import 'package:trogon_e_coomerce/view/widgets/app_widgets.dart';
import 'package:trogon_e_coomerce/view/widgets/bottom_sheet.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    AppRoutes.popScreen();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                  )),
              AppGoogleFontText(
                  text: product.name!,
                  size: 20,
                  weight: FontWeight.bold,
                  color: Colors.black),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:
                                //  Image.asset('assets/i.png')
                                // Image.network(imageUrls) //product.image!)
                                CachedNetworkImage(
                                    imageUrl: product.image!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.amber,
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                        Image.network(imageUrls)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          // height: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(106, 114, 114, 114),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: AppGoogleFontText(
                                text: product.category!,
                                size: 12,
                                weight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          // width: double.infinity,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Container(
                          // height: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(106, 114, 114, 114),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: AppGoogleFontText(
                                text: '⭐ ${product.rating}',
                                size: 12,
                                weight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          // width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppGoogleFontText(
                          text: product.name!,
                          size: 18,
                          weight: FontWeight.w500,
                          color: Colors.black),
                      2.verticalSpace,
                      AppGoogleFontText(
                          text: '${product.discount}% offer',
                          size: 12,
                          weight: FontWeight.w500,
                          color: Colors.green),
                    ],
                  ),
                  2.verticalSpace,
                  AppGoogleFontText(
                      text: product.brand!,
                      size: 16,
                      weight: FontWeight.w500,
                      color: Colors.black),
                  2.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppGoogleFontText(
                          text: '₹ ${product.price}',
                          size: 16,
                          weight: FontWeight.w500,
                          color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            ReviewsBottomSheetWidget(
                              reviews: product.reviews,
                            ),
                            isScrollControlled: true,
                          );
                        },
                        child: AppGoogleFontText(
                            text: '${product.reviews!.length} reviews',
                            size: 14,
                            weight: FontWeight.w500,
                            color: const Color.fromARGB(255, 103, 103, 103)),
                      ),
                    ],
                  ),
                  const Divider(),
                  AppGoogleFontText(
                      text: 'Description',
                      size: 16,
                      weight: FontWeight.w500,
                      color: Colors.black),
                  2.verticalSpace,
                  AppGoogleFontText(
                      text: product.description!,
                      size: 10,
                      textAlign: TextAlign.start,
                      weight: FontWeight.w500,
                      color: Colors.black),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
