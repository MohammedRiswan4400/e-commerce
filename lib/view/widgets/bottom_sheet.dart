import 'package:flutter/material.dart';
import 'package:trogon_e_coomerce/model/product_model.dart';
import 'package:trogon_e_coomerce/view/widgets/app_widgets.dart';

class ReviewsBottomSheetWidget extends StatelessWidget {
  const ReviewsBottomSheetWidget({super.key, required this.reviews});
  final List<Review>? reviews;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            AppGoogleFontText(
                text: 'Reviews',
                size: 15,
                weight: FontWeight.w500,
                color: Colors.black),
            const Divider(),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  shrinkWrap: true,
                  itemCount: reviews!.length,
                  itemBuilder: (context, index) {
                    final userRiviews = reviews![index];
                    return ListTile(
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Icon(
                              Icons.account_circle,
                              size: 30,
                            )),
                      ),
                      title: AppGoogleFontText(
                          text: 'User ID : ${userRiviews.userId}',
                          size: 15,
                          weight: FontWeight.w500,
                          color: Colors.black),
                      subtitle: AppGoogleFontText(
                          text: userRiviews.comment!,
                          size: 12,
                          textAlign: TextAlign.start,
                          weight: FontWeight.w500,
                          color: Colors.black),
                      trailing: AppGoogleFontText(
                          text: '⭐ ${userRiviews.rating}',
                          size: 12,
                          weight: FontWeight.w500,
                          color: Colors.black),
                    );
                  },
                ),
              ),
              //   }
              //   return const Padding(
              //     padding: EdgeInsets.all(20.0),
              //     child: Column(
              //       children: [
              //         // Text(state.toString()),
              //         // const SizedBoxH40(),
              //         ShimmerContainer(),
              //         SizedBoxH10(),
              //         ShimmerContainer(),
              //         SizedBoxH10(),
              //         ShimmerContainer(),
              //         SizedBoxH10(),
              //         ShimmerContainer(),
              //       ],
              //     ),
              //   );
              // },
              //   ),
            ),
            // const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
