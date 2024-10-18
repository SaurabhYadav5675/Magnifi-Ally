import 'package:flutter/material.dart';

class DialogAnimation {
  static fadeInDialog(BuildContext context, bool isCancellable, Widget child) {
    return showGeneralDialog(
      barrierDismissible: isCancellable,
      barrierLabel: '',
      transitionBuilder: (context, animation1, animation2, widget) {
        return Transform.scale(
          scale: animation1.value,
          child: Opacity(
            opacity: animation1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (context) => child);
      },
    );
  }
}
