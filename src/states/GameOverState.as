package states
{
	import org.flixel.*;
	
	/**
	 * Game Over screen
	 * @author Jannes Meyer
	 */
	public class GameOverState extends FlxState 
	{
		private var score:int;
		private var time:Number = 0;
		
		public function GameOverState(score:int) {
			super();
			this.score = score;
		}
		
		override public function create():void {
			[Embed(source = '../../assets/music/gameover.mp3')] var MusicGameOver:Class;
			
			var gameOverText:FlxText = new FlxText(0, 100, FlxG.width, "GAME OVER");
			gameOverText.alignment = "center";
			gameOverText.size = 32;
			
			var scoreText:FlxText = new FlxText(0, 180, FlxG.width, "Score: " + score);
			scoreText.alignment = "center";
			scoreText.size = 8;
			
			add(gameOverText);
			add(scoreText);
			
			// Moo
			FlxG.play(MusicGameOver, 1);
		}
		
		override public function update():void {
			time += FlxG.elapsed;
			
			// Restart only possible after 1 second
			if (FlxG.keys.any() && time > 1) {
				FlxG.switchState(new MainMenuState(false));
			}
			
			super.update();
		}
		
	}

}