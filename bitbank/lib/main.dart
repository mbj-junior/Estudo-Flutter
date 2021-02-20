import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          Text('texto1', textDirection: TextDirection.ltr,),
          Text('texto2', textDirection: TextDirection.ltr,),
        ],
      ),
    );
