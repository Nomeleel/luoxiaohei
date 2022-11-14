import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_provider.dart';
import '../../widgets/common/luo_scaffold.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});
  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    ref.read(appProvider).init();
  }

  @override
  Widget build(BuildContext context) {
    return const LuoScaffold(
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
