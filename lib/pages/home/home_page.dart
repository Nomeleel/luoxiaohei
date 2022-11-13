import 'package:flutter/cupertino.dart';

import '../../widgets/common/luo_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LuoScaffold(
      child: Center(
        child: Text('Hello XiaoHei'),
      ),
    );
  }
}
