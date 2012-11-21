package sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * Ufo
	 * @author Jannes Meyer
	 */
	public class Ufo extends FlxSprite 
	{
		
		public function Ufo(x:int, y:int) 
		{
			[Embed(source = "../../assets/ufo.png")] var Img:Class;
			super(x, y);
			
			loadGraphic(Img, true, false, 87, 36);
			addAnimation("fly", [0, 1], 10);
			play("fly");
		}
		
	}

}