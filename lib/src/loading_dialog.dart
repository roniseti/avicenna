import 'package:flutter/material.dart';

/// Show CircularProgressIndicator wrapped with round Container
class AvicennaLoading extends StatelessWidget {
  const AvicennaLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      child: const CircularProgressIndicator(),
    );
  }

}

/// Show CircularProgressIndicator wrapped with round Container as a Dialog
class AvicennaLoadingDialog extends StatelessWidget {
  const AvicennaLoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width / 2 - 24),
      contentPadding: const EdgeInsets.all(0),
      content: const AvicennaLoading(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

}
