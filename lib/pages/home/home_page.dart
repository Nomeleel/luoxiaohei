import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router.dart';
import '../../widgets/common/luo_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LuoScaffold(
      child: Center(
        child: Column(
          children: [
            const Text('Hello XiaoHei'),
            ElevatedButton(
              onPressed: () {
                context.push(Pages.settings);
              },
              child: const Text('Push Settings Page'),
            ),
          ],
        ),
      ),
    );
  }
}
