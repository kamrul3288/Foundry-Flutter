import 'package:auto_route/auto_route.dart';
import '../../router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NestedNavMainScreen extends StatelessWidget {
  const NestedNavMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nested Nav Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Render Nested Nav 1"),
                onPressed: ()=>context.router.replace(NestedNav1Route())
              ),

              TextButton.icon(
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Render Nested Nav 2"),
                  onPressed: ()=>context.router.replace(NestedNav2Route())
              ),

              TextButton.icon(
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Render Nested Nav 3"),
                  onPressed: ()=>context.router.replace(NestedNav3Route())
              ),


              Expanded(
                child: AutoRouter(),
              )

            ],
          )
        )
      ),
    );
  }
}
