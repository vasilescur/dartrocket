part of dartrocket;
/**
 * AnimatedSprite is an interface for animatable sprites.
 * Extends [Sprite] and implements [StageXL.Animatable]
 * SpaceInvader example has a lot of this kind of Sprites.
 * 
 * Parameters of [new AnimatedSprite]:
 * * bitmapdata: bitmapdata of the image
 * * vx: horizontal speed of the sprite
 * * vy: vertical speed of the sprite
 * * x,y: x,y positions of the sprite
 * 
 * Basic example:
 *     class MySprite extends AnimatedSprite{
 *       MySprite(var bitmapData):super(bitmapData);
 *       
 *       bool advanceTime(num time){
 *        //doing stuff
 *       }
 *     }
 * Note: You can only use var for bitmapdata, because DartRocket doesn't have
 * BitMapData.
 * */
abstract class AnimatedSprite extends Sprite implements StageXL.Animatable {
  num vx, vy;

  AnimatedSprite(StageXL.BitmapData bitmapData, {int vx: 0, int vy: 0, 
    int x: 0, int y: 0}): super(bitmapData, x: x, y: y) {
    this.vx = vx;
    this.vy = vy;
  }
}