import 'package:flutter/material.dart';

class CustomButton {
  static ButtonStyle roundCornerButton(
      {required vertical, required horizontal, required buttonColor}) {
    vertical = vertical.toDouble();
    horizontal = horizontal.toDouble();
    return ButtonStyle(
      padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal)),
      backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: buttonColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  static ButtonStyle roundCornerFullButton({required buttonColor}) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 40)),
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: buttonColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  static ButtonStyle roundCornerOutline(
      {required vertical,
      required horizontal,
      required Color borderColor,
      required Color bgColor}) {
    vertical = vertical.toDouble();
    horizontal = horizontal.toDouble();
    return ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal)),
      backgroundColor: MaterialStateProperty.all<Color>(bgColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }

  static ButtonStyle roundCornerOutlineFull(
      {required Color borderColor, required Color bgColor}) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 40)),
      backgroundColor: MaterialStateProperty.all<Color>(bgColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
