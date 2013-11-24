package ;
import org.flixel.addons.FlxSpriteAniRot;
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
		super(Math.random() * FlxG.width, Math.random() * FlxG.height);
		makeGraphic(16, 32, 0xffaabbcc);
	}
	
	override public function update():Void
	{
		super.update();
		
		velocity.x = velocity.y = 0;
		if (FlxG.keys.UP) {
			velocity.y = -100;
		}
		if (FlxG.keys.DOWN) {
			velocity.y = 100;
		}
		if (FlxG.keys.LEFT) {
			velocity.x = -100;
		}
		if (FlxG.keys.RIGHT) {
			velocity.x = 100;
		}
		
		x = Math.min(Math.max(0, x), FlxG.width - width);
		y = Math.min(Math.max(0, y), FlxG.height - height);
	}
	
}