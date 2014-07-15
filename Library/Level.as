package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Level extends MovieClip {
		
		private var $mainOnLevel:Main;
		private var utilities:Utilities = new Utilities();
		private var section:uint;
		
		public function Level(_mainOnLevel:Main, _coordX:Number, _coordY:Number, _tag, _ind:uint) {
			
			$mainOnLevel = _mainOnLevel;
			this.section = _ind;
			
			this.x = _coordX;
			this.y = _coordY;
			
			if($mainOnLevel.score[_ind] >= 0) {
				
				this.utilities.formatting(this.label, _tag);
				
				this.button.addEventListener(MouseEvent.CLICK, onClickLevelButton, false, 0, true);
				this.button.addEventListener(MouseEvent.MOUSE_OVER, onOverLevelButton, false, 0, true);
				
				this.label.mouseEnabled = false;
				this.gotoAndPlay("unlock" + $mainOnLevel.score[_ind]);
				
			}
			
		}
		
		private function onClickLevelButton(evt:MouseEvent):void {
			$mainOnLevel.section = this.section;
			$mainOnLevel.LevelScreen();
		}
		
		private function onOverLevelButton(evt:MouseEvent):void {$mainOnLevel.audio.PlaySound($mainOnLevel.audio.levelOver);}
		
	}
	
}