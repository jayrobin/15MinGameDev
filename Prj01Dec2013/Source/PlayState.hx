package ;

import org.flixel.addons.FlxGridSprite;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxTilemap;
import org.flixel.plugin.photonstorm.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var score:Int;
	private var time:Float;
	private var timeTxt:FlxText;
	
	private var player:Player;
	private var coins:FlxGroup;
	
	inline private static var TILES_IMG:String = "assets/Tiles.png";
	private var tiles:FlxTilemap;
	private var level:String = "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,\n" + 
								"1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\n";
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();
		
		tiles = new FlxTilemap();
		tiles.loadMap(level, TILES_IMG, 32, 32);
		for (i in 0...30) {
			var x:Int = FlxMath.rand(1, tiles.widthInTiles - 2);
			var y:Int = FlxMath.rand(1, tiles.heightInTiles - 2);
			tiles.setTile(x, y, 1);
		}
		add(tiles);
		
		player = new Player();
		add(player);
		
		coins = new FlxGroup();
		for (i in 1...50) {
			coins.add(new Coin());
		}
		add(coins);
		
		timeTxt = new FlxText(0, FlxG.height / 2 - 16, FlxG.width, "", 32);
		timeTxt.color = 0xaaaaaaaa;
		timeTxt.alignment = "center";
		add(timeTxt);
		
		score = 0;
		time = 20;
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		player.destroy();
		coins.destroy();
		tiles.destroy();
		timeTxt.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		FlxG.collide(player, tiles);
		FlxG.collide(coins, tiles);
		
		if(player.alive) {
			FlxG.overlap(player, coins, playerOverlapCoin);
			
			time -= FlxG.elapsed;
			if (time <= 0 || coins.countLiving() == 0) {
				player.kill();
			}
			timeTxt.text = Std.int(time) + "";
		}
		else {
			timeTxt.text = "You collected " + score + " coins\nClick to try again";
			
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(new PlayState());
			}
		}
	}
	
	private function playerOverlapCoin(player:FlxObject, coin:FlxObject):Void {
		coin.kill();
		score++;
	}
}