import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_mp/provider/room_data_provider.dart';
import 'package:tic_tac_toe_mp/resources/socket_methods.dart';
import 'package:tic_tac_toe_mp/views/scoreboard.dart';
import 'package:tic_tac_toe_mp/views/tictactoe_board.dart';
import 'package:tic_tac_toe_mp/views/waiting_lobby.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';

class GameScreen extends StatefulWidget {
  static String routeName = './game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Scoreboard(),
                  const TicTacToeBoard(),
                  CustomText(
                      shadows: const [
                        Shadow(
                          blurRadius: 40,
                          color: Colors.blue,
                        ),
                      ],
                      text:
                          '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
                      fontsize: 24)
                ],
              ),
            ),
    );
  }
}
