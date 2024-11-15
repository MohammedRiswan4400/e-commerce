import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogon_e_coomerce/model/product_model.dart';

// ignore: must_be_immutable
class AppGoogleFontText extends StatelessWidget {
  AppGoogleFontText(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      required this.color,
      this.textAlign,
      this.lineCount});
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  TextAlign? textAlign;
  int? lineCount;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: lineCount,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}

extension SpacingExtensions on num {
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}

const imageUrls =
    'https://imgs.search.brave.com/B_GKgcM2rnaPrFNlCSyQXKL8Yos2blPDGBg8Y4AtBxA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90LW1v/YmlsZS5zY2VuZTcu/Y29tL2lzL2ltYWdl/L1RtdXNwcm9kL0Fw/cGxlLWlQaG9uZS0x/Ni1Qcm8tTWF4LURl/c2VydC1UaXRhbml1/bS1mcm9udGltYWdl.jpeg';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.kWidth,
    required this.product,
  });

  final double kWidth;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 211, 211, 211),
      width: kWidth / 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        color: Colors.white,
                      ),
                      height: 20,
                      width: kWidth / 3,
                      child: Center(
                        child: AppGoogleFontText(
                          text: product.brand!,
                          size: 8,
                          weight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 18,
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  // color: Colors.amber,
                  child: AppGoogleFontText(
                    text: product.name!,
                    size: 8,
                    textAlign: TextAlign.start,
                    lineCount: 1,
                    weight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    color: Colors.white,
                  ),
                  height: 90,
                  width: kWidth / 2.2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // color: Colors.amber,
                          width: kWidth / 4.5,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppGoogleFontText(
                                text: '₹${product.price}',
                                size: 15,
                                lineCount: 1,
                                color: Colors.black,
                                weight: FontWeight.w500),
                            AppGoogleFontText(
                                text: '⭐  ${product.rating}',
                                size: 10,
                                lineCount: 1,
                                color: Colors.black,
                                weight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 30,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 6, 151, 57),
                ),
                child: Center(
                  child: AppGoogleFontText(
                      text: '${product.discount}%',
                      size: 12,
                      // lineCount: 1,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      weight: FontWeight.w900),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
