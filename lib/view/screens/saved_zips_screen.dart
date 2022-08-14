import 'package:flutter/cupertino.dart';
import 'package:procura_cep/style.dart';

class SavedZipsScreen extends StatefulWidget {
  const SavedZipsScreen({Key? key}) : super(key: key);

  @override
  SavedZipsScreenState createState() => SavedZipsScreenState();
}

class SavedZipsScreenState extends State<SavedZipsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Style.backgroundColor,
              Style.whiteColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopWidget(),
          ],
        ),
      ),
    );
  }

  Padding _buildTopWidget() => Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 32,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(
              CupertinoIcons.star,
              size: 32,
              color: Style.purpleColor,
            ),
            Text(
              'Meus favoritos',
              style: Style.largerTextStylePurple,
            )
          ],
        ),
      );
}
