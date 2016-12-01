package edu.uoc.pac1
{
	
	//PACKAGES
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.globalization.LastOperationStatus;
	
	public class Invader extends MovieClip
	{
		//VARIABLES PRIVADES
		var _invaderType:int;
		
		public function Invader(invaderType:int)
		{
			//PASEM ATRIBUTS DEL INVADER
			_invaderType = invaderType;
			
			// LISTENER
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		private function init(ev:Event):void {
			
			// ELIMINEM LISTENER
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// AFEGIM EVENTS DEL RATOLI
			addEventListener(MouseEvent.CLICK, invaderExplode);
			
			// DIBUIXAM INVADER
			drawInvader();
			
			//trace("testing, llegamos aquí?");
			
		}
		private function drawInvader():void {
			//INVADER TYPE
			gotoAndStop(1+_invaderType);
		}
		
		private function invaderExplode(ev:MouseEvent):void {
			//"ELIMINEM" INVADER
			gotoAndPlay("explode");
		}
	}
}