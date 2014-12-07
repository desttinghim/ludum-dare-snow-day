package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.tile.FlxTilemapExt;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Player;
	private var bookcase:Bookcase;
	private var map:FlxOgmoLoader;
	private var mapWalls:FlxTilemap;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		map = new FlxOgmoLoader(AssetPaths.room__oel);
		mapWalls = map.loadTilemap(AssetPaths.tiles__png, 32, 32, "Tiles");
		mapWalls.setTileProperties(0, FlxObject.NONE);
		mapWalls.setTileProperties(1, FlxObject.ANY);
		add(mapWalls);
		
		player = new Player();
		bookcase = new Bookcase();
		map.loadEntities(placeEntities, "Entities");
		add(player);
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
		FlxG.collide(player, mapWalls);
		FlxG.overlap(player, bookcase, bookcaseLook);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "Player") {
			player.x = x;
			player.y = y;
		}
	}
	
	private function bookcaseLook( object1:FlxObject, object2:FlxObject ):Void {
		subState(new BookcaseState());
	}
}