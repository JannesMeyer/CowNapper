package levels
{
	import sprites.*;
	
	/**
	 * Farm level
	 */
	public class LevelCity extends Level
	{
		
		public function LevelCity() 
		{
			[Embed(source = "../../assets/level_city.png")] var BackgroundTiles:Class;
			super(Plane, 10);
			
			background.loadMap("0,0", BackgroundTiles, 1500, 300, NaN, 0, 0);
		}

	}

}