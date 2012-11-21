package states
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	
	import levels.*;
	
	/**
	 * Attract screen
	 * @author Jannes Meyer
	 */
	public class MainMenuState extends FlxState 
	{	
		private var animation:Boolean;
		private var difficulty:Number = 20;
		private var progress:Number = 0;
		private var pulse:Number = 0;
		
		private var focus:FlxObject;
		private var level:Level;
		private var start:FlxText;
		
		public function MainMenuState(animation:Boolean = true) 
		{
			super();
			
			this.animation = animation;
		}
		
		override public function create():void {
			[Embed(source = '../../assets/music/title.mp3')] var MusicTitle:Class;
			[Embed(source = '../../assets/logo.png')] var ImgLogo:Class;
			
			// Camera focus
			focus = new FlxObject(FlxG.width / 2, FlxG.height / 2);
			FlxG.camera.follow(focus);

			// Logo effect
			if (FlxG.getPlugin(FlxSpecialFX) == null) {
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			// Load first level
			level = new PlayState.levelList[0]();
			level.initObstacles();
			
			// Press any key
			var start:FlxText = new FlxText(0, 240, 504, "> PRESS ANY KEY TO START <");
			start.alignment = "center";
			start.shadow = 0xff000000;
			start.size = 16;
			start.scrollFactor = new FlxPoint(0, 0);
			
			// Logo animation
			var logo:FlxSprite;
			if (animation) {
				var centerslide:CenterSlideFX = FlxSpecialFX.centerSlide();
				logo = centerslide.createFromClass(ImgLogo, 52, 20, 0, 3);
				centerslide.start();
			} else {
				logo = new FlxSprite(52, 20, ImgLogo);
			}
			logo.scrollFactor = new FlxPoint(0, 0);
			
			add(level);
			add(start);
			add(logo);
			
			FlxG.playMusic(MusicTitle, 1);
		}
		
		override public function update():void {
			focus.x += 0.5;
			progress += 0.5;
			pulse += 0.5;
			
			// Increase difficulty
			difficulty += FlxG.elapsed / 10;
			
			// Add enemies continuously
			var spacing:int = FlxG.width / difficulty;
			if (pulse > spacing) {
				level.addObstacle(progress + FlxG.width);
				pulse = 0;
			}
			
			// Start game on keypress
			if (FlxG.keys.any()) {
				FlxG.fade(0xff000000, 1.5, gotoGame);
				FlxG.music.fadeOut(1.5);
			}
			
			super.update();
		}
		
		override public function destroy():void {
			FlxSpecialFX.clear();	
			super.destroy();
		}
		
		// Public
		
		private function gotoGame():void {
			FlxG.switchState(new PlayState());
		}
		
	}

}