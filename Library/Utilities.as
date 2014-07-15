package {
	
	import flash.text.*;
	
	public class Utilities {
		
		private var format:TextFormat;
		
		public function Utilities() {}
		
		public function formatting(_field:TextField, _text:String):void {
			this.format = _field.getTextFormat(0, 1);
			_field.text = _text;
			_field.setTextFormat(this.format);
		}
		
	}
	
}