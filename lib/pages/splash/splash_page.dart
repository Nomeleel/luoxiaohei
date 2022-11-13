import 'package:flutter/cupertino.dart';

import '../../widgets/common/luo_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LuoScaffold(
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
