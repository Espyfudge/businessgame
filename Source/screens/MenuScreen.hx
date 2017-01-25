package screens;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import utilities.*; //everything from the folder


/**
 * ...
 * @author Lynette
 */
class MenuScreen extends Screen
{

	public function new() 
	{
		super();
	}
	
	override public function onLoad():Void
	{
		var bmd:BitmapData = Assets.getBitmapData("UI/background-menu.png"); //load and display background
		var bmp:Bitmap = new Bitmap(bmd);
		bmp.x = 0;
		bmp.y = 0;
		bmp.scaleX = 2;
		bmp.scaleY = 2;
		addChild(bmp);
	}
}