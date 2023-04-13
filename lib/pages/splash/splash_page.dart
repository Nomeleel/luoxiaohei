import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luoxiaohei/app/app_provider.dart';

import '../../widgets/common/luo_scaffold.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appInitProvider.notifier).init();
    return const LuoScaffold(
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
