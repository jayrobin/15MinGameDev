package ;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Blockjack
 */
class Player extends FlxSprite
{

	public function new() 
	{
		super();
		makeGraphic(16, 16, 0xff00ff00);
	}
	
	override public function update():Void {
		super.update();
		
		if (alive) {
			x = FlxG.mouse.x;
			y = FlxG.mouse.y;
		}
	}
	
}