package screens;

import flash.system.System;

import openfl.Assets;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import utilities.*;


/**
 * ...
 * @author Lynette
 */
class MenuScreen extends Screen
{
	private var lastUpdate:Int;
	
	public var bmp1:Bitmap; //layer with clouds

	public function new()
	{
		super();
	}

	override public function onLoad():Void
	{
		var bmd0:BitmapData = Assets.getBitmapData("UI/MenuScreen_0.png"); //load and display background
		var bmp0:Bitmap = new Bitmap(bmd0);
		bmp0.x = 0;
		bmp0.y = 0;
		bmp0.scaleX = 2;
		bmp0.scaleY = 2;
		addChild(bmp0);

		var bmd1:BitmapData = Assets.getBitmapData("UI/MenuScreen_1.png"); //load and display background
		bmp1 = new Bitmap(bmd1);
		bmp1.x = 0;
		bmp1.y = 0;
		bmp1.scaleX = 2;
		bmp1.scaleY = 2;
		addChild(bmp1);

		var bmd2:BitmapData = Assets.getBitmapData("UI/MenuScreen_2.png"); //load and display background
		var bmp2:Bitmap = new Bitmap(bmd2);
		bmp2.x = 0;
		bmp2.y = 0;
		bmp2.scaleX = 2;
		bmp2.scaleY = 2;
		addChild(bmp2);
		
		var PlayButton:Button = new Button(onPlayClick); 
		PlayButton.x = 320;
		PlayButton.y = 640;
		PlayButton.scaleX = 2;
		PlayButton.scaleY = 2;
		addChild( PlayButton );
		
		var QuitButton:Button = new Button(onQuitClick); 
		QuitButton.x = 320;
		QuitButton.y = 770;
		QuitButton.scaleX = 2;
		QuitButton.scaleY = 2;
		addChild( QuitButton );
		
		var MuteButton:Button = new Button(onMuteClick); 
		MuteButton.x = 320;
		MuteButton.y = 894;
		MuteButton.scaleX = 2;
		MuteButton.scaleY = 2;
		addChild( MuteButton );
		
		var bmdPlay:BitmapData = Assets.getBitmapData("UI/Icon_Play.png"); //load and display background
		var iconPlay:Bitmap = new Bitmap(bmdPlay);
		iconPlay.x = 320;
		iconPlay.y = 640;
		iconPlay.scaleX = 2;
		iconPlay.scaleY = 2;
		addChild(iconPlay);
		
		var bmdQuit:BitmapData = Assets.getBitmapData("UI/Icon_Quit.png"); //load and display background
		var iconQuit:Bitmap = new Bitmap(bmdQuit);
		iconQuit.x = 320;
		iconQuit.y = 770;
		iconQuit.scaleX = 2;
		iconQuit.scaleY = 2;
		addChild(iconQuit);
		
		var bmdMute:BitmapData = Assets.getBitmapData("UI/Icon_Mute.png"); //load and display background
		var iconMute:Bitmap = new Bitmap(bmdMute);
		iconMute.x = 320;
		iconMute.y = 894;
		iconMute.scaleX = 2;
		iconMute.scaleY = 2;
		addChild(iconMute);
		
		lastUpdate = Lib.getTimer();
		addEventListener( Event.ENTER_FRAME, update );
	}

	public function update(e:Event)
	{
		var now:Int = Lib.getTimer();
		var secondsPassed:Float = (now-lastUpdate) / 1000;
		lastUpdate = now;
		
		if (bmp1.x <= -1920)
		{
			bmp1.x = 600;
		}
		else 
		{
			bmp1.x -= 10 * secondsPassed;
		}
	}
	
	private function onPlayClick()// run game when button is pressed
	{
		Main.sm.changeScreen(ScreenType.Game);
	}
	
	private function onQuitClick()// run game when button is pressed
	{
		System.exit(0);
	}

	
	private function onMuteClick()// run game when button is pressed
	{
		//Main.instance.loadScreen( ScreenType.Game );
		if (Main.mute == true)
		{
			Main.mute = false;
		}
		else {
			Main.mute = true;
		}
		trace(Main.mute);
	}
}