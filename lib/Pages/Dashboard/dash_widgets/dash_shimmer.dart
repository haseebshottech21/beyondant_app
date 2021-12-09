import 'package:beyondant_new_app/Pages/Dashboard/dash_widgets/dash_cards.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const ShimmerDashCard(),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerDashCard(),
                    ShimmerDashCard(),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // ProfileChart Shimmer
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 15.0,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // ContactChart Shimmer
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 15.0,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerDashCard(),
                    ShimmerDashCard(),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerDashCard(),
                    ShimmerDashCard(),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerDashCard(),
                    ShimmerDashCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: const [
    //         ShimmerDashCard(),
    //         ShimmerDashCard(),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 10.0,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: const [
    //         ShimmerDashCard(),
    //         ShimmerDashCard(),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 30.0,
    //     ),
    //     // ProfileChart Shimmer
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width / 2,
    //           height: 15.0,
    //           color: Colors.white,
    //         ),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 10.0,
    //     ),
    //     Container(
    //       width: MediaQuery.of(context).size.width * 0.95,
    //       height: MediaQuery.of(context).size.height * 0.40,
    //       color: Colors.white,
    //     ),
    //     const SizedBox(
    //       height: 10.0,
    //     ),
    //     const SizedBox(
    //       height: 30.0,
    //     ),
    //     // ContactChart Shimmer
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width / 2,
    //           height: 15.0,
    //           color: Colors.white,
    //         ),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 10.0,
    //     ),
    //     Container(
    //       width: MediaQuery.of(context).size.width * 0.95,
    //       height: MediaQuery.of(context).size.height * 0.40,
    //       color: Colors.white,
    //     ),
    //     const SizedBox(
    //       height: 20.0,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: const [
    //         ShimmerDashCard(),
    //         ShimmerDashCard(),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 10.0,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: const [
    //         ShimmerDashCard(),
    //         ShimmerDashCard(),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 10.0,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: const [
    //         ShimmerDashCard(),
    //         ShimmerDashCard(),
    //       ],
    //     ),
    //   ],
    // );
  }
}
