package
{
	import flash.display.Graphics;
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{
		[Embed(source = "ufo.png")] private static var ImgUfo:Class;
		[Embed(source = "cow.png")] private static var ImgCow:Class;
		private var player:FlxSprite;
		private var cow:FlxSprite;
		
		override public function create():void
		{
			//FlxG.framerate = 60;
			//FlxG.flashFramerate = 60;
			
			//add(new FlxText(0,0,100,"Hello fucked up World!")); //adds a 100px wide text field at position 0,0 (upper left)
			
			
			player = new FlxSprite(20, 15);
			player.loadGraphic(ImgUfo, false, false, 27, 19);
			//player1.maxVelocity.x = 80
			//player1.maxVelocity.y = 200
			//player1.acceleration.y = 200
			//player1.drag.x
			add(player);
			
			cow = new FlxSprite(20, 140);
			cow.loadGraphic(ImgCow, false, false, 28, 24);
			cow.maxVelocity.y = 200;  // controling how the players behave
			//cow.drag.y = cow.maxVelocity.x * 4;
			add(cow);
			
			
		}
		
		override public function update():void {
			if (FlxG.keys.SPACE) { //FlxG.keys.justPressed("SPACE"))
				// Tractor beam
				cow.acceleration.y = -100;
			} else if (cow.y < 144) {
				// Gravity
				cow.acceleration.y = 100;
			} else {
				// Floor and ceiling
				cow.acceleration.y = 0;
				cow.velocity.y = 0;
			}
			

			
			super.update();
		}
	}
}