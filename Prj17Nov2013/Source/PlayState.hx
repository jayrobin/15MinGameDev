package ;

import nme.display.BitmapData;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxState;
import org.flixel.FlxText;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Player;
	private var score:Int;
	private var scoreTxt:FlxText;
	private var enemies:FlxGroup;
	private var enemyChance:Float;
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.camera.bgColor = 0xff131c1b;
		FlxG.mouse.show(new BitmapData(1, 1, true, 0x0));

		super.create();
		
		player = new Player();
		enemies = new FlxGroup();
		
		enemyChance = 0.95;
		score = 0;
		
		scoreTxt = new FlxText(0, FlxG.height >> 1, FlxG.width, "", 32);
		scoreTxt.alignment = "center";
		scoreTxt.color = 0x555555;
		
		add(scoreTxt);
		add(player);
		add(enemies);
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
		
		// randomly create a new enemy every few frames
		// every time an enemy is created, the chance to create another increases
		if (Math.random() > enemyChance) {
			var enemy:Enemy = cast(enemies.recycle(Enemy), Enemy);
			enemy.reset(0, 0);
			enemyChance -= 0.001;
		}
		
		if (player.alive) {
			score++;
			scoreTxt.text = score + "";
		}
		else {
			scoreTxt.text = "Click to try again\nScore: "  + score;
		}
		
		FlxG.overlap(player, enemies, playerCollideWithEnemy);
	}
	
	private function playerCollideWithEnemy(player:FlxObject, enemy:FlxObject):Void {
		player.kill();
	}
}