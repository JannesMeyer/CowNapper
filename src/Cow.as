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
		public function Cow() {
			[Embed(source = "../assets/player.png")] var ImgCow:Class;
			super(20, 100);
			
			//loadGraphic(ImgCow, false, false, 28, 24);
			loadGraphic(ImgCow, true, true, 16, 18, true);
			addAnimation("walk", [0, 1, 0, 2], 10, true);
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
			if (checkEdges()) {
				velocity.x *= -1;
				velocity.y *= -1;
			}
			
			super.update();
		}
		
	}

}