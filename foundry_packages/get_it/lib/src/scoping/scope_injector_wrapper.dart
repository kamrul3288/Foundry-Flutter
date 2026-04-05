part of 'scopeing_screen.dart';

typedef ScopeInitializer = void Function(GetIt getIt);

class ScopeInjectorWrapper extends StatefulWidget {
  final String? scopeName;
  final WidgetBuilder builder;
  final ScopeInitializer initDi;

  const ScopeInjectorWrapper({
    super.key,
    this.scopeName,
    required this.initDi,
    required this.builder,
  });

  @override
  State<ScopeInjectorWrapper> createState() => _ScopeInjectorWrapperState();
}

class _ScopeInjectorWrapperState extends State<ScopeInjectorWrapper> {
  late final String scopeName;
  @override
  void initState() {
    scopeName = widget.scopeName ?? "scope_${DateTime.now().millisecondsSinceEpoch}";
    _di.pushNewScope(
      scopeName: scopeName,
      init: (di) => widget.initDi(di),
    );
    super.initState();
  }

  @override
  void dispose() {
    _di.popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
