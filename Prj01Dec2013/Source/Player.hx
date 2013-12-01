package ;
import org.flixel.addons.FlxSpriteAniRot;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Blockjack
 */
class Player extends FlxSprite
{
	var jump:Int = 0;

	public function new() 
	{
		super();
		
		makeGraphic(16, 32, 0xffaabbcc);
		x = FlxG.width / 2;
		y = FlxG.height / 2;
		
		acceleration.y = 800;
	}
	
	override public function update():Void
	{
		super.update();
		
		//acceleration.x = 0;
		drag.x = 1000;
		
		jump--;
		if (isTouching(FlxObject.DOWN)) {
			jump = 30;
		}
		
		if (FlxG.keys.UP  && jump > 0) {
			velocity.y = -200;
		}
		if (FlxG.keys.LEFT) {
			//acceleration.x = -500;
			velocity.x = -200;
		}
		if (FlxG.keys.RIGHT) {
			//acceleration.x = 500;
			velocity.x = 200;
		}
	}
	
}