import 'package:flutter/material.dart';
import 'package:tic_tac_toe_mp/resources/socket_methods.dart';
import 'package:tic_tac_toe_mp/responsive/responsive.dart';
import 'package:tic_tac_toe_mp/widgets/custom_button.dart';
import 'package:tic_tac_toe_mp/widgets/custom_text.dart';
import 'package:tic_tac_toe_mp/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
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
            ], text: 'Create Room', fontsize: 70),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomTextfield(
                controller: _namecontroller, hintText: 'Enter your nickname'),
            SizedBox(
              height: size.height * 0.04,
            ),
            CustomButton(
                onTap: () => _socketMethods.createRoom(_namecontroller.text),
                text: 'Create')
          ],
        ),
      ),
    ));
  }
}
