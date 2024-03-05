import 'package:flutter/material.dart';
import 'package:tic_tac_toe_mp/responsive/responsive.dart';
import 'package:tic_tac_toe_mp/utils/colors.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Responsive(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23)),
            color: bgColor,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 33, 86, 243),
                  blurRadius: 8,
                  spreadRadius: 2.5),
            ]),
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width, 50),
              backgroundColor: bgColor,
            ),
            child: CustomText(shadows: [
              Shadow(
                blurRadius: 20,
                color: Theme.of(context).colorScheme.primary,
              )
            ], text: text, fontsize: 20)),
      ),
    );
  }
}
