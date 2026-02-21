import 'package:envied/envied.dart';
import 'package:flutter/foundation.dart';
part 'env.g.dart';

@Envied(path: '.env_development', name: 'DevelopmentEnv')
@Envied(path: '.env_production', name: 'ProductionEnv')
final class Env {
  factory Env() => _instance;

  static final Env _instance = switch (kDebugMode) {
    true => _DevelopmentEnv(),
    false => _ProductionEnv(),
  };

  @EnviedField(varName: 'BASE_URL', obfuscate: false)
  final String baseUrl = _instance.baseUrl;
}
