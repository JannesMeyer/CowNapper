package sprites
{
	import org.flixel.FlxSprite;
	
	/**
	 * Alien
	 * @author Jannes Meyer
	 */
	public class Alien extends FlxSprite 
	{
		
		public function Alien(x:int, y:int) 
		{
			[Embed(source = "../../assets/alien.png")] var Img:Class;
			super(x, y);
			
			loadGraphic(Img, true, false, 18, 20);
			addAnimation("fly", [0, 1], 7, true);
			play("fly");
		}
		
	}

}