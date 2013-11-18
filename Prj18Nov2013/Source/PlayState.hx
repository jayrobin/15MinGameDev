package ;

import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxState;
import org.flixel.FlxText;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var player:Player;
	var platforms:FlxGroup;
	
	var currHeight:Float;
	var nextPlatform:Int;
	var platformSpeed:Float;
	
	var score:Int;
	var scoreTxt:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		Reg.engine = this;
		super.create();
		
		
		player = new Player();
		add(player);
		
		platformSpeed = 10;
		platforms = new FlxGroup();
		add(platforms);
		
		scoreTxt = new FlxText(0, FlxG.height / 2 - 16, FlxG.width, "", 32);
		scoreTxt.alignment = "center";
		scoreTxt.color = 0xff666666;
		add(scoreTxt);
		
		currHeight = FlxG.height / 2;
		
		var firstPlatform:Platform = createPlatform();
		firstPlatform.x = 0;
		
		nextPlatform = 100;
		score = 0;
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed() && !player.alive) {
			FlxG.switchState(new PlayState());
		}
		
		if (player.alive) {
			score++;
			scoreTxt.text = score + "";
		}
		else { 
			scoreTxt.text = "Click to retry\nScore: " + score;
		}
		
		FlxG.collide(player, platforms);
		
		nextPlatform--;
		if (nextPlatform == 0) {
			createPlatform();
		}
	}
	
	public function createPlatform():Platform {
		var platform:Platform = cast(platforms.recycle(Platform), Platform);
		platform.reset(0, 0);
		
		platform.y = Std.int(currHeight);
		currHeight += Math.random() * 100 - 50;
		currHeight = Math.max(Math.min(currHeight, FlxG.height - 32), 64);
		
		platform.speed = platformSpeed;
		platformSpeed += 0.1;
		
		return platform;
	}
	
	public function startPlatformTimer():Void {
		nextPlatform = Std.int(Math.random() * 20 + 20);
	}
}