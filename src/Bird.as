package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * Bird
	 */
	public class Bird extends FlxSprite 
	{
		
		public function Bird(x:int, y:int) 
		{
			[Embed(source = "../assets/bird.png")] var Img:Class;
			super(x, y);
			
			loadGraphic(Img, true, false, 28, 24);
			addAnimation("fly", [0, 1], 7, true);
			play("fly");
		}
		
	}

}