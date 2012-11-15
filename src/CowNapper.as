package  
{

	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="1008", height="600", backgroundColor="#000000")] //Set the size and color of the Flash file
 
		/**
	 * ...
	 * @author ...
	 */
	public class CowNapper extends FlxGame
	{
		public function CowNapper()
		{
			super(336, 200, PlayState, 3); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
		}
	}

}