package levels
{	
	import sprites.*;
	
	/**
	 * Mars level
	 */
	public class LevelMars extends Level
	{
		
		public function LevelMars() 
		{
			[Embed(source = "../../assets/level_mars.png")] var BackgroundTiles:Class;
			super(Alien, 25);
			
			background.loadMap("0,0", BackgroundTiles, 1500, 300, NaN, 0, 0);
		}

	}

}