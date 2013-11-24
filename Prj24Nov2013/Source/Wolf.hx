package ;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Blockjack
 */
class Wolf extends FlxSprite
{

	public function new() 
	{
		super(Math.random() * FlxG.width, Math.random() * FlxG.height);
		makeGraphic(32, 32, 0xffffaaaa);
		
		randomiseVelocity();
	}
	
	override public function update():Void {
		super.update();
		
		if (x <= 0) {
			x = 0;
			velocity.x = -velocity.x;
		}
		else if (x >= FlxG.width - width) {
			x = FlxG.width - width;
			velocity.x = -velocity.x;
		}
		
		if (y <= 0) {
			y = 0;
			velocity.y = -velocity.y;
		}
		else if (y >= FlxG.height - height) {
			y = FlxG.height - height;
			velocity.y = -velocity.y;
		}
		
		if (Math.random() > 0.99) {
			randomiseVelocity();
		}
	}
	
	private function randomiseVelocity():Void {
		velocity.x = Math.random() * 100 - 50;
		velocity.y = Math.random() * 100 - 50;
	}
	
}