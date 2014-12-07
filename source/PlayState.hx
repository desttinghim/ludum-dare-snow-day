package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.tile.FlxTilemapExt;
import flixel.FlxCamera;
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
	private var mapFantasy:FlxOgmoLoader;
	private var mapWalls:FlxTilemap;
	private var mapWallsFantasy:FlxTilemap;
	
	private var fantasyBtn:FlxButton;
	private var scifiBtn:FlxButton;
	private var lookingAtBooks:Bool;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		map = new FlxOgmoLoader(AssetPaths.room__oel);
		mapWalls = map.loadTilemap(AssetPaths.tiles__png, 32, 32, "Tiles");
		mapWalls.setTileProperties(1, FlxObject.ANY);
		add(mapWalls);
		
		mapFantasy = new FlxOgmoLoader(AssetPaths.roomFantasy__oel);
		mapWallsFantasy = mapFantasy.loadTilemap(AssetPaths.tiles__png,32,32,"Tiles");
		mapWallsFantasy.setTileProperties(1, FlxObject.ANY);
		add(mapWallsFantasy);
		mapWallsFantasy.set_visible(false);
		
		player = new Player();
		bookcase = new Bookcase();
		map.loadEntities(placeEntities, "Entities");
		
		fantasyBtn = new FlxButton(16, 16, "Magical Land", startFantasy);
		scifiBtn = new FlxButton(16, 36, "Spaceships");
		
		add(bookcase);
		add(player);
		add(fantasyBtn);
		add(scifiBtn);
		
		FlxG.camera.follow(player, FlxCamera.STYLE_NO_DEAD_ZONE, 1);
		FlxG.camera.setBounds( -480, -320, FlxG.stage.stageWidth * 3, FlxG.stage.stageHeight * 3);
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
		FlxG.overlap(player, bookcase, bookcaseLook);
		if(mapWalls.visible) {
			FlxG.collide(player, mapWalls);
		} else if(mapWallsFantasy.visible) {
			FlxG.collide(player, mapWallsFantasy);
		}
		
		if(lookingAtBooks) {
			fantasyBtn.set_visible(true);
			fantasyBtn.set_active(true);
			scifiBtn.set_visible(true);
			scifiBtn.set_active(true);
		} else {
			fantasyBtn.set_visible(false);
			fantasyBtn.set_active(false);
			scifiBtn.set_visible(false);
			scifiBtn.set_active(false);
		}
		
		lookingAtBooks = false;
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "Player") {
			player.x = x;
			player.y = y;
		} else if (entityName == "Bookcase") {
			bookcase.x = x;
			bookcase.y = y;
		}
	}
	
	private function bookcaseLook( object1:FlxObject, object2:FlxObject ):Void {
		lookingAtBooks = true;
	}
	
	private function startFantasy() {
		mapWalls.set_visible(false);
		mapWallsFantasy.set_visible(true);
	}
}