package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxG;

import flixel.math.FlxPoint;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;

class PlayState extends FlxState {
  var background:FlxSprite;
  var box:FlxSprite;
  var text:FlxBitmapText;

  override public function create():Void {
    super.create();

    background = new FlxSprite();
    background.makeGraphic(640, 480, 0xff1D2B53);
    add(background);

    box = new FlxSprite();
    box.makeGraphic(640, 200, 0xffAB5236);
    box.y = 380;
    add(box);

    var font = FlxBitmapFont.fromMonospace(
      "assets/images/fonts/alphabetMono.png",
      "abcdefghijklmnopqrstuvwxyz",
      new FlxPoint(8, 8)
    );

    text = new FlxBitmapText(font);
    text.letterSpacing = -1;
    text.scale.x = text.scale.y = 3;
    add(text);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);

    if (FlxG.keys.justPressed.C) {
      box.y = 380;
    }

    if (FlxG.keys.justPressed.X) {
      box.y = 380;
      text.text = "no anticipation";
      FlxTween.tween(box, { y: 480 }, 0.5, {
        ease: FlxEase.quadIn,
        startDelay: 1,
      });
    }

    if (FlxG.keys.justPressed.Z) {
      box.y = 380;
      text.text = "anticipation";
      FlxTween.tween(box, { y: 350 }, 0.25, {
        ease: FlxEase.quadOut,
        startDelay: 1,
        onComplete: function(t) {
          FlxTween.tween(box, { y: 480 }, 0.5, {
            ease: FlxEase.quadIn
          });
        }
      });
    }

    text.x = FlxG.width/2 - text.width/2;
    text.y = FlxG.height/2 - text.height/2;
  }
}
