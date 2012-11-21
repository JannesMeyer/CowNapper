package states
{
	import org.flixel.*;
	
	/**
	 * Win screen
	 * @author Jannes Meyer
	 */
	public class WinState extends FlxState 
	{
		private var score:int;
		private var counter:Number = 0;
		
		public function WinState(score:int) {
			super();
			this.score = score;
		}
		
		override public function create():void {
			[Embed(source = '../../assets/nyan_tiles.png')] var ImgBackground:Class;
			[Embed(source = "../../assets/nyan.png")] var ImgNyan:Class;
			[Embed(source = "../../assets/music/nyan.mp3")] var MusicNyan:Class;
			
			var nyan:FlxSprite = new FlxSprite(0, 0);
			nyan.loadGraphic(ImgNyan, true, false, 65, 25, false);
			nyan.addAnimation("nyan", [0, 1, 2, 3], 10, true);
			nyan.x = (FlxG.width - nyan.width) / 2;
			nyan.y = 175;
			nyan.scale.x = 3;
			nyan.scale.y = 3;
			nyan.play("nyan");
			
			
			var background:FlxSprite = new FlxSprite(0, 0, ImgBackground);
			
			var winText:FlxText = new FlxText(0, 20, FlxG.width, "YOU WIN");
			winText.alignment = "center";
			winText.size = 32;
			
			var scoreText:FlxText = new FlxText(0, 100, FlxG.width, "Score: " + score);
			scoreText.alignment = "center";
			scoreText.size = 8;
			
			add(background);
			add(winText);
			add(scoreText);
			add(nyan);
			
			// Play music at full volume
			FlxG.playMusic(MusicNyan, 1);
		}
		
		override public function update():void {
			// Time
			counter += FlxG.elapsed;
			
			// Restart only possible after 1 second
			if (FlxG.keys.any() && counter > 1) {
				FlxG.switchState(new MainMenuState(false));
			}
			super.update();
		}
		
	}

}