import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final platformBrightnessProvider = StateProvider<Brightness>(
  (ref) {
    final widgetsBinding = WidgetsBinding.instance;

    VoidCallback addObserver(WidgetsBindingObserver observer) {
      widgetsBinding.addObserver(observer);
      return () => widgetsBinding.removeObserver(observer);
    }

    ref.onDispose(
      addObserver(
        _PlatformBrightnessObserver(
          onPlatformBrightnessChanged: (brightness) {
            ref.read(platformBrightnessProvider.notifier).state = brightness;
          },
        ),
      ),
    );

    return widgetsBinding.platformDispatcher.platformBrightness;
  },
  name: 'PlatformBrightnessProvider',
);

class _PlatformBrightnessObserver with WidgetsBindingObserver {
  const _PlatformBrightnessObserver({
    required this.onPlatformBrightnessChanged,
  });

  final ValueChanged<Brightness> onPlatformBrightnessChanged;

  @override
  void didChangePlatformBrightness() {
    onPlatformBrightnessChanged(WidgetsBinding.instance.platformDispatcher.platformBrightness);
  }
}
