package {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Carrousel {
		
		public var $mainOnCarrousel:Main;
		public var timer:Timer;
		public var currentImage:String;
		public var goahead:Boolean = true;
		public var found:uint = 0;
		
		private var utilities:Utilities = new Utilities();
		private var counter:uint = 0;
		private var limit:uint = 60;
		
		public function Carrousel(_mainOnCarrousel:Main) {
			
			$mainOnCarrousel = _mainOnCarrousel;
			
			this.timer = new Timer(1000);
			this.timer.addEventListener(TimerEvent.TIMER, PlayGame, false, 0, true);
			this.timer.start();
			
		}
		
		public function PlayGame(evt:TimerEvent):void {
			
			if(this.counter == this.limit) {this.StopGame();}
			else {
				this.counter++;
				this.utilities.formatting($mainOnCarrousel.clock.label, this.SetTime());
			}
			
		}
		
		public function StopGame():void {
			
			var hd:String;
			var shd:String;
			var col:uint;
			
			this.timer.stop();
			this.timer.removeEventListener(TimerEvent.TIMER, PlayGame);
			
			if(this.found == 9){
			
				if(this.counter < 31) {$mainOnCarrousel.score[$mainOnCarrousel.section] = 3;}
				else {$mainOnCarrousel.score[$mainOnCarrousel.section] = this.counter < 41 ? 2 : 1;}
				
				if(($mainOnCarrousel.section + 1) < 9) {
					if($mainOnCarrousel.score[$mainOnCarrousel.section + 1] < 0) {$mainOnCarrousel.score[$mainOnCarrousel.section + 1] = 0;}
				}
				
				hd = "LEVEL COMPLETED";
				col = 0x00CE43;
				
				$mainOnCarrousel.sharer.SetValues($mainOnCarrousel.score);
				
				$mainOnCarrousel.audio.PlaySound($mainOnCarrousel.audio.levelCompleted);
				
			}
			else{
				hd = "LEVEL INCOMPLETE";
				col = 0xFF0000;
				$mainOnCarrousel.audio.PlaySound($mainOnCarrousel.audio.levelIncomplete);
			}
			
			shd = "YOU FINISHED WITH A " + String($mainOnCarrousel.score[$mainOnCarrousel.section]) + " STAR" + ($mainOnCarrousel.score[$mainOnCarrousel.section] < 2 ? "" : "S") + " RECORD";
			
			$mainOnCarrousel.display.onoff(true, hd, shd, col);
			
		}
		
		private function SetTime():String {
			
			var minutes:Number = Math.floor(counter / 60);
			var seconds:Number = minutes > 0 ? counter - (minutes * 60) : counter;
			var aux:String = seconds < 10 ? "0" + seconds.toString() : seconds.toString();
			
			return "0" + minutes.toString() + ":" + aux;
			
		}
		
	}
	
}