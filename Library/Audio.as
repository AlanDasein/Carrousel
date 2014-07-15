package {
	
	import flash.media.*;
	
	public class Audio {
		
		public var buttonClick:Sound = new ButtonClick();
		public var levelOver:Sound = new LevelOver();
		public var tileClick:Sound = new TileClick();
		public var tileFound:Sound = new TileFound();
		public var imageChange:Sound = new ImageChange();
		public var levelCompleted:Sound = new LevelCompleted();
		public var levelIncomplete:Sound = new LevelIncomplete();
		
		public function Audio() {}
		
		public function PlaySound(_track:Sound) {_track.play();}
		
		public function StopSound() {SoundMixer.stopAll();}
		
	}
	
}