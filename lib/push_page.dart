import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_test01/load_push_model.dart';
import 'package:provider/provider.dart';

class PushPage extends StatefulWidget{
  @override
  _PushPageState createState() => _PushPageState();
}

class _PushPageState extends State<PushPage>{


  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<PushModel>(
      create: (_) => PushModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<PushModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  TextFormField(
                    onChanged: (text){
                      model.text = text;
                    },
                  ),
                  OutlinedButton(
                    child: Text('追加'),
                    onPressed: (){
                      model.addToFirebaseDatabase();
                    },
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}