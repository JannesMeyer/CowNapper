package  
{
	import flash.geom.Point;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	/**
	 * Cow
	 * @author Jannes Meyer
	 */
	public class Cow extends FlxSprite
	{	
		public function Cow(x:int, y:int) {
			[Embed(source = "../assets/cow.png")] var ImgCow:Class;
			super(x, y);
			
			//loadGraphic(ImgCow, false, false, 28, 24);
			loadGraphic(ImgCow, true, true, 26, 21, true);
			addAnimation("walk", [1, 2], 6, true);
			//scrollFactor.x = 0;
			play("walk");
			//maxVelocity.y = 200;  // controling how the players behave
			//drag.y = maxVelocity.x * 4;
			if (FlxG.getPlugin(FlxControl) == null) {
			    FlxG.addPlugin(new FlxControl);
			}
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
		}
		
		public function checkEdges():Boolean {
			return y > 144 || y < 20;
		}
		
		override public function update():void {
			// Bounding the cow
			if (y > FlxG.height - height - 2) {
				velocity.y = 0;
				acceleration.y = 0;
				y = FlxG.height - height - 2;
			}
			if (y < 46) {
				velocity.y = 0;
				acceleration.y = 0;
				y = 46;
			}
			
			super.update();
		}
		
	}

}