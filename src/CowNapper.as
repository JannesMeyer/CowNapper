package  
{

	import org.flixel.*;
	[SWF(width="1008", height="600", backgroundColor="#000000")]
 
	/**
	 * CowNapper game
	 * @author Jannes, Jing, Christine
	 */
	public class CowNapper extends FlxGame
	{
		public function CowNapper()
		{	
			super(504, 300, MainMenuState, 2, 60, 60);
			forceDebugger = true;
		}
	}

}