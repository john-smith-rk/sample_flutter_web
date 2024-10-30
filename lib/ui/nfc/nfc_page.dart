import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return _NFCPage();
  }

}

class _NFCPage extends State<NFCPage>{

  String errorMessage = "";
  List<NfcTag> nfcList = [];

  @override
  Widget build(BuildContext context) {
    return (errorMessage.isNotEmpty)?Center(
      child: Text(errorMessage),
    ):Container(
      child: ListView.builder(
        itemCount: parsedData.length,
        itemBuilder: (context, index) {
          String key = parsedData.keys.toList()[index];
          Map<String, dynamic> tagInfo = parsedData[key];
          return ListTile(
            title: Text(
              _formatKey(key),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _formatData(tagInfo),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkNFCRead();
  }

  Future<void> checkNFCRead() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    nfcList = [];
    if(isAvailable){
      errorMessage = "";
      _tagRead();
    }else{
      errorMessage = "Your device is not supported NFC feature.";
    }
  }

  void _tagRead() {

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      nfcList.add(tag) ;
      print("Data = "+tag.toString());
      print("Data = "+tag.data.toString());
      print("handaling = "+tag.handle.toString());

      Map<String, dynamic> parsedData = {};

      try {
        String data = tag.data.toString();
        data = data.replaceAllMapped(RegExp(r'(\w+):'), (match) {
          return '"${match.group(1)}":';
        });

        parsedData = json.decode(data);
        print("parsedData = "+parsedData.toString());
      } catch (e) {
        print('Error parsing NFC data: $e');
      }

      var ndef = Ndef.from(tag);
      if (ndef != null){
        print("Additional "+ndef.additionalData.toString());
        NdefMessage? message = await ndef.read();
        print("Message "+message.toString());
        }else{
        print("NULL NDF = ");
      }



    }).catchError((onError){
      errorMessage = onError.toString();
      setState(() {});
    });

  }

  @override
  void dispose() {
    super.dispose();
    NfcManager.instance.stopSession();
  }
}