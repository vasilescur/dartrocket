library dartrocket;

export "dart:html" show KeyCode;
export "package:stagexl/stagexl.dart" show TransitionFunction, Color, TextureAtlasFormat;

import "dart:async";
import "dart:html" show window, document, CanvasElement;
import 'dart:collection' show ListBase;
import "package:stagexl/stagexl.dart" as StageXL;

part "src/core/game.dart";
part "src/core/statemanager.dart";
part "src/core/state.dart";
part "src/core/group.dart";
part "src/core/gameobjectfactory.dart";

part "src/gameobject/interactive_bitmap.dart";
part "src/gameobject/sprite.dart";
part "src/gameobject/background.dart";
part "src/gameobject/text.dart";
part "src/gameobject/sound.dart";
part "src/gameobject/button.dart";

part "src/constants/event.dart";
part "src/constants/resourcemode.dart";
