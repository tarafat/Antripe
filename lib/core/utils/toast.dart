import 'dart:developer';

import 'package:antripe/core/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';

final class ToastUtil {
  ToastUtil._();
  static void showLongToast(String message) {
    String trn = message;
    Fluttertoast.showToast(gravity: ToastGravity.TOP, msg: trn, toastLength: Toast.LENGTH_LONG);
  }

  static void showErrorToast(String message) {
    toastification.show(
      overlayState: NavigationService.navigatorKey.currentState?.overlay,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),

      // you can also use RichText widget for title and description parameters
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          // turns: animation,
          opacity: animation,
          child: child,
        );
      },

      icon: const Icon(Icons.error),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 202, 14, 14),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [BoxShadow(color: Color(0x07000000), blurRadius: 16, offset: Offset(0, 16), spreadRadius: 0)],
      showProgressBar: false,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.always),
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => log('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismissById(toastItem.id), //log('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) => log('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => log('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showErrorToastUithDismiss(String message) {
    toastification.dismissAll();
    toastification.show(
      overlayState: NavigationService.navigatorKey.currentState?.overlay,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),

      // you can also use RichText widget for title and description parameters
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          // turns: animation,
          opacity: animation,
          child: child,
        );
      },

      icon: const Icon(Icons.error),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 202, 14, 14),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [BoxShadow(color: Color(0x07000000), blurRadius: 16, offset: Offset(0, 16), spreadRadius: 0)],
      showProgressBar: false,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.always),
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => log('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismissById(toastItem.id), //log('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) => log('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => log('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showSuccessToast(String message) {
    toastification.dismissAll();
    toastification.show(
      overlayState: NavigationService.navigatorKey.currentState?.overlay,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),

      // you can also use RichText widget for title and description parameters
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          // turns: animation,
          opacity: animation,
          child: child,
        );
      },

      icon: const Icon(Icons.check),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.white,
      backgroundColor: const Color(0xFF32BC32),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [BoxShadow(color: Color(0x07000000), blurRadius: 16, offset: Offset(0, 16), spreadRadius: 0)],
      showProgressBar: false,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.always),
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => log('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismissById(toastItem.id), //log('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) => log('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => log('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showSuccessToastWithDismiss(String message) {
    toastification.dismissAll();
    toastification.show(
      overlayState: NavigationService.navigatorKey.currentState?.overlay,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),

      // you can also use RichText widget for title and description parameters
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          // turns: animation,
          opacity: animation,
          child: child,
        );
      },

      icon: const Icon(Icons.check),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.white,
      backgroundColor: const Color(0xFF32BC32),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [BoxShadow(color: Color(0x07000000), blurRadius: 16, offset: Offset(0, 16), spreadRadius: 0)],
      showProgressBar: false,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.always),
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => log('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismissById(toastItem.id), //log('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) => log('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => log('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showShortToast(String message) {
    Fluttertoast.showToast(gravity: ToastGravity.TOP, msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  static void showNoInternetToast() {
    Fluttertoast.showToast(msg: "Please check your internet connection", toastLength: Toast.LENGTH_SHORT);
  }

  static void showNotLoggedInToast() {
    Fluttertoast.showToast(msg: "Please login to perform this operation", toastLength: Toast.LENGTH_SHORT);
  }
}
