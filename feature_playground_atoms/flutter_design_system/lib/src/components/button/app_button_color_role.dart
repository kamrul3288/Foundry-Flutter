import 'app_button_color.dart';

sealed class AppButtonColorRole {
  const AppButtonColorRole();

  const factory AppButtonColorRole.primary() = AppButtonColorPrimary._;
  const factory AppButtonColorRole.custom(AppButtonColor color) = AppButtonColorCustom._;
}

final class AppButtonColorPrimary extends AppButtonColorRole {
  const AppButtonColorPrimary._();
}

final class AppButtonColorCustom extends AppButtonColorRole {
  final AppButtonColor color;
  const AppButtonColorCustom._(this.color);
}
