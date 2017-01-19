package;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
/**
 * ...
 * @author Sandro
 */
class Counter extends Sprite
{
	private var counter:Text;
	private var points:Int;

	public function new() 
	{
		super();
		counter = new Text("Counter: 0", 0, 50, Assets.width);
		counter.align = TextFormatAlign.CENTER;
		counter.size = 24;
		graphic = counter;
		layer = -2;
		points = 0;
	}
	
	public function add(num:Int) {
		points += num;
		counter.text = "Counter: " + points;
	}
	
}