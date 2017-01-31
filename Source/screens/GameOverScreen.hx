package screens;

import flash.system.System;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;

/**
 * The base class for all screens.
 * The onLoad and onDestroy can be implemented in the derived classes.
 */

class GameOverScreen extends Screen
{
	override public function new()
	{
		super();
	}

	override public function onLoad():Void
	{
		var bmd0:BitmapData = Assets.getBitmapData("UI/GameOver.png"); //load and display background
		var bmp0:Bitmap = new Bitmap(bmd0);
		bmp0.x = 0;
		bmp0.y = 0;
		bmp0.scaleX = 2;
		bmp0.scaleY = 2;
		addChild(bmp0);
		
		var PlayButton:Button = new Button(onPlayClick); 
		PlayButton.x = 620;
		PlayButton.y = 785;
		PlayButton.scaleX = 2;
		PlayButton.scaleY = 2;
		addChild( PlayButton );
		
		var QuitButton:Button = new Button(onQuitClick); 
		QuitButton.x = 620;
		QuitButton.y = 925;
		QuitButton.scaleX = 2;
		QuitButton.scaleY = 2;
		addChild( QuitButton );
		
		var bmdPlay:BitmapData = Assets.getBitmapData("UI/Icon_Play.png"); //load and display background
		var iconPlay:Bitmap = new Bitmap(bmdPlay);
		iconPlay.x = 620;
		iconPlay.y = 785;
		iconPlay.scaleX = 2;
		iconPlay.scaleY = 2;
		addChild(iconPlay);
		
		var bmdQuit:BitmapData = Assets.getBitmapData("UI/Icon_Quit.png"); //load and display background
		var iconQuit:Bitmap = new Bitmap(bmdQuit);
		iconQuit.x = 620;
		iconQuit.y = 925;
		iconQuit.scaleX = 2;
		iconQuit.scaleY = 2;
		addChild(iconQuit);
	}
	
	private function onPlayClick()// run game when button is pressed
	{
		Main.sm.changeScreen(ScreenType.Menu);
	}
	
	private function onQuitClick()// run game when button is pressed
	{
		System.exit(0);
	}
	
	override public function onDestroy():Void
	{
	}
}