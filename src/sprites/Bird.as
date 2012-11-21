package sprites
{
	import org.flixel.FlxSprite;
	
	/**
	 * Bird
	 * @author Jannes Meyer
	 */
	public class Bird extends FlxSprite
	{
		
		public function Bird(x:int, y:int) 
		{
			[Embed(source = "../../assets/bird.png")] var Img:Class;
			super(x, y);
			
			loadGraphic(Img, true, false, 28, 24);
			addAnimation("fly", [0, 1], 7);
			play("fly");
		}
		
	}

}