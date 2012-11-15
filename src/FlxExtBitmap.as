package
{
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	/**
	 * @author jaywalker
	 */
	dynamic public class FlxExtBitmap
	{
		private var _path:String;
		private var _onLoadComplete:Function;
		private var _bitmap:Bitmap;
		public function FlxExtBitmap(path:String, onLoadComplete:Function):void
		{
			_path = path;
			_onLoadComplete = onLoadComplete;
		}
		
		public function load():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onBitmapLoadComplete);
			loader.load(new URLRequest(_path));
		}
		
		public function get path():String
		{
			return _path;
		}
		
		public function get bitmap():Bitmap
		{
			return _bitmap;
		}
		
		private function _onBitmapLoadComplete(event:Event):void
		{
			_bitmap = Bitmap(LoaderInfo(event.target).content);
			_onLoadComplete(this);
		}
	}
}