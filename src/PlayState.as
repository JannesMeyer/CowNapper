package
{
	import flash.display.Graphics;
	import org.flixel.*;

	
	public class PlayState extends FlxState
	{
		private var ufo:FlxSprite;
		private var cow:Cow;
		private var background:FlxSprite;
		private var floor:FlxTileblock;
		private var focus:FlxObject;
		private var counter:Number = 0;
		private var birds:FlxGroup;

		public static function random(low:int, high:int) {
			return Math.floor(Math.random() * (1 + high - low)) + low;
		}
		
		override public function create():void
		{
			[Embed(source = "../assets/background2.png")] var ImgBg:Class;
			[Embed(source="../assets/die2.mp3")] var SoundEffect:Class;
			
			
			FlxG.log("Starting the game");
			//add(new FlxText(0,0,100,"Hello beautiful World!"));

			//Use stream() to load a sound from a URL.
			//Here we are loading music.mp3 at half volume and telling it to loop.
			FlxG.stream("data/music.mp3",0.5,true);
			
			focus = new FlxObject(FlxG.width / 2, FlxG.height / 2);
			FlxG.log(FlxG.width);
			FlxG.camera.follow(focus);
			
			
			background = new FlxSprite(0, 0);
			background.loadGraphic(ImgBg, false, false, 3072, 600);
			background.scrollFactor.x = 0.5;
			background.scrollFactor.x = 0.5;
			add(background);
			
			ufo = new Ufo(10, 10);
			add(ufo);
			
			cow = new Cow(39, 100);
			//cow.scrollFactor.x = 0;
			//cow.scrollFactor.y = 0;
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
			// Move the camera
			focus.x += 1;
			cow.x += 1;
			ufo.x += 1;
			
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
				cow.velocity.y += -50;
			}
			
			// Collision
			if (FlxG.collide(birds, cow)) {
				FlxG.log(cow.x);
				FlxG.log("Mooh! " + counter);
				FlxG.play(SoundEffect);
			}
			
			super.update();
		}
	}
}