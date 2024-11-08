import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magnifi_ally/core/constants/colors.dart';
import 'package:magnifi_ally/core/constants/magnifi_assets.dart';
import 'package:magnifi_ally/core/widgets/common/adaptive_image.dart';
import 'package:magnifi_ally/core/widgets/common/primary_button.dart';

import '../core/widgets/common/widget_clip_helper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MagnifiColorPalette.primary.bronze.v400,
      appBar: null,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 76),
                child: Column(
                  children: [
                    Text(
                      "Welcome to".toUpperCase(),
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: MagnifiColorPalette.primary.neutral.v900),
                    ),
                    const Gap(80),
                    const AdaptiveImage.asset(
                      MagnifiSvg.loaderTm,
                      height: 200,
                      width: 200,
                    ),
                    const Gap(90),
                    Text(
                      "Track, plan, and analyze your investments — \nall with the power of AI.",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                          color: MagnifiColorPalette.primary.neutral.v900),
                    ),
                    const Gap(20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "On board to unlock the power of AI for smarter investment",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1,
                            color: MagnifiColorPalette.primary.neutral.v900),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                  clipper: ContainerClipper(constant: 20),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 50,
                    width: 140,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(bottom: 3.5),
                    decoration: BoxDecoration(
                      color: MagnifiColorPalette.primary.bronze.v400,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(15, 5)),
                      ],
                    ),
                    child: CustomPaint(
                      painter: BorderPainter(constant: 20),
                      child: PrimaryButton(
                        label: "Log In",
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: MagnifiColorPalette.primary.neutral.v900),
                        capitalizeString: true,
                        onTap: () {
                          //loginModalSheet();
                        },
                        labelColor: MagnifiColorPalette.primary.neutral.v900,
                        backgroundColor: Colors.transparent,
                        height: 50,
                      ),
                    ),
                  )),
              const Gap(20),
              ClipPath(
                  clipper: ContainerClipper(constant: 20),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 50,
                    width: 140,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(bottom: 3.5),
                    decoration: BoxDecoration(
                      color: MagnifiColorPalette.primary.neutral.v900,
                      border: Border.all(
                        width: 2,
                        color: MagnifiColorPalette.primary.neutral.v900,
                      ),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(15, 5)),
                      ],
                    ),
                    child: PrimaryButton(
                      label: "SIGN UP",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: MagnifiColorPalette.primary.neutral.v0),
                      capitalizeString: true,
                      onTap: () {},
                      labelColor: MagnifiColorPalette.primary.neutral.v0,
                      backgroundColor: Colors.transparent,
                      height: 50,
                    ),
                  )),
            ],
          ),
          const Gap(25),
        ],
      ),
    );
  }
}
