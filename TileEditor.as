package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.display.DisplayObject;
	import flash.net.URLLoader;
	import flash.net.FileReference;
	import flash.net.FileFilter;	
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.utils.ByteArray;
	import flash.text.TextField;
	
	
	public class TileEditor extends MovieClip {
		
		public static const TILE_WIDTH:Number = 48;
		public static const TILE_HEIGHT:Number = 24;
		
		
		private var _file:FileReference;	
		private var _map:Array;
		private var _tiles:MovieClip = new MovieClip();
		
		public var newTileMap:Array;
		public var test1:Array = [
									[150,150,150,150,150,150,150,150,150,150],
									[100,100,100,100,100,100,100,100,100,100],
									[50,50,50,50,50,50,50,50,50,50],
									[10,10,10,10,10,10,10,10,10,10],
									[0,0,0,0,0,0,0,0,0,0],
									[1,1,1,1,1,1,1,1,1,1],
									[-150,-150,150,150,150,150,150,-150,150,150],
									[100,100,-100,100,100,100,100,-100,100,100],
									[50,50,-50,50,50,50,50,50,-50,-50],
									[10,-10,-10,-10,-10,-10,-10,-10,10,-10]
									];
		
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
			data1.addEventListener(MouseEvent.CLICK,changeTileHeight);
			buildMap(tileMap);	
			
			
		}
		 
		private function selectHandler(event:Event):void
		{
			  _file = new FileReference();
			  var txtFileTypes:FileFilter = new FileFilter("Text (*.txt)", "*.txt");
			  
			  _file.browse([txtFileTypes]);
			  _file.addEventListener(Event.SELECT, selectFile);
			  _file.addEventListener(Event.COMPLETE, loadFile);
			
		}
		
		private function selectFile(e:Event):void
		{			
			_file.load();
		}
		
		
		
		private var loader:Loader;
		
		private function loadFile(e:Event):void
		{			
			_file.removeEventListener(Event.COMPLETE, loadFile);
			_file.removeEventListener(Event.SELECT, selectFile);
			
			var txtField:TextField = new TextField();
			var arr:Array = new Array();
			var counter:int = 0;
			
			txtField.text = _file.data.readMultiByte( _file.data.bytesAvailable, "utf-8" );						
			arr = txtField.text.split(" ");
			
			clearHeight();
			for(var i = 0; i < 10; ++i)
			{
				for(var k = 0; k < 10; ++k)
				{
					getTile(i,k).tileHeight = int(arr[counter]);
					counter++;
				}
				
			}		
					
		}
		
		public function getTile(i:int,j:int):Tiles
		{
			return _tiles.getChildByName(i+"-"+j)as Tiles;
		}
		
		

		public function clearHeight(e:Event = null):void
		{
			
			for(var i = 0; i < 10; ++i)
			{
				for(var k = 0; k < 10; ++k)
				{
					getTile(i,k).tileHeight = 0;					
				}
				
			}		
		}
		
		
		
		public function changeTileHeight(e:Event):void
		{
			clearHeight();			
			for(var i = 0; i < 10; ++i)
			{
				for(var k = 0; k < 10; ++k)
				{
					getTile(i,k).tileHeight = test1[i][k];					
				}
				
			}		
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
