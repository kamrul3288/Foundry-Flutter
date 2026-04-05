
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReturnResultScreen extends StatelessWidget {
  final Function(String)? onResult;
  const ReturnResultScreen({super.key, this.onResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Return Result Screen")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [


              TextButton.icon(
                onPressed: (){
                  Navigator.of(context).pop("Send result using pop");
                },
                label: const Text("Return result using pop"),
                icon: const Icon(Icons.ads_click),
              ),

              TextButton.icon(
                onPressed: (){
                  onResult?.call("Send result using callback");
                  context.maybePop();
                },
                label: const Text("Return result using callback"),
                icon: const Icon(Icons.back_hand),
              ),


            ],
          ),
        )
      ),
    );
  }
}
