
final class AuthConfig{
  final String? fromRoute;
  final Object? args;
  final AuthReason authReason;
  final SignUpStrategy signUpStrategy;
  final bool viaRedirect;

  const AuthConfig({
    this.fromRoute,
    this.args,
    this.authReason = AuthReason.login,
    this.signUpStrategy = const SignUpStrategy.explicit(),
    this.viaRedirect = false,
  });

}

enum AuthReason {
  login("USER_LOGIN"),
  accountDeletion("USER_DELETE_ACCOUNT");

  final String name;
  const AuthReason(this.name);
}

sealed class SignUpStrategy {
  const SignUpStrategy();
  /// User performs a normal, explicit sign-up UI flow.
  const factory SignUpStrategy.explicit() = ExplicitSignUp._;

  /// Auto-create or pre-fill sign-up with known fields.
  const factory SignUpStrategy.autoCreate({
    required String firstName,
    required String lastName,
    required String gender,
    String? email,
  }) = AutoSignUp._;
}

class ExplicitSignUp extends SignUpStrategy {
  const ExplicitSignUp._();
}

class AutoSignUp extends SignUpStrategy {
  final String firstName;
  final String lastName;
  final String gender;
  final String? email;
  const AutoSignUp._({
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.email,
  });
}
