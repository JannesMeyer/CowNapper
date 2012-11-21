package levels
{
	import org.flixel.*;
	import states.*;
	
	/**
	 * Interface that every Level has to implement
	 * @author Jannes Meyer
	 */
	public class Level extends FlxGroup
	{
		public var difficulty:Number;
		protected var background:FlxTilemap;
		private var obstacles:FlxGroup;
		private var ObstacleType:Class;
		
		
		public function Level(obstacleType:Class, difficulty:Number)
		{
			super();
			
			background = new FlxTilemap();
			background.scrollFactor = new FlxPoint(0.5, 0);
			
			obstacles = new FlxGroup();
			this.ObstacleType = obstacleType;
			
			this.difficulty = difficulty;
			
			add(background);
			add(obstacles);
		}
		
		// Public
		
		// Fill the initial screen with obstacles
		public function initObstacles():void {
			var spacing:int = FlxG.width / difficulty;
			
			for (var i:int = 0; i < difficulty; i++) {
				addObstacle(i * spacing);
			}
		}
		
		public function addObstacle(x:int):void {
			var y:int = PlayState.random(PlayState.upperWall, PlayState.lowerWall);
			
			obstacles.add(new ObstacleType(x, y));
		}
		
		public function getObstacles():FlxGroup {
			return obstacles;
		}
		
		public function getLength():int {
			return (background.width - FlxG.width) / background.scrollFactor.x;
		}
	}
	
}