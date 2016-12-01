package edu.uoc.pac1
{
	import flash.display.MovieClip;

	public class Utils
	{
		public function Utils()
		{
		}
		
		public static function randomRange(minNum:Number,maxNum:Number):Number {
			return minNum + Math.floor( Math.random()*(maxNum-minNum+1) );
		}
		
	}
}