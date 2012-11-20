package  
{
	import org.flixel.*;
	
	/**
	 * Mars
	 */
	public class LevelMars extends FlxGroup 
	{
		public var obstacles:FlxGroup;
		private var background:FlxTilemap;
		private var difficulty:int = 0;
		
		public function LevelMars() 
		{
			[Embed(source = "../assets/level2_tiles2.png")] var BackgroundTiles:Class;

			super();
			
			// Background tiles
			background = new FlxTilemap();
			background.loadMap("0,0,0", BackgroundTiles, 1500, 300, NaN, 0, 0);
			background.scrollFactor.x = 0.5;
			background.scrollFactor.y = 0;
			add(background);
			
			// Birds as obstacles
			obstacles = new FlxGroup();
			// TODO: How many of these to add?
			for (var i:int; i < 200; i++) {
				obstacles.add(new Alien(i * 20, PlayState.random(46, FlxG.height)));
			}
			add(obstacles);
		}
		
		public function getLength():int {
			return background.width;
		}
		
		public function setDifficulty(diff:int):void {
			this.difficulty = diff;
		}
		
		public function addObstacle():void {
			
		}

	}

}