package ;
import org.flixel.addons.FlxSpriteAniRot;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxVelocity;

/**
 * ...
 * @author Blockjack
 */
class Sheep extends FlxSprite
{
	var player:FlxSprite;
	
	public function new(player:FlxSprite ) 
	{
		super(Math.random() * FlxG.width, Math.random() * FlxG.height);
		makeGraphic(16, 16, 0xffaaaaaa);
		
		this.player = player;
	}
	
	override public function update():Void {
		super.update();
		
		var dist:Float = FlxVelocity.distanceBetween(this, player);
		if (dist < 100 && dist > 20) {
			FlxVelocity.moveTowardsObject(this, player);
		}
		else {
			velocity.x = velocity.y = 0;
		}
	}
	
}