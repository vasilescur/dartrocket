part of dartrocket.core;

/**
 * The world is where almmost all of the game objects live.
 *
 * The world object is made automatically when you make a game object.
 */
class World extends StageXL.DisplayObjectContainer {

  Game _game;

//=============================================================================

  /**
   * Widht of the world.
   */
  num width;

  /**
   * Height of the world.
   */
  num height;

  /**
   * [StageXL.Juggler] object of the world.
   *
   * Uses the stage's juggler object.
   */
  StageXL.Juggler juggler;

//=============================================================================

  World(this._game, this.width, this.height) {
    juggler = _game.stage.juggler;

    _game.stage.addChild(this);
  }
}