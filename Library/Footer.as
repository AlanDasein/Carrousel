package {
	
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	
	public class Footer extends MovieClip {
		
		private var $mainOnFooter:Main;
		private var utilities:Utilities = new Utilities();
		
		public function Footer(_mainOnFooter:Main, _leftLabel:String, _rightLabel:String) {
			
			$mainOnFooter = _mainOnFooter;
			
			this.x = 0;
			this.y = 455;
			
			this.utilities.formatting(this.leftMenuLabel, _leftLabel);
			this.utilities.formatting(this.rightMenuLabel, _rightLabel);
			
			this.leftMenu.addEventListener(MouseEvent.CLICK, onClickLeftMenu);
			this.rightMenu.addEventListener(MouseEvent.CLICK, onClickRightMenu);
			
			this.leftMenuLabel.mouseEnabled = false;
			this.rightMenuLabel.mouseEnabled = false;
			
		}
		
		private function onClickLeftMenu(evt:MouseEvent):void {
			
			if($mainOnFooter.screen == "MENU"){flash.net.navigateToURL(new URLRequest("http://www.linkedin.com/in/alanlara/"), "_blank");}
			else{$mainOnFooter.LevelScreen();}
			
			$mainOnFooter.audio.PlaySound($mainOnFooter.audio.buttonClick);
			
		}
		
		private function onClickRightMenu(evt:MouseEvent):void {
			
			if($mainOnFooter.screen == "MENU"){$mainOnFooter.display.onoff(!$mainOnFooter.display.visible, "", "", 0);}
			else{$mainOnFooter.MenuScreen();}
			
			$mainOnFooter.audio.PlaySound($mainOnFooter.audio.buttonClick);
			
		}
		
	}
	
}