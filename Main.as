package edu.uoc.pac1
{
	
	//PACKAGES
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	//MAIN
	public class Main extends Sprite
	{
		// INSTANCIES TIMELINE ANIMATE CC BUILD
		public var logoUOC_sp:Sprite;
		public var addCercle_bt:SimpleButton;
		public var addInvader_bt:SimpleButton;
		public var gameZoneContainer_sp:Sprite;
		
		public function Main()
		{
			//LISTENER AL ROOT DEL STAGE
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(ev:Event):void {
			//REMOVEM LISTENER
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			trace ("Welcome! App initialised");
			
			// EVENTLISTENERS	
			// BOTO CLICK
			addCercle_bt.addEventListener(MouseEvent.CLICK,addCercle);
			addInvader_bt.addEventListener(MouseEvent.CLICK,addInvader);
			// WINDOWS RESIZE
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, refreshScreen);
			
			// REFRESC D'ELEMENTS
			refreshScreen();
		}
		
		private function addCercle(ev:MouseEvent):void {
			
			//COLOR AL ATZAR
			var color:uint = Math.random()*0xFFFFFF;
			
			//RADI AL ATZAR (entre 50 i 100)
			var radio:int = Utils.randomRange(50,100);
			
			//CREAM UNA INSTANCIA D'UN CERCLE
			var cercle:Cercle = new Cercle(radio,color);
			
			//VARIABLES DEL CERCLE
			var posMin:Number = radio;
			var posMax:Number = 400-radio;
			cercle.x =  Utils.randomRange(posMin,posMax); 
			cercle.y =  Utils.randomRange(posMin,posMax); 
			
			//AFEGIM CERCLE AL CONTENIDOR
			gameZoneContainer_sp.addChild(cercle);
			
			trace ("Added cercle!");	
			
		}
		
		private function addInvader(ev:MouseEvent):void {
			
			//CREAM INSTANCIA DEL INVADER
			var invaderType = Utils.randomRange(1,3);
			var invader:Invader = new Invader(invaderType);
			
			//MIDES INVADER
			var invaderW:int = 65;
			var invaderH:int = 40;
			
			//POSICIONAMENT INVADER
			var posMin = invaderW/2;
			var posMax = 400 - invaderW/2;
			invader.x =  Utils.randomRange(posMin,posMax);
			invader.y =  Utils.randomRange(posMin,posMax);
			
			//AFEGIM INVADER
			gameZoneContainer_sp.addChild(invader);
			
		}
		
		private function refreshScreen(ev:Event = null):void{
			
			//VARIABLES REFRESH SCREEN
			var stageW:int = stage.stageWidth;
			var stageH:int = stage.stageHeight;
			
			//DISTANCIA ENTRE ELEMENTS
			var gutter:int = 20;
			
			//LOGO
			logoUOC_sp.x = stageW - logoUOC_sp.width - gutter;
			logoUOC_sp.y = gutter;
			
			// BOTONS
			addCercle_bt.x = stageW/2 - addCercle_bt.width - gutter/2;
			addCercle_bt.y = stageH - addCercle_bt.height - gutter;
			
			addInvader_bt.x = stageW/2 + gutter/2;
			addInvader_bt.y = stageH - addInvader_bt.height - gutter;
			
			// CONTENIDOR
			gameZoneContainer_sp.x = gutter;
			gameZoneContainer_sp.y = logoUOC_sp.y + logoUOC_sp.height + gutter;
			gameZoneContainer_sp.width = stageW - 2*gutter;
			gameZoneContainer_sp.height = stageH - 2*gutter - addInvader_bt.height - 2*gutter - logoUOC_sp.height;
			
		}
		
	}
}