import 'package:flutter/material.dart';
import 'package:tic_tac_toe_mp/screens/create_room_screen.dart';
import 'package:tic_tac_toe_mp/screens/join_room_screen.dart';
import 'package:tic_tac_toe_mp/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomText(shadows: [
          Shadow(
            blurRadius: 40,
            color: Colors.blue,
          )
        ], text: "TIC TAC TOE", fontsize: 50),
        Lottie.asset('assets/ticTac.json',
            height: size.height - 380, width: size.width - 50),
        const SizedBox(
          height: 30,
        ),
        CustomButton(onTap: () => createRoom(context), text: 'Create Room'),
        const SizedBox(
          height: 30,
        ),
        CustomButton(onTap: () => joinRoom(context), text: 'Join Room'),
      ],
    ));
  }
}
