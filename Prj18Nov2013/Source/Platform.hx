package ;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Blockjack
 */
class Platform extends FlxSprite
{
	var startedTimer:Bool;
	public var speed:Float;
	
	public function new() 
	{
		super();
	}
	
	override public function reset(x:Float, y:Float):Void {
		makeGraphic(Std.int(Math.random() * FlxG.width / 1.5 + FlxG.width / 2), FlxG.height, 0xffaaaaaa);
		startedTimer = false;
		drag.y = 1000;
		super.reset(FlxG.width, y);
	}
	
	override public function update():Void {
		super.update();
		x -= speed;
		
		if (x < 0 && !startedTimer) {
			Reg.engine.startPlatformTimer();
			startedTimer = true;
		}
		if (x < -width) {
			kill();
		}
	}
	
}