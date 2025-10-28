import 'package:file_uploader/src/file_uploader_internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// We will provide this by overriding in the provider scope at the top level of the app
// This can be useful for showing SnackBars or Dialogs from anywhere in the app

final rootContextProvider = Provider<BuildContext>((ref)=>throw UnimplementedError());
final scaffoldMessengerKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) => throw UnimplementedError());

final imageRepositoryProvider = Provider<ImageRepository>((ref){
  return ImageRepository(ref);
});