part of dartrocket;

/**
 * You can make (moving)background with this class.
 * 
 * Background is made of an image, which in this case I use it as a tile.
 * Basically the background is just a bunch of tiles.
 */
class Background implements StageXL.Animatable {
  List<StageXL.Bitmap> _backgroundTileList = new List<StageXL.Bitmap>();
  State _context;

  /**
   * Horizontal speed of the tiles
   */
  int vx = 0;
  /**
   * Vertical speed of the tiles.
   */
  int vy = 0;

  /**
   * Is the background movable.
   */
  bool isMovable;

  /**
   * Makes a new (tile)Background object.
   */
  Background(State stateContext, String resourceName, {bool isMovable:
      false, bool addToStage: true, bool repeatX: true, bool repeatY: true}) : super()
      {

    _context = stateContext;

    StageXL.BitmapData backgroundTileBitmapdata =
        stateContext.game.resourceManager.getBitmapData(resourceName);
    StageXL.Bitmap backgroundTileBitmap;

    int yTimes = (_context.game.stage.sourceHeight /
        backgroundTileBitmapdata.height).ceil();
    int xTimes = (_context.game.stage.sourceWidth /
        backgroundTileBitmapdata.width).ceil();

    if (!repeatX) xTimes = 1;
    if (!repeatY) yTimes = 1;

    for (int i = -1; i < yTimes; i++) {
      for (int j = -1; j < xTimes; j++) {
        backgroundTileBitmap = new StageXL.Bitmap(backgroundTileBitmapdata);
        backgroundTileBitmap
            ..x = backgroundTileBitmap.width * j
            ..y = backgroundTileBitmap.height * i;
        _backgroundTileList.add(backgroundTileBitmap);
      }
    }

    this.isMovable = isMovable;
    if (addToStage) {
      this.addToStage();
    }
  }

  Background.textureatlas(State stateContext, String textureAtlasName, String
      resourceName, {bool isMovable: false, bool addToStage: true, bool repeatX:
      true, bool repeatY: true}) : super() {

    _context = stateContext;

    StageXL.BitmapData backgroundTileBitmapdata =
        stateContext.game.resourceManager.getTextureAtlas(textureAtlasName)
        .getBitmapData(resourceName);
    StageXL.Bitmap backgroundTileBitmap;

    int yTimes = (_context.game.stage.sourceHeight /
        backgroundTileBitmapdata.height).ceil();
    int xTimes = (_context.game.stage.sourceWidth /
        backgroundTileBitmapdata.width).ceil();

    if (!repeatX) xTimes = 1;
    if (!repeatY) yTimes = 1;

    for (int i = -1; i < yTimes; i++) {
      for (int j = -1; j < xTimes; j++) {
        backgroundTileBitmap = new StageXL.Bitmap(backgroundTileBitmapdata);
        backgroundTileBitmap
            ..x = backgroundTileBitmap.width * j
            ..y = backgroundTileBitmap.height * i;
        _backgroundTileList.add(backgroundTileBitmap);
      }
    }

    this.isMovable = isMovable;
    if (addToStage) {
      this.addToStage();
    }

  }

  addToStage() {
    _backgroundTileList.forEach((tile) {
      _context.game.stage.addChild(tile);
    });
    if (isMovable) {
      _context.game.stage.juggler.add(this);
    }
  }

  @override
  bool advanceTime(num time) {
    _backgroundTileList.forEach((tile) {
      tile.x = tile.x + vx * time;
      tile.y = tile.y + vy * time;

      if (tile.x >= _context.game.stage.sourceWidth) {
        tile.x = tile.x - _context.game.stage.sourceWidth - tile.width;
      } else if (tile.y >= _context.game.stage.sourceHeight) {
        tile.y = tile.y - _context.game.stage.sourceHeight - tile.height;
      }
    });

  }
}
