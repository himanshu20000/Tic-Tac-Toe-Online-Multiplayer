import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_mp/resources/game_method.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          content: Lottie.asset('assets/winner.json'),
          actions: [
            TextButton(
                onPressed: () {
                  GameMethod().clearBoard(context);
                  Navigator.pop(context);
                },
                child: const CustomText(
                  shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    ),
                  ],
                  text: "Play Again",
                  fontsize: 22,
                ))
          ],
        );
      });
}
