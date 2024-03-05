import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tic_tac_toe_mp/resources/socket_methods.dart';
import 'package:tic_tac_toe_mp/responsive/responsive.dart';
import 'package:tic_tac_toe_mp/screens/qr_screen.dart';
import 'package:tic_tac_toe_mp/widgets/custom_button.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';
import 'package:tic_tac_toe_mp/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Responsive(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(shadows: [
              Shadow(
                blurRadius: 40,
                color: Colors.blue,
              )
            ], text: 'Join Room', fontsize: 80),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomTextfield(
                controller: _namecontroller, hintText: 'Enter your nickname'),
            SizedBox(
              height: size.height * 0.015,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextfield(
                      controller: _gameIdController, hintText: 'Enter Game ID'),
                ),
                SizedBox(
                  width: size.width * 0.015,
                ),
                IconButton(
                  onPressed: () {
                    _startQrScan(context);
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            CustomButton(
                onTap: () => _socketMethods.joinRoom(
                      _namecontroller.text,
                      _gameIdController.text,
                    ),
                text: 'Join'),
            // Expanded(
            //   child: QRView(
            //     key: qrKey,
            //     onQRViewCreated: _onQRViewCreated,
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }

  void _startQrScan(BuildContext context) async {
    try {
      final result = await Navigator.pushNamed(context, QrScanner.routeName);
      if (result != null && result is String) {
        _gameIdController.text = result;
      }
    } catch (e) {
      print("Error during QR scan: $e");
    }
  }
}
