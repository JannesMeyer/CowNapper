package sprites
{
	import org.flixel.FlxSprite;
	
	import states.PlayState;
	
	/**
	 * Cow
	 * @author Jannes Meyer
	 */
	public class Cow extends FlxSprite
	{
		
		public function Cow(x:int, y:int)
		{
			[Embed(source = "../../assets/cow.png")] var ImgCow:Class;
			super(x, y);
			
			loadGraphic(ImgCow, true, false, 26, 21);
			addAnimation("walk", [1, 2], 6);
			play("walk");
		}
		
		override public function update():void {
			// Bounding the cow
			if (y > PlayState.lowerWall - height) {
				velocity.y = 0;
				acceleration.y = 0;
				y = PlayState.lowerWall - height;
			} else if (y < PlayState.upperWall) {
				velocity.y = 0;
				acceleration.y = 0;
				y = PlayState.upperWall;
			}
			
			super.update();
		}
		
	}

}