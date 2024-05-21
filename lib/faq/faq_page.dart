import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  static final String routeName = "/faq";

  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Comming Soon",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}