import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';



class LoadModel extends ChangeNotifier{
  final docRef = FirebaseFirestore.instance.collection('test');
  List cont = [];

  Future fetchFirebaseDatabase() async{
    final get = await docRef.doc('aaa').get();
    cont = await get.get('debugMessage');

    notifyListeners();
  }
}

class PushModel extends ChangeNotifier{
  final docRef = FirebaseFirestore.instance.collection('test');
  String? text;

  Future addToFirebaseDatabase() async{
    if(text != null){
      String updateTxt = text.toString()+' : '+DateTime.now().toString();
      await docRef.doc('aaa').update({
        'debugMessage': FieldValue.arrayUnion([updateTxt]),
      });
    }
  }
}