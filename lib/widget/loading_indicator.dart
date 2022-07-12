import 'dart:io';

import 'package:flutter/material.dart';

class LoadingScreen {
  static Widget loadingScreen() {
    return Platform.isAndroid
        ? Stack(
            children: [
              Container(color: Colors.black.withAlpha(100)),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  width: 80.0,
                  height: 80.0,
                  child: const CircularProgressIndicator(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Container(color: Colors.black.withAlpha(100)),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  width: 80.0,
                  height: 80.0,
                  child: const CircularProgressIndicator(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          );
  }
}
