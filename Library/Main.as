package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Main extends MovieClip {
		
		private const TAG:Array = new Array("places", "animals", "people", "brands", "plants", "flags", "music", "sports", "painting");
		private const ITEMS:Array = new Array(["Arc de Triomphe", "Big Ben", "Brandenburg Gate", "Cave of Altamira", "Chichen Itza", "Chinese Wall", "Corcovado", "Easter Is. Statues", "Eiffel Tower", "Forbidden City", "Golden Gate", "Grand Canyon", "Great Sphinx", "Hagia Sophia", "Imperial Palace", "Leaning Tower", "Little Mermaid", "London Bridge", "Machu Picchu", "Manhattan", "Mecca", "Memorial Park", "Mount Rushmore", "Notre Dame", "Opera House", "Parthenon", "Roman Coliseum", "Sagrada Familia", "St Basil", "Statue of Liberty", "Stonehenge", "Taj Mahal", "Vatican"],["Baboon", "Bat", "Beetle", "Bengal Tiger", "Brown Bear", "Buffalo", "Cebra", "Cheetah", "Cobra", "Crocodrile", "Elephant", "Elk", "Falcon", "Flamingo", "Giraffe", "Gorilla", "Hamster", "Kangaroo", "Lemur", "Octopus", "Owl", "Panda", "Pinguin", "Raccoon", "Raven", "Sea Lion", "Seahorse", "Shamu", "Squirrel", "Swan", "Turtle", "White Shark", "Wolf"],["Beethoven", "Bertrand Russell", "Bill Gates", "Bob Marley", "Charlie Chaplin", "Churchill", "Clint Eastwood", "Copernicus", "E.A.Poe", "Einstein", "Elvis Presley", "Franklin", "Frida Kahlo", "Gandhi", "Hemingway", "Humphrey Bogart", "Jim Morrison", "Lennon and Yoko", "Lincoln", "M.L.King", "Marilyn Monroe", "Mark Twain", "Michael Jackson", "Muhammad Ali", "Naomi Campbell", "Nietzsche", "Nina Simone", "Oscar Wilde", "Pele", "Sigmund Freud", "Sophia Loren", "Virginia Woolf", "Woody Allen"],["AT&T", "Aol", "Apple", "Bacardi", "Bentley", "Camel", "Castrol", "Chrysler", "Converse", "Direct TV", "Domino's Pizza", "Electronic Arts", "Facebook", "Fila", "Gucci", "Hewlett Packard", "Johny walker", "KFC", "LG", "Lacoste", "Mazda", "McDonalds", "Nestle", "Pepsi", "Peugeot", "Puma", "Red Bull", "Starbucks", "Taco Bell", "Texaco", "Twitter", "Volkswagen", "Warner Bros"],["Acacia", "Algae", "Bamboo", "Baobab", "Cactus", "Cannabis", "Carnation", "Cedar", "Clover", "Coconut Palm", "Cypress", "Daisy", "Dragon Blood Tree", "Fern", "Ficus", "Fir", "Geranium", "Ivy Tree", "Jasmine", "Lilium", "Maple Tree", "Mushroom", "Oak", "Orchid", "Pine Tree", "Poppy", "Rose", "Sequoia", "Sunflower", "Tulipan", "Viola", "Water Lily", "Willow"],["Algeria", "Angola", "Argentina", "Bahamas", "Barbados", "Belarus", "Brazil", "Cambodia", "Canada", "Chile", "China", "Croatia", "Cuba", "Cyprus", "Denmark", "Finland", "France", "Greece", "India", "Israel", "Jamaica", "Korea", "Lebanon", "Macedonia", "Malasya", "Mexico", "Panama", "Portugal", "Scotland", "Singapore", "Sweden", "Taiwan", "Turkey"],["Accordion", "Bagpipes", "Balalaika", "Beatles", "Bemolle", "Bluegrass", "Cello", "Chemical Brothers", "Clef", "Depeche Mode", "Drum", "Enigma", "Flamenco", "Flute", "Guitar", "Harp", "Irish Dance", "Janis Joplin", "Led Zeppelin", "Maraca", "Nirvana", "Piano", "Pink Floyd", "Radiohead", "Rolling Stones", "Samba", "Saxophone", "Sirtaki", "Tambourine", "Tango", "Tremolo", "Vals", "Violin"],["Archery", "Athletics", "Badminton", "Baseball", "Basketball", "Boxing", "Capoeira", "Chess", "Cricket", "Cycling", "Equestrianism", "Figure Skating", "Football", "Formula One", "Golf", "Gymnastics", "Handball", "Jockey", "Judo", "Motocross", "Pingpong", "Rafting", "Rugby", "Shooting", "Soccer", "Sumo", "Surfing", "Swimming", "Taekwondo", "Tennis", "Volleyball", "Water Polo", "Wrestling"],["Botticelli", "Bruegel", "Cezanne", "Chagall", "Chirico", "Da Vinci", "Dali", "David", "Delacroix", "Duchamp", "Gauguin", "Goya", "Greco", "Klee", "Klimt", "Kooning", "Matisse", "Michelangelo", "Mondrian", "Monet", "Munch", "Picasso", "Pollock", "Rafael", "Rembrandt", "Rivera", "Rubens", "Toulouse Lautrec", "Van Gogh", "Velazquez", "Vermeer", "Warhold", "Wood"]);
		
		public var section:uint;
		public var screen:String;
		public var images:Array = new Array(9);
		public var score:Array = new Array(9);
		public var sharer:Sharer = new Sharer();
		public var audio:Audio;
		public var display:Display;
		public var clock:Clock;
		public var canvas:Canvas;
		public var carrousel:Carrousel;
		
		private var logo:Logo;
		private var footer:Footer;
		private var level:Array = new Array(9);
		private var tile:Array = new Array(9);
		
		public function Main() {preloader.addEventListener(Event.COMPLETE , init);}
		
		private function init(evt:Event):void {
			preloader.removeEventListener(Event.COMPLETE , init);
			this.gotoAndStop(3)
			this.score = this.sharer.GetValues() == null ? [0,-1,-1,-1,-1,-1,-1,-1,-1] : this.sharer.GetValues().split(",");
			this.MenuScreen();
		}
		
		private function reset():void {
			
			for(var i:uint = 0;i < 9;i++) {
				this.level[i] = null;
				this.tile[i] = null;
				this.images[i] = "";
			}
			
			if(this.carrousel) {this.carrousel.StopGame();}
			if(this.audio) {this.audio.StopSound();}
			
			this.carrousel = null;
			this.logo = null;
			this.footer = null;
			this.clock = null;
			this.canvas = null;
			this.display = null;
			this.audio = null;
			
			while(this.numChildren > 0){this.removeChildAt(0);}
			
		}
		
		private function multidraw(_xStartPos:Number, _yStartPos:Number, _xIncPos:Number, _yIncPos:Number):void {
			
			var xPos = _xStartPos;
			var yPos = _yStartPos;
			
			this.logo = new Logo();
			this.audio = new Audio();
			
			this.addChild(this.logo);
			this.addChild(this.footer);
			
			for(var i:uint = 0;i < 9;i++) {
				
				xPos = i % 3 == 0 ? _xStartPos : xPos + _xIncPos;
				yPos = i == 3 || i == 6 ? yPos + _yIncPos : yPos;				
				
				if(screen == "MENU") {
					this.level[i] = new Level(this, xPos, yPos, TAG[i].toUpperCase(), i);
					this.addChild(this.level[i]);
				}
				else {
					this.tile[i] = new Tile(this, xPos, yPos, this.images[i]);
					this.addChild(this.tile[i]);
				}

			}
			
			this.addChild(this.display);
			
		}
		
		private function members():Array {
			
			var elements:Array = ITEMS[this.section];
			var rand:uint;
			var aux:String;
			
			for(var i:uint = 0;i < elements.length;i++) {
				rand = int(Math.random() * 9);
				aux = elements[i];
				elements[i] = elements[rand]; 
				elements[rand] = aux;
			}
			
			return elements.slice(0, 9);
			
		}
		
		public function MenuScreen():void {
			
			this.reset();
			
			this.screen = "MENU";
			
			this.footer = new Footer(this, "CONTACT", "HELP");
			this.display = new Display("help");
			
			this.multidraw(64, 74, 150, 125);
			
		}
		
		public function LevelScreen():void {
			
			this.reset();
			
			this.screen = "LEVEL";
			
			this.clock = new Clock();
			this.canvas = new Canvas();
			this.footer = new Footer(this, "RESTART", "MENU");
			this.display = new Display("result");
			
			this.addChild(this.clock);
			this.addChild(this.canvas);
			
			this.images = this.members();
			
			this.carrousel = new Carrousel(this);
			
			this.multidraw(12.75, 312.45, 160.25, 42.85);
			
			this.canvas.currentImage = this.images[int(Math.random() * 9)];
			this.canvas.gotoAndPlay("change");
			
			this.audio.PlaySound(audio.imageChange);
			
		}
		
	}
	
}