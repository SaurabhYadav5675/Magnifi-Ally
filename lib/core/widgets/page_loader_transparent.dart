import 'package:flutter/material.dart';
import 'package:magnifi_ally/core/widgets/page_loader.dart';

class PageLoaderTransparent {
  static showLoader(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "",
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => true, child: const PageLoader());
      },
    );
  }
}
