package ;

import flixel.FlxSubState;
import flixel.ui.FlxButton;

/**
 * ...
 * @author DIMN
 */
class BookcaseState extends FlxSubState
{
	private var fantasyBtn:FlxButton;

	public function new(BGColor:Int=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
		fantasyBtn = new FlxButton(128, 128, "Hero of Yonder");
		
	}
	
}