package {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Tile extends MovieClip {
		
		public var $mainOnTile:Main;
		
		private var utilities:Utilities = new Utilities();
		
		public function Tile(_mainOnTile:Main, _coordX:Number, _coordY:Number, _tag) {
			
			$mainOnTile = _mainOnTile;
			
			this.x = _coordX;
			this.y = _coordY;
			
			this.utilities.formatting(this.button.label, _tag);
			
			this.addEventListener(Event.ENTER_FRAME, onRotate, false, 0, true);
			this.button.addEventListener(MouseEvent.CLICK, onClickTile, false, 0, true);
			
		}
		
		private function onRotate(evt:Event):void {
			
			var change:Boolean = false;
			
			if(this.currentFrame == 9 || this.currentFrame == 30) {this.button.gotoAndStop(this.currentFrame == 9 ? "show" : "hide");}
			
			if(this.currentFrame == 13) { //after showing the tile
				
				if($mainOnTile.canvas.currentImage == this.button.label.text) {
				
					$mainOnTile.carrousel.found++;
					
					if($mainOnTile.carrousel.found == 9) {$mainOnTile.carrousel.StopGame();}
					else{
					
						for(var i:uint = 0;i < $mainOnTile.images.length;i++) {
						
							if($mainOnTile.images[i] == $mainOnTile.canvas.currentImage) {
								$mainOnTile.images[i] = "";
								break;
							} 
							
						}
						
						$mainOnTile.audio.PlaySound($mainOnTile.audio.tileFound);
						
						$mainOnTile.carrousel.goahead = true;
						change = true;
						
					}
					
					this.button.gotoAndStop("found");
					this.gotoAndPlay("init");
					
				}
				
			}
			
			if(this.currentFrame == 25) { //after showing the tile a little bit
				this.gotoAndPlay("hide");
				$mainOnTile.carrousel.goahead = true;
				change = true;
			}
			
			if(this.currentFrame == 37 && $mainOnTile.carrousel != null) {$mainOnTile.carrousel.goahead = true;} //after hiding the tile
			
			if(change) {
				$mainOnTile.carrousel.currentImage = $mainOnTile.canvas.currentImage;
				while($mainOnTile.canvas.currentImage == $mainOnTile.carrousel.currentImage || $mainOnTile.canvas.currentImage == "") {
					$mainOnTile.canvas.currentImage = $mainOnTile.images[int(Math.random() * 9)];
				}
				$mainOnTile.canvas.gotoAndPlay("change");
				$mainOnTile.audio.PlaySound($mainOnTile.audio.imageChange);
			}
			
		}
		
		private function onClickTile(evt:MouseEvent):void {
			
			if($mainOnTile.carrousel.goahead && this.button.currentFrame == 1) {
				$mainOnTile.carrousel.goahead = false;
				this.gotoAndPlay("show");
				$mainOnTile.audio.PlaySound($mainOnTile.audio.tileClick);
			}
			
		}
		
	}
	
}