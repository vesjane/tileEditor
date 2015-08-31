package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.display.DisplayObject;
	import flash.net.URLLoader;
	import flash.net.FileReference;
	import flash.net.FileFilter;	
	import flash.events.MouseEvent;
	
	
	public class TileEditor extends MovieClip {
		
		public static const TILE_WIDTH:Number = 48;
		public static const TILE_HEIGHT:Number = 24;
		
		
		private var _file:FileReference;	
		private var _map:Array;
		private var _tiles:MovieClip = new MovieClip();
		
		public var newTileMap:Array;
		public var tileMap:Array = [
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1],
									[1,1,1,1,1,1,1,1,1,1]
									];
		
		
		public function TileEditor() {
			// constructor code
			if(stage){
				init();
				} else
				{
					addEventListener(Event.ADDED_TO_STAGE,init);
				}				
		}
		
		
		private function init(e:Event = null):void
		{
			loadData.addEventListener(MouseEvent.CLICK,selectHandler);
			buildMap(tileMap);	
			changeTileHeight();
			
		}
		 
		private function selectHandler(event:Event):void
		{
			  _file = new FileReference();
			  var txtFileTypes:FileFilter = new FileFilter("Text (*.txt)", "*.txt");
			  
			  _file.browse([txtFileTypes]);
			  _file.addEventListener(Event.SELECT, selectFile);
			
		}
		
		private function selectFile(e:Event):void
		{
			_file.addEventListener(Event.COMPLETE, loadFile);
			_file.load();
		}
		
		private function loadFile(e:Event):void
		{
			newTileMap = new Array();
			newTileMap[0] = new Array();
			_file.removeEventListener(Event.COMPLETE, loadFile);
			_file.removeEventListener(Event.SELECT, selectFile);
			
			while (_file.data.bytesAvailable > 0)
			{
				var i:int = 0;
				var j:int = 0;
				
				if(j == 9)
				{
					i++;
					j = 0;
					newTileMap[i] = new Array();
				}	
				newTileMap[i][j] = _file.data.readInt();				
				
				
			}
			for(var c = 0; c < _map[0].length; ++i){				
				for(var k = 0; k < _map.length; ++k)
				{
					(_map[i][j] as Tiles).tileHeight = newTileMap[c][k];				
					(_map[i][j] as Tiles).redraw();
				}
			}
			
			
		}
		
		

		
		
		public function changeTileHeight():void
		{
			/*var tileHeight:Number = -50;
			
			(_tiles.getChildByName("0-0") as Tiles).tileHeight = tileHeight;
			(_tiles.getChildByName("2-2") as Tiles).tileHeight = 20;
			(_tiles.getChildByName("5-1") as Tiles).tileHeight = -tileHeight;
			(_tiles.getChildByName("9-9") as Tiles).tileHeight = 100 -tileHeight;
			(_tiles.getChildByName("9-1") as Tiles).tileHeight = -20;
			(_tiles.getChildByName("8-1") as Tiles).tileHeight = -30;*/
			
		}
		

		public function buildMap(array:Array):void{
			
			if(getChildByName("tileHolder")!= null)
			{
				removeChild(getChildByName("tileHolder"));
			}			
			_tiles.name = "tileHolder";
			_map = new Array();
			
			for(var i = 0; i < array[0].length; ++i){
				_map[i] = new Array();
				for(var k = 0; k < array.length; ++k)
				{
					
					_map[i][k] = new Tiles();					
					_tiles.addChild(_map[i][k]);
								
					_map[i][k].x = (k-i)*TILE_WIDTH/2;
					_map[i][k].y = (i+k)*TILE_HEIGHT/2;				
					_map[i][k].name = i + "-" + k;
					
				}
			}
			
			addChild(_tiles);
			_tiles.x = (stage.stageWidth - TILE_WIDTH)/2;
			_tiles.y = (stage.stageHeight - _tiles.height)/2
			
		}
	}
	
}
