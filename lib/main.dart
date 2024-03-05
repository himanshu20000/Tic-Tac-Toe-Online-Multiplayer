import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_mp/provider/room_data_provider.dart';
import 'package:tic_tac_toe_mp/screens/MainMenuScreen.dart';
import 'package:tic_tac_toe_mp/screens/create_room_screen.dart';
import 'package:tic_tac_toe_mp/screens/games_screen.dart';
import 'package:tic_tac_toe_mp/screens/join_room_screen.dart';
import 'package:tic_tac_toe_mp/screens/qr_screen.dart';
import 'package:tic_tac_toe_mp/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          useMaterial3: true,
        ),
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
          QrScanner.routeName: (context) => const QrScanner(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
