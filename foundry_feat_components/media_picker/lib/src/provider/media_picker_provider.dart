import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_picker/src/repository/image_repository.dart';

// We will provide this by overriding in the provider scope at the top level of the app
// This can be useful for showing SnackBars or Dialogs from anywhere in the app
final rootContextProvider = Provider<BuildContext>((ref) => throw UnimplementedError());
final scaffoldMessengerKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) => throw UnimplementedError());

//Provider for ImageRepository
final imageRepositoryProvider = Provider<ImageRepository>((ref) => ImageRepository());
