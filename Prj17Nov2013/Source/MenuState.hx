package ;
import nme.display.BitmapData;
import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

/**
 * ...
 * @author Blockjack
 */
class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		// Set a background color
		FlxG.camera.bgColor = 0xff131c1b;
		FlxG.mouse.show(new BitmapData(1, 1, true, 0x0));
		
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
	
	override public function update():Void {
		super.update();
		
		if (FlxG.mouse.justPressed()) {
			FlxG.switchState(new PlayState());
		}
	}
	
}