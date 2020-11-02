import 'package:bluebubbles/helpers/contstants.dart';
import 'package:bluebubbles/layouts/widgets/scroll_physics/custom_bouncing_scroll_physics.dart';
import 'package:bluebubbles/managers/settings_manager.dart';
import 'package:flutter/cupertino.dart';

class ThemeManager {
  factory ThemeManager() {
    return _manager;
  }

  static final ThemeManager _manager = ThemeManager._internal();
  ThemeManager._internal();

  ScrollPhysics get scrollPhysics {
    if (SettingsManager().settings.skin == Skins.Material) {
      return AlwaysScrollableScrollPhysics(
        parent: ClampingScrollPhysics(),
      );
    } else if (SettingsManager().settings.skin == Skins.IOS) {
      return AlwaysScrollableScrollPhysics(
        parent: CustomBouncingScrollPhysics(),
      );
    } else {
      return AlwaysScrollableScrollPhysics(
        parent: ClampingScrollPhysics(),
      );
    }
  }
}
