package  
{

	import org.flixel.*;
	[SWF(width="1008", height="600", backgroundColor="#FFFFFF")]
 
	/**
	 * CowNapper game
	 * @author Jannes Meyer
	 */
	public class CowNapper extends FlxGame
	{
		public function CowNapper()
		{	
			super(504, 300, PlayState, 2, 60, 60);
			forceDebugger = true;
			FlxG.bgColor = 0xff783629;
		}
	}

}