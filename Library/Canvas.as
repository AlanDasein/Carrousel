package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Canvas extends MovieClip {
		
		public var currentImage:String;
		
		public function Canvas() {
			
			this.x = 120;
			this.y = 67;
			
			this.addEventListener(Event.ENTER_FRAME, onChange, false, 0, true);
			
		}
		
		private function onChange(evt:Event):void {
			
			if(this.currentFrame == 5) {this.image.gotoAndStop("base");}
			if(this.currentFrame == 12) {this.image.gotoAndStop(this.currentImage);}

		}
		
	}
	
}