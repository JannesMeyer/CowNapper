package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ufo extends FlxSprite 
	{
		public function Ufo(x:int, y:int) 
		{
			[Embed(source = "../assets/ufo.png")] var ImgUfo:Class;
			super(x, y);
			
			//scrollFactor.x = 0;
			//scrollFactor.y = 0;
			
			//loadGraphic(ImgCow, false, false, 28, 24);
			loadGraphic(ImgUfo, true, true, 87, 36, true);
			addAnimation("walk", [0, 1], 10, true);
			play("walk");
		}
		
	}

}