package sprites
{
	import org.flixel.FlxSprite;
	
	/**
	 * Plane
	 * @author Jannes Meyer
	 */
	public class Plane extends FlxSprite
	{
		
		public function Plane(x:int, y:int) 
		{
			[Embed(source = "../../assets/plane.png")] var Img:Class;
			super(x, y, Img);
		}
		
	}

}