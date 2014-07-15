package {
	
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	
	public class Preloader extends Sprite {
		
		private var loadInfo:LoaderInfo;
		private var loadPercent:Number = 0;
		private var utilities:Utilities = new Utilities();
		
		public function Preloader() {this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);}
		
		private function init(evt:Event):void {
			this.loadInfo = stage.loaderInfo;
			this.removeEventListener(Event.ADDED_TO_STAGE , init);
			this.addEventListener(Event.ENTER_FRAME, onCheckLoaded, false, 0, true);
		}
		
		private function onCheckLoaded(evt:Event):void {
			
			this.loadPercent = this.loadInfo.bytesLoaded / this.loadInfo.bytesTotal * 100;
			
			this.utilities.formatting(output, String(this.loadPercent) + " %");
			
			if(this.loadPercent == 100) {
				this.removeEventListener(Event.ENTER_FRAME, onCheckLoaded);
				this.dispatchEvent(new Event(Event.COMPLETE));
			}
			
		}
		
	}
	
}