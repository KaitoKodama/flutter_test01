import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_test01/load_push_model.dart';
import 'package:provider/provider.dart';

class LoadPage extends StatefulWidget{
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage>{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<LoadModel>(
      create: (_) => LoadModel()..fetchFirebaseDatabase(),
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<LoadModel>(
            builder: (context, model, child) {
              return SingleChildScrollView(
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: model.cont.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(model.cont[index]),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                          ),
                        );
                      }
                      ),
                ),
              );
            }
        ),
      ),
    );
  }
}