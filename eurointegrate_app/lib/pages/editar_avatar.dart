import 'dart:math';

import 'package:avatar_maker/avatar_maker.dart';
import 'package:eurointegrate_app/avatar/maker.dart';
import 'package:flutter/material.dart';

class EditarAvatar extends StatelessWidget {
  const EditarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: AvatarMakerAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              SizedBox(
                width: min(600, _width * 0.85),
                child: Row(
                  children: [
                    Text(
                      "Customize:",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Spacer(),
                    AvatarMakerSaveWidget(onTap: () async {String avatar = await AvatarMakerController.getJsonOptions(); print(avatar);},),
                    AvatarMakerResetWidget(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: MakerCustomizer(
                  //Minha pontuação
                  myPoints: 10,
                  scaffoldWidth: min(600, _width * 0.85),
                  autosave: false,
                  theme: AvatarMakerThemeData(
                      boxDecoration: BoxDecoration(boxShadow: [BoxShadow()])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}