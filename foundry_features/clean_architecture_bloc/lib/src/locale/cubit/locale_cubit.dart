import 'package:clean_architecture_bloc/src/local_storage/repository/app_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class LocaleCubit extends Cubit<Locale> {
  final AppDataRepository _appDataRepository;
  LocaleCubit(this._appDataRepository) : super(const Locale('en'));

  Future<void> loadLocale() async {
    final languageCode = await _appDataRepository.getLanguageCode();
    if (languageCode != null) {
      emit(Locale(languageCode));
    }
  }

  Future<void> changeLocale(String languageCode) async {
    await _appDataRepository.saveLanguageCode(languageCode);
    emit(Locale(languageCode));
  }
}
