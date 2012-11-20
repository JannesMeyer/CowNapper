package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bird extends FlxSprite 
	{
		
		public function Bird(x:int, y:int) 
		{
			[Embed(source = "../assets/bird.png")] var Img:Class;
			super(x, y);
			
			loadGraphic(Img, true, true, 28, 24, true);
			addAnimation("fly", [0, 1], 7, true);
			play("fly");
		}
		
	}

}