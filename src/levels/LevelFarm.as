package levels
{
	import sprites.*;
	
	/**
	 * Farm level
	 */
	public class LevelFarm extends Level
	{
		
		public function LevelFarm() 
		{
			[Embed(source = "../../assets/level_farm.png")] var BackgroundTiles:Class;
			super(Bird, 21);
			
			background.loadMap("0,1,2,0,1,2", BackgroundTiles, 512, 300, NaN, 0, 0);
		}

	}

}