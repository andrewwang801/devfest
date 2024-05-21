import 'package:devfest_demo/config/config_bloc.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCard extends StatelessWidget {
  final String img;
  
  const ImageCard({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
      decoration: BoxDecoration(
        color: BlocProvider.of<ConfigBloc>(context).darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}