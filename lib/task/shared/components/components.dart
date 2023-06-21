import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_design/task/shared/syles/Icon_broken.dart';

Widget SearchIcon(){
  return const Stack(
    alignment: Alignment.center,
    children: [
      Icon(
        IconBroken.Search,
        color: Colors.white,
        size: 17,
      ),
      CircleAvatar(
        radius: 6,
        backgroundColor: Colors.white,
      ),
    ],
  );
}