import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure/levels/level.dart';

import 'actors/player.dart';

class PixelAdventure extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  Player player = Player(character: 'Mask Dude');
  late JoystickComponent joystick;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    @override
    final world = Level(player: player, levelName: 'Level_01');

    camera = CameraComponent.withFixedResolution(
        world: world, width: 800, height: 600);
    camera.viewfinder.anchor = Anchor.topLeft;

    addAll([camera, world]);

    addJoystick();

    return super.onLoad();
  }

  void addJoystick() {
    joystick = JoystickComponent();
  }
}
