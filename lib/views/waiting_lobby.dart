import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tic_tac_toe_mp/provider/room_data_provider.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';
import 'package:tic_tac_toe_mp/widgets/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']);
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/waiting.json'),
        const CustomText(shadows: [
          Shadow(
            blurRadius: 40,
            color: Colors.blue,
          )
        ], text: 'Waiting for the player to join', fontsize: 22),
        const SizedBox(
          height: 20,
        ),
        CustomTextfield(
          controller: roomIdController,
          hintText: '',
          isReadOnly: true,
        ),
        const SizedBox(height: 20),
        // Add the QR code here
        QrImageView(
          backgroundColor: Colors.white,
          data: Provider.of<RoomDataProvider>(context, listen: false)
              .roomData['_id'],
          version: QrVersions.auto,
          size: 200.0, // Adjust the size as needed
        ),
      ],
    );
  }
}
