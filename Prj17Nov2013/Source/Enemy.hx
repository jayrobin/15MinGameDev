package ;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxMath;

/**
 * ...
 * @author Blockjack
 */
class Enemy extends FlxSprite
{
	public function new() 
	{
		super();
		makeGraphic(8, 8, 0xffff0000);
	}
	
	override public function update():Void {
		super.update();
		
		// fade enemy out slowly and kill when it is nearly invisible
		alpha -= 0.0015;
		if (alpha < 0.2) {
			kill();
		}
	}
	
	override public function reset(x:Float, y:Float):Void {
		alpha = 1;
		
		var rndPos:Int = FlxMath.rand(0, 3);
		
		var xv:Float = 0;
		var yv:Float = 0;
		var multiplier:Float = (Math.random() * 2) + 0.5;	// set the enemy speed between 0.5 and 2.5 times the base speed
		
		// enemies randomly come in from top/bottom/left/right
		switch(rndPos) {
			case 0:
				x = Math.random() * FlxG.width;
				y = 0;
				yv = 50 * multiplier;
			case 1:
				x = Math.random() * FlxG.width;
				y = FlxG.height - height;
				yv = -50 * multiplier;
			case 2:
				x = 0;
				y = Math.random() * FlxG.height;
				xv = 50 * multiplier;
			case 3:
				x = FlxG.width - width;
				y = Math.random() * FlxG.height;
				xv = -50 * multiplier;
		}
		
		super.reset(x, y);
		velocity.x = xv;
		velocity.y = yv;
	}
	
}