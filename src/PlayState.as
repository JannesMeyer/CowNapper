package
{
	import flash.display.Graphics;
	import org.flixel.*;

	
	public class PlayState extends FlxState
	{
		private var speed:int = 1;
		private var counter:Number = 0;
		
		private var focus:FlxObject;
		private var level;
		private var obstacles:FlxGroup;
		private var ufo:Ufo;
		private var cow:Cow;

		public static function random(low:int, high:int):int {
			return Math.floor(Math.random() * (1 + high - low)) + low;
		}
		
		override public function create():void
		{
			level = new LevelFarm();
			ufo = new Ufo(10, 10);
			cow = new Cow(39, 100);
			
			add(level);
			add(ufo);
			add(cow);
			
			// Needs to be that big for collision to work properly
			FlxG.worldBounds.width = level.getLength();
			obstacles = level.getObstacles();
			
			// Camera focus
			focus = new FlxObject(FlxG.width / 2, FlxG.height / 2);
			FlxG.camera.follow(focus);
			
			// HUD
			//var text:FlxText = new FlxText(0, 0, 20, "Hello beautiful World!");
			//text.scrollFactor = new FlxPoint(0, 0);
			//add(text);
		}
		
		override public function update():void {
			// Move the camera
			focus.x += speed;
			// Keep the cow and the UFO in sync with the camera
			cow.x += speed;
			ufo.x += speed;
			
			// Time
			counter += FlxG.elapsed;
			
			// Gravity
			cow.acceleration.y = 100;
			// Handle button press
			if (FlxG.keys.justPressed("SPACE")) {
				cow.velocity.y -= 75;
			}
			
			// Collision
			if (FlxG.collide(obstacles, cow)) {
				FlxG.camera.shake(0.005, 0.1);
				//FlxG.play(SoundEffect);
			}
			
			// Game lost?
			var cutoff:int = (focus.x - FlxG.width / 2) - cow.width;
			if (cow.x < cutoff) {
				FlxG.camera.flash(0x99ff0000, 0.5);
			}
			
			super.update();
		}
	}
}