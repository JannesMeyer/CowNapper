package
{
	import flash.display.Graphics;
	import org.flixel.*;

	
	public class PlayState extends FlxState
	{
		private var ufo:FlxSprite;
		private var cow:Cow;
		//private var background:FlxSprite;
		private var background:FlxTilemap;
		private var floor:FlxTileblock;
		private var focus:FlxObject;
		private var counter:Number = 0;
		private var birds:FlxGroup;

		public static function random(low:int, high:int) {
			return Math.floor(Math.random() * (1 + high - low)) + low;
		}
		
		override public function create():void
		{
			[Embed(source = "../assets/level1_tiles.png")] var ImgBg:Class;
			//[Embed(source="../assets/moo.mp3")] var SoundEffect:Class;
			
			
			
			//add(new FlxText(0,0,100,"Hello beautiful World!"));

			//Use stream() to load a sound from a URL.
			//Here we are loading music.mp3 at half volume and telling it to loop.
			//FlxG.stream("data/music.mp3",0.5,true);
			
			focus = new FlxObject(FlxG.width / 2, FlxG.height / 2);
			FlxG.camera.follow(focus);
			
			
			background = new FlxTilemap();
			background.loadMap("0,1,2,0,1,2,0,1,2", ImgBg, 512, 300, NaN, 0, 0);
			FlxG.log(background.width);
			background.scrollFactor.x = 0.5;
			background.scrollFactor.y = 0;
			add(background);
			
			// Needs to be that big for collision to work properly
			FlxG.worldBounds.width = background.width;
			
			ufo = new Ufo(10, 10);
			add(ufo);
			
			cow = new Cow(39, 100);
			add(cow);
			
			birds = new FlxGroup();
			for (var i:int; i < 200; i++) {
				birds.add(new Bird(i * 20, PlayState.random(46, FlxG.height - 40)));
			}
			
			add(birds);
			//floor = new FlxTileblock(0, 208, 336, 32);
			//floor.makeGraphic(336, 32, 0xff689c16);
			//floor.scrollFactor.x = 0;
			//floor.scrollFactor.y = 0;
			//add(floor); 
		}
		
		override public function update():void {
			var speed:int = 1;
			
			// Move the camera
			focus.x += speed;
			// Keep the cow and the UFO in sync with the camera
			cow.x += speed;
			ufo.x += speed;
			
			// Time
			counter += FlxG.elapsed;
			// After 2 seconds has passed, the timer will reset.
			if (counter >= 2) {
				counter = 0;
			}
			
			// Gravity
			cow.acceleration.y = 100;
			
			// Handle button press
			if (FlxG.keys.justPressed("SPACE")) {
				cow.velocity.y -= 100;
			}
			
			// Collision
			if (FlxG.collide(birds, cow)) {
				//FlxG.camera.flash(0x33ff0000, 0.5);
				//FlxG.play(SoundEffect);
				FlxG.camera.shake(0.005, 0.1);
			}
			
			// Is someone losing the game?
			var cutoff:int = (focus.x - FlxG.width / 2) - cow.width;
			if (cow.x < cutoff) {
				FlxG.log("you lose");
				FlxG.camera.flash(0x99ff0000, 0.4);
			}
			
			
			super.update();
		}
	}
}