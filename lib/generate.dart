import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class generateqr extends StatefulWidget {
  const generateqr({super.key});

  @override
  State<generateqr> createState() => _generateqrState();
}

class _generateqrState extends State<generateqr> {
  TextEditingController url=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('generate QR code'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              if(url.text.isNotEmpty)
            QrImageView(
            data: url.text, // Replace with your data
            size: 200,
              // Size of the QR code
          ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    controller: url,
                    decoration: InputDecoration(
                    hintText: 'Enter data',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      labelText: 'Enter data',
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.orange),
                        borderRadius: new BorderRadius.circular(25.7),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.orange),
                        borderRadius: new BorderRadius.circular(25.7),)
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  setState(() {


                  });
                }, child: Text('Generate QR Code',style: TextStyle(color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),)
          ]),
          ),
        ),
      )
    );
  }
}
