import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget{
  final Function()? onTap;
  const SignInButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context){
    return Container(
      //padding: const EdgeInsets.all(15),
      //margin: const EdgeInsets.symmetric(horizontal: 30),
      // decoration: BoxDecoration(
      //   color: const Color.fromRGBO(251, 150, 158, 0.9),
      //   borderRadius: BorderRadius.circular(14),
      // ),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}