import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:matlab/translator/intro_screen.dart';
import 'package:matlab/translator/trans.dart';

void main() {
  runApp(ProviderScope(child: myapp()));
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: intro_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
