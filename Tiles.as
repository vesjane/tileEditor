package  {
	
	import flash.display.MovieClip;	
	import flash.events.Event;
	import flash.display.Sprite;
	
	
	public class Tiles extends MovieClip {
	
			private var _tileHeight:Number = 0;		
			private var W:Number = 48;		
			private var H:Number = 24;
			
			private var tileRibs:Sprite;		
			private var tileColor:uint = 0x666666;
		
		
			
		
		public function get tileHeight():Number
		{
			return _tileHeight
		}
		
		public function set tileHeight(value:Number):void
		{
			 _tileHeight = value;
			 redraw();
			 
		}
		
		public function Tiles() {
		
			this.width = 48;
			this.height = 24;
			tileRibs = new Sprite;
			this.addChild(tileRibs);
			redraw();

					
			
		}
		
		
		public function redraw():void
		{			
							
			this.y = this.y - tileHeight;
			if(tileHeight > 0 )
			{
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);
				
				//левое боковое ребро. Остановились в передней верхней левой точке
				tileRibs.graphics.moveTo(this.width/2,0);
				tileRibs.graphics.lineTo(this.width/2,tileHeight);			
				tileRibs.graphics.lineTo(0,tileHeight + H/2);
				tileRibs.graphics.lineTo(0,H/2);
				tileRibs.graphics.lineTo(this.width/2,0);
				tileRibs.graphics.endFill();
				
				
				//правое боковое  ребро.				
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);		
				tileRibs.graphics.moveTo(this.width,tileHeight + H/2);
				tileRibs.graphics.lineTo(this.width,H/2);	
				tileRibs.graphics.lineTo(this.width/2,H);
				tileRibs.graphics.lineTo(this.width/2,tileHeight + H);
				tileRibs.graphics.lineTo(this.width,tileHeight + H/2);
				tileRibs.graphics.endFill();
				
				// переднее ребро
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);		
				tileRibs.graphics.moveTo(this.width/2,(tileHeight + H));	
				tileRibs.graphics.lineTo(0,tileHeight + H/2);
				tileRibs.graphics.lineTo(0, H/2);
				tileRibs.graphics.lineTo(this.width/2,H);
				tileRibs.graphics.lineTo(this.width/2,(tileHeight + H));
				tileRibs.graphics.endFill();
				
				// заднее ребро
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);		
				tileRibs.graphics.moveTo(this.width/2,(tileHeight + H));	
				tileRibs.graphics.lineTo(0,tileHeight + H/2);
				tileRibs.graphics.lineTo(0, H/2);
				tileRibs.graphics.lineTo(this.width/2,H);
				tileRibs.graphics.lineTo(this.width/2,(tileHeight + H));
				tileRibs.graphics.endFill();
				
				// top
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);		
				tileRibs.graphics.moveTo(this.width/2,H);	
				tileRibs.graphics.lineTo(this.width,H/2);
				tileRibs.graphics.lineTo(this.width/2, 0);
				tileRibs.graphics.lineTo(0, H/2);
				tileRibs.graphics.lineTo(this.width/2,(H));
				tileRibs.graphics.endFill();
				
			} else if(tileHeight < 0 )
			{
				// задняя стенка
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);				
				tileRibs.graphics.moveTo(this.width,tileHeight + H/2);				
				tileRibs.graphics.lineTo(this.width/2,tileHeight);
				tileRibs.graphics.lineTo(this.width/2,0);
				tileRibs.graphics.lineTo(this.width,H/2);
				tileRibs.graphics.lineTo(this.width,tileHeight + H/2);
				tileRibs.graphics.endFill();
				
				//
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);
				tileRibs.graphics.moveTo(this.width/2,tileHeight + H);		
				tileRibs.graphics.lineTo(this.width/2,H);			
				tileRibs.graphics.lineTo(this.width,H/2);
				tileRibs.graphics.lineTo(this.width,tileHeight + H/2);
				tileRibs.graphics.lineTo(this.width/2,tileHeight + H);
				tileRibs.graphics.endFill();
				
				
				
				//боковая левая стенка
				
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);
				tileRibs.graphics.moveTo(0,tileHeight + H/2);
				tileRibs.graphics.lineTo(this.width/2,tileHeight );	
				tileRibs.graphics.lineTo(this.width/2,0);
				tileRibs.graphics.lineTo(0,H/2);
				tileRibs.graphics.lineTo(0,tileHeight + H/2);
				tileRibs.graphics.endFill();
				
				// передняя стенка
				
				tileRibs.graphics.beginFill(tileColor,1);
				tileRibs.graphics.lineStyle(1,0,1);
				tileRibs.graphics.moveTo(this.width/2,tileHeight + H);
				tileRibs.graphics.lineTo(0,tileHeight + H/2);	
				tileRibs.graphics.lineTo(0,H/2);
				tileRibs.graphics.lineTo(this.width/2,H);
				tileRibs.graphics.lineTo(this.width/2,tileHeight + H);
				tileRibs.graphics.endFill();
				
				
				
			}
			
			
			
			
			
			
		}
	}
	
}
