package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MainMenuState extends FlxState 
	{
		
		private var level;
		private var title:FlxSprite;
		private var start:FlxText;
		//private var reveal:CenterSlideFX;
		//private var floodfill:FloodFillFX;
		
		public function MainMenuState() 
		{
			[Embed(source = '../assets/logo.png')] var ImgLogo:Class;
			[Embed(source = '../assets/nyan.mp3')] var TitleMusic:Class;
			
			//if (FlxG.getPlugin(FlxSpecialFX) == null)
			//{
			//	FlxG.addPlugin(new FlxSpecialFX);
			//}
			
			//reveal = FlxSpecialFX.centerSlide();
			//floodfill = FlxSpecialFX.floodFill();
			
			title = new FlxSprite(0, 0, ImgLogo);
			
			//title = floodfill.create(t, 0, 0, t.width, t.height, 0, 1);
			title.scrollFactor.x = 0;
			title.scrollFactor.y = 0;
			
			level = new LevelFarm();
			
			start = new FlxText(0, 226, 100, "- PRESS THE KEY TO START -");
			start.alignment = "center";
			start.shadow = 0xff000000;
			start.scrollFactor.x = 0;
			start.scrollFactor.y = 0;
			
			// Play music at full volume
			FlxG.playMusic(TitleMusic, 1);
			
			//floodfill.start();
			
			add(level);
			add(title);
			add(start);
		}
		
		override public function update():void {
			if (FlxG.keys.any()) {
				FlxG.fade(0xff000000, 2, changeState);
				//FlxG.music.fadeOut(2);
			}
			super.update();
		}
		
		private function changeState():void {
			FlxG.switchState(new PlayState);
		}
		
		override public function destroy():void {
			//FlxSpecialFX.clear();	
			super.destroy();
		}
		
	}

}