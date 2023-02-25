import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Widgets/search.dart';

class Dictionary extends StatelessWidget{
  const Dictionary({super.key});

  @override
  Widget build (BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,

          children: [
            Search(
              value: "", searchSugestions: (String string){
              return [string, "hola", "ejemplo", "felicidad"];
            }),
          ],
        ),
      ),
    );
  }
}