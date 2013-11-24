package ;

import org.flixel.addons.FlxSpriteAniRot;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.plugin.photonstorm.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var player:FlxSprite;
	var wolves:FlxGroup;
	var herd:FlxGroup;
	var pen:FlxSprite;
	var scoreTxt:FlxText;
	var score:Int;
	
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();
		
		scoreTxt = new FlxText(0, FlxG.height / 2 - 16, FlxG.width, "", 32);
		scoreTxt.color = 0xaaaaaaaa;
		scoreTxt.alignment = "center";
		add(scoreTxt);
		
		pen = new FlxSprite(FlxMath.rand(0, FlxG.width - 64), FlxMath.rand(0, FlxG.height - 64));
		pen.makeGraphic(64, 64, 0xffaaffaa);
		add(pen);
		
		player = new Player();
		add(player);
		
		for (i in 0...2) {
			createWolf();
		}
		add(wolves);
		
		for (i in 0...15) {
			createSheep();
		}
		add(herd);
		
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
		
		FlxG.collide(herd, herd);
		FlxG.overlap(herd, wolves, sheepOverlapWolf);
		FlxG.overlap(herd, pen, sheepOverlapPen);
		
		if (herd.countLiving() == 0) {
			scoreTxt.text = score + " saved\nClick to retry";
			
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(new PlayState());
			}
		}
	}
	
	private function createWolf():Void {
		if (wolves == null) {
			wolves = new FlxGroup();
		}
		
		var wolf:Wolf = new Wolf();
		wolves.add(wolf);
	}
	
	private function createSheep():Void {
		if (herd == null) {
			herd = new FlxGroup();
		}
		
		var sheep:Sheep = new Sheep(player);
		herd.add(sheep);
	}
	
	private function sheepOverlapWolf(sheep:FlxObject, wolf:FlxObject):Void {
		sheep.kill();
	}
	
	private function sheepOverlapPen(sheep:FlxObject, pen:FlxObject):Void {
		sheep.kill();
		score++;
		scoreTxt.text = score + " saved";
	}
}