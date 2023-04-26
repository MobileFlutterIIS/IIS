import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final Function()? onTap;

  const ConfirmButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text(
        'Подтвердить',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}