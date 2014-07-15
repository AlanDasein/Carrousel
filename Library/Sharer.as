package {
	
	import flash.net.SharedObject;
	
	public class Sharer {
		
		public var sharedObject:SharedObject;
		
		public function Sharer() {this.sharedObject = SharedObject.getLocal("carrouselChallenge");}
		
		public function GetValues():String {return this.sharedObject.data.values;}
		
		public function SetValues(_values:Array):void {
			
			try {
				this.sharedObject.data.values = _values.join(",");
				this.sharedObject.flush();
			}
			catch(sharedObjectError:Error) {trace("Caught this error:", sharedObjectError.name, sharedObjectError.message);}
			
		}
		
	}
	
}