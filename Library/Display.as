package {
	
	import flash.display.MovieClip;
	import flash.filters.*;
	
	public class Display extends MovieClip {
		
		private var utilities:Utilities = new Utilities();
		
		public function Display(_frame:String) {
			this.x = 0;
			this.y = 54;
			this.visible = false;
			this.gotoAndStop(_frame);
		}
		
		public function onoff(_mode:Boolean, _header:String, _subheader:String, _color:uint) {
			
			var glow:GlowFilter = new GlowFilter(_color, 1, 5, 5, 5, BitmapFilterQuality.LOW, false, true);
			
			if(this.currentFrame == 1) {
				this.utilities.formatting(this.header, _header);
				this.utilities.formatting(this.subheader, _subheader);
				this.header.filters = [glow];
			}
			
			this.visible = _mode;
			
		}
		
	}
	
}