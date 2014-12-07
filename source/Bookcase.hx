package ;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author DIMN
 */
class Bookcase extends FlxSprite
{

	public function new(X:Float = 0, Y:Float = 0 ) {
		
		super(X, Y);
		
		makeGraphic(32, 32, FlxColor.RED);
		immovable = true;
	}
	
}