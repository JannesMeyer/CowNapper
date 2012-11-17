package  
{

	import org.flixel.*;
	[SWF(width="1008", height="640", backgroundColor="#FFFFFF")]
 
	/**
	 * CowNapper game
	 * @author Jannes Meyer
	 */
	public class CowNapper extends FlxGame
	{
		public function CowNapper()
		{	
			super(336, 240, PlayState, 2, 60, 60);
			forceDebugger = true;
			FlxG.bgColor = 0xff783629;
		}
	}

}