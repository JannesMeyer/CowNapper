package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LevelFarm extends FlxGroup 
	{
		private var background:FlxTilemap;
		private var obstacles:FlxGroup;
		private var difficulty:int = 0;
		
		public function LevelFarm() 
		{
			[Embed(source = "../assets/level1_tiles.png")] var BackgroundTiles:Class;

			super();
			
			// Background tiles
			background = new FlxTilemap();
			background.loadMap("0,1,2,0,1,2,0,1,2", BackgroundTiles, 512, 300, NaN, 0, 0);
			background.scrollFactor.x = 0.5;
			background.scrollFactor.y = 0;
			add(background);
			
			// Birds as obstacles
			obstacles = new FlxGroup();
			// TODO: How many of these to add?
			for (var i:int; i < 200; i++) {
				obstacles.add(new Bird(i * 20, PlayState.random(46, FlxG.height)));
			}
			add(obstacles);
		}
		
		public function getObstacles():FlxGroup {
			return obstacles;
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