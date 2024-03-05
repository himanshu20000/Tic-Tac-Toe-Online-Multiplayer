import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_mp/provider/room_data_provider.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            CustomText(shadows: const [
              Shadow(
                blurRadius: 40,
                color: Colors.blue,
              )
            ], text: roomDataProvider.player1.nickname, fontsize: 20),
            CustomText(
                shadows: const [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  )
                ],
                text: roomDataProvider.player1.points.toInt().toString(),
                fontsize: 20),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            CustomText(shadows: const [
              Shadow(
                blurRadius: 40,
                color: Colors.blue,
              )
            ], text: roomDataProvider.player2.nickname, fontsize: 20),
            CustomText(
                shadows: const [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  )
                ],
                text: roomDataProvider.player2.points.toInt().toString(),
                fontsize: 20),
          ]),
        ),
      ],
    );
  }
}
