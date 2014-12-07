package ;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author DIMN
 */
class FantasyState
{
	private var map:FlxOgmoLoader;
	private var mapWalls:FlxTilemap;
	
	override public function create():Void
	{
		super.create();
		
		map = new FlxOgmoLoader(AssetPaths.roomFantasy__oel);
		mapWallsFantasy = map.loadTilemap(AssetPaths.tiles__png,32,32,"Tiles");
		mapWallsFantasy.setTileProperties(0, FlxObject.NONE);
		mapWallsFantasy.setTileProperties(1, FlxObject.ANY);
		add(mapWallsFantasy);
	}
	
}