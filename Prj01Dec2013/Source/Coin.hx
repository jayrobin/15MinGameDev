package ;
import org.flixel.addons.FlxSpriteAniRot;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxMath;

/**
 * ...
 * @author Blockjack
 */
class Coin extends FlxSprite
{

	public function new() 
	{
		super();
		
		makeGraphic(8, 8, 0xffccbbaa);
		x = FlxMath.rand(32, FlxG.width - 32 - width);
		y = FlxMath.rand(32, FlxG.height - 32 - width);
		
		acceleration.y = 400;
		
		velocity.x = FlxMath.rand( -50, 50);
		velocity.y = FlxMath.rand( -200, 0);
		drag.x = FlxMath.rand(5, 20);
		
		elasticity = 0.5;
	}
	
}