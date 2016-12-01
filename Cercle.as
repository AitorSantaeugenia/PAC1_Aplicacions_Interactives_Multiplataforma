package edu.uoc.pac1
{
	
	//PACKAGES
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	public class Cercle extends Sprite
	{
		//VARIABLES PRIVADES
		var _radio:int;
		var _color:uint;
		
		public function Cercle(radio:int,color:uint)
		{
			//PASEM ATRIBUTS DEL CERCLE
			_radio = radio;
			_color = color;
			
			// LISTENER
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		private function init(ev:Event):void {
			// REMOVEM LISTENER
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//AFEGIM EVENTS DEL RATOLI
			addEventListener(MouseEvent.CLICK, changeColor);
			
			//DIBUIXAM EL CERCLE AL DISPlAY
			drawShape();
			
		}
		private function drawShape():void {
			
			//DIBUIXAM SHAPEs
			var cercleShape:Shape = new Shape();
			cercleShape.graphics.beginFill(_color); // fill color _color
			cercleShape.graphics.drawCircle(0,0,_radio);
			
			//AFEGIM SHAPEs AL DISPLAY
			addChild(cercleShape);
		}
		private function changeColor(ev:MouseEvent):void {
			
			// CANVIEM COLOR
			var randomRed:int = Math.floor(Math.random()*256);
			var randomGreen:int = Math.floor(Math.random()*256);
			var randomBlue:int = Math.floor(Math.random()*256);
			transform.colorTransform = new ColorTransform(0,0,0,1,randomRed,randomGreen,randomBlue,1);
			
		}
	}
}