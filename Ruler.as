package  {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	
	public class Ruler extends MovieClip {
		
		
		public function Ruler() {
			
			redraw();
		}
		
		public function redraw():void
		{
			var count = 150;
			graphics.lineStyle(1);
			graphics.moveTo(0,-160);
			graphics.lineTo(0,160);
			
			while(count > -160)
			{
				graphics.moveTo(0,count);
				graphics.lineTo(-30,count);				
				var txt:TextField = new TextField();
				txt.text = count;
				txt.x = -30 - txt.textWidth;
				txt.y =count - txt.textHeight;
				addChild(txt);
				count = count - 30;
			}
		}
	}
	
}
