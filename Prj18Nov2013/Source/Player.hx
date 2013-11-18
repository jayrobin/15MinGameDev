package ;
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
		makeGraphic(16, 32, 0xff00ff00);
		acceleration.y = 900;
		y = FlxG.height / 2 - height;
		x = 64;
	}
	
	override public function update():Void {
		super.update();
		jump--;
		if (FlxG.mouse.pressed() && jump > 0) {
			velocity.y = -300;
		}
		
		if (isTouching(FlxObject.DOWN)) {
			jump = 30;
		}
		
		if (y > FlxG.height) {
			kill();
		}
	}
	
}