package ;

import flash.display.BitmapData;
import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Set a background color and hide the mouse
		FlxG.camera.bgColor = 0xff131c1b;
		FlxG.mouse.show(new BitmapData(1, 1, true, 0x0));

		super.create();
		
		var titleTxt:FlxText = new FlxText(0, FlxG.height / 4, FlxG.width, Constants.TITLE, 32);
		titleTxt.color = 0x555555;
		titleTxt.alignment = "center";
		add(titleTxt);
		
		var descriptionTxt:FlxText = new FlxText(0, FlxG.height / 2, FlxG.width, Constants.DESCRIPTION, 16);
		descriptionTxt.color = 0x555555;
		descriptionTxt.alignment = "center";
		add(descriptionTxt);
		
		var clickTxt:FlxText = new FlxText(0, FlxG.height - FlxG.height / 4, FlxG.width, "Click to play", 16);
		clickTxt.alignment = "center";
		add(clickTxt);
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
		
		if (FlxG.mouse.justPressed()) {
			FlxG.switchState(new PlayState());
		}
	}
}