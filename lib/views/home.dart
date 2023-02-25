
import 'package:flutter/material.dart';
import 'package:motus_client/global/themes/textTheme.dart';

class Home extends StatelessWidget{
  const Home({
    super.key,

  });

  @override
  Widget build (BuildContext context){

    return Center(
      child: Text('Home',
          style: myTextTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
          )
      ),
    );
  }
}







