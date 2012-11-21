package states
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	import levels.*;
	import sprites.*;

	/*
	 * Game
	 */
	public class PlayState extends FlxState
	{
		public static const upperWall:int = 46;
		public static const lowerWall:int = FlxG.height - 2;
		public static const levelList:Array = [LevelFarm, LevelCity, LevelMars];
		public static const health:int = 50;
		
		private var speed:int = 1;
		private var time:Number;
		private var currentLevel:int = 0;
		
		private var startY:int;
		private var levelLength:int;
		private var progress:int = 0;
		private var pulse:int = 0;
		private var score:int = 0;
		public var percentComplete:Number;
		public var healthPercent:Number;
		
		private var focus:FlxObject;
		private var level:Level;
		private var ufo:Ufo;
		private var cow:Cow;
		private var scoreText:FlxText;
		private var progressText:FlxText;
		private var healthBar:FlxBar;
		
		public function PlayState(currentLevel:int = 0, score:Number = 0, startY:int = 150) {
			super();
			
			this.currentLevel = currentLevel;
			this.score = score;
			this.startY = startY;
		}
		
		override public function create():void {
			[Embed(source = '../../assets/music/theme.mp3')] var MusicTheme:Class;
			
			// Create level
			level = new levelList[currentLevel]();
			level.initObstacles();
			levelLength = level.getLength();
			CONFIG::debug {
				FlxG.watch(level, "difficulty", "Difficulty");
			}
			
			// Ufo + Cow
			ufo = new Ufo(0, 10);
			cow = new Cow(health, startY);
			ufo.x = cow.x + (cow.width - ufo.width) / 2;
			
			// Score
			var scoreWidth:int = 80;
			scoreText = new FlxText(FlxG.width - scoreWidth, 5, scoreWidth);
			scoreText.color = 0xffffffff;
			scoreText.shadow = 0xff000000;
			scoreText.scrollFactor = new FlxPoint(0, 0);
			
			// Percent complete
			progressText = new FlxText(FlxG.width - scoreWidth, 18, scoreWidth);
			progressText.color = 0xffffffff;
			progressText.shadow = 0xff000000;
			progressText.scrollFactor = new FlxPoint(0, 0);
			
			// Health bar
			healthBar = new FlxBar(FlxG.width - 78, 35, FlxBar.FILL_LEFT_TO_RIGHT, 74, 8, this, "healthPercent", 0, 1);
			healthBar.scrollFactor = new FlxPoint(0, 0);
			
			add(level);
			add(ufo);
			add(cow);
			add(scoreText);
			add(progressText);
			add(healthBar);
			
			// Needs to be so big for collision to work properly
			FlxG.worldBounds.width = levelLength;
			
			var finishLine:FlxSprite = new FlxSprite(levelLength, 0);
			finishLine.makeGraphic(1, FlxG.height, 0xff333333);
			add(finishLine);
			
			// Camera focus
			focus = new FlxObject(FlxG.width / 2, FlxG.height / 2);
			FlxG.camera.follow(focus);
			
			// Play music at full volume, but don't play if there's already something else playing
			if (score == 0) {
				FlxG.playMusic(MusicTheme, 1);
			}
		}
		
		override public function update():void {
			// Move the camera
			focus.x += speed;
			progress += speed;
			score += speed;
			pulse += speed;
			time += FlxG.elapsed;
			percentComplete = progress / levelLength;
			
			// Keep the cow and the UFO in sync with the camera
			cow.x += speed;
			ufo.x += speed;
			
			// Update the HUD
			scoreText.text    = "  Score: " + score;
			progressText.text = "Level " + (currentLevel + 1) + ": " + int(percentComplete * 100) + "%";
			
			// Add enemies
			var spacing:int = FlxG.width / level.difficulty;
			if (pulse > spacing) {
				level.addObstacle(progress + FlxG.width);
				pulse = 0;
			}
			
			// Increase difficulty (enemies on the screen)
			increaseDifficulty(FlxG.elapsed);
			
			// Gravity
			cow.acceleration.y = 100;
			
			// Player movement
			if (FlxG.keys.justPressed("SPACE")) {
				cow.velocity.y -= 75;
			}
			
			// Collision
			if (FlxG.collide(level.getObstacles(), cow)) {
				FlxG.camera.shake(0.005, 0.1);
			}
			
			// Update health
			var cutoff:int = progress - cow.width;
			healthPercent = (cow.x - cutoff) / (health + cow.width);
			// Game almost lost
			if (cow.x < cutoff + cow.width) {
				FlxG.camera.flash(0x77ff0000, 0.5);
			}
			// Game lost
			if (cow.x < cutoff) {
				gotoGameOver();
			}
			// Level complete
			if (progress >= levelLength) {
				gotoNextLevel();
			}
			
			super.update();
		}
		
		// Private
		
		private function increaseDifficulty(timeElapsed:Number):void {
			// Difficulty is the number of enemies on the screen. Adds one enemy every ten seconds
			level.difficulty += timeElapsed / 10;
			
			//speed = difficulty / 10 - 1;
			//if (speed < 1) {
			//	speed = 1;
			//}
		}
		
		private function gotoGameOver():void {
			FlxG.music.stop();
			FlxG.switchState(new GameOverState(score));
		}
		
		private function gotoNextLevel():void {
			currentLevel++;
			if (currentLevel < levelList.length) {
				// Next level
				FlxG.switchState(new PlayState(currentLevel, score, cow.y));
			} else {
				// No more levels
				gotoWin();
			}
		}
		
		private function gotoWin():void {
			FlxG.music.stop();
			FlxG.switchState(new WinState(score));
		}
		
		// Static
		
		public static function random(low:int, high:int):int {
			return Math.floor(FlxG.random() * (1 + high - low)) + low;
		}

	}
}