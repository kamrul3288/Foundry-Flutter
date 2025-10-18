import 'package:flutter/material.dart';
import 'package:flutter_secure_storagex/src/screen/read_and_delete_screen.dart';
import 'package:flutter_secure_storagex/src/screen/write_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Storage"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [

              TextButton.icon(
                onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder:  (_)=>const WriteScreen())),
                icon: Icon(Icons.vpn_key),
                label: Text("Read & Write Secure Data"),    
              ),

              TextButton.icon(
                onPressed: () => Navigator.of( context).push(MaterialPageRoute(builder: (_) => const ReadAndDeleteScreen())),
                icon: Icon(Icons.redo_sharp),
                label: Text("Read & Delete the Secure Data"),
              )
              
            ],
          ),
        )
      ),
    );
  }
}