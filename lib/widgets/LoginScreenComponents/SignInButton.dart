import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget{
  final Function()? onTap;
  // final Color backgroundcolor;
  // final Color primarycolor;
  const SignInButton({super.key, required this.onTap, });

  @override
  Widget build(BuildContext context){
    return Container(
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: primarycolor,
        // ),
        onPressed: onTap,
        child: Text(
          'Sign In',
          style: TextStyle(
            //color: backgroundcolor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}