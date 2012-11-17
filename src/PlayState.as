package
{
	import flash.display.Graphics;
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{
		private var ufo:FlxSprite;
		private var cow:Cow;
		private var floor:FlxTileblock;
		
		override public function create():void
		{
			[Embed(source = "../assets/ufo.png")] var ImgUfo:Class;
			
			FlxG.log("Starting the game");
			//add(new FlxText(0,0,100,"Hello beautiful World!"));
			
			ufo = new FlxSprite(20, 15);
			ufo.loadGraphic(ImgUfo, false, false, 27, 19);
			add(ufo);
			
			cow = new Cow();
			add(cow);
			
			floor = new FlxTileblock(0, 208, 336, 32);
			floor.makeGraphic(336, 32, 0xff689c16);
			add(floor);
		}
		
		override public function update():void {
			if (!FlxG.keys.SPACE) {
				cow.acceleration.y = 100;
			} else {
				cow.acceleration.y = -100;
			}
			
			super.update();
		}
	}
}