package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author DIMN
 */
class Player extends FlxSprite
{
	public var speed:Float = 200;

	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		makeGraphic(32, 32, FlxColor.BLUE);
		drag.x = drag.y = 1600;
	}
	
	override public function update() {
		super.update();
		movement();
	}
	
	private function movement():Void {
		var left:Bool = false, right:Bool, up:Bool, down:Bool;
		
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			velocity.x = -speed;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			velocity.x = speed;
		}
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			velocity.y = -speed;
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			velocity.y = speed;
		}
	}
	
}