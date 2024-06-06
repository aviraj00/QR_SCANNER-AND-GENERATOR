import 'package:flutter/material.dart';
import 'package:qr_scanner/scan.dart';

import 'generate.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR SCANNER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QR SCANNER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ElevatedButton(onPressed: (){
               setState(() {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>scanqr()));
               });
             }, child: Text('Scan',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange))
               ,),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>generateqr()));
                });
              }, child: Text('Generate QR code',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),

              )],
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



