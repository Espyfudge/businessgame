package screens;

import flash.system.System;


import openfl.Assets;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import utilities.*;

import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;


/**
 * ...
 * @author Lynette
 */
class MenuScreen extends Screen
{
	private var lastUpdate:Int;
	
	public var bmp1:Bitmap; //layer with clouds

	var sTransform:SoundTransform;
	var snd:Sound;
	
	var volume:Float = 0.2;
	
	public function new()
	{
		super();
	}

	override public function onLoad():Void
	{

		snd = Assets.getSound("Sounds/Blip_Select.mp3");
		theme = Assets.getSound("Sounds/Menu_Theme.mp3");
		
		sTransform = new SoundTransform( 1.0, 0 );

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
		
		var playButton:Button = new Button(onPlayClick); 
		playButton.x = 320;
		playButton.y = 640;
		playButton.scaleX = 2;
		playButton.scaleY = 2;
		addChild( playButton );
		
		var quitButton:Button = new Button(onQuitClick); 
		quitButton.x = 320;
		quitButton.y = 770;
		quitButton.scaleX = 2;
		quitButton.scaleY = 2;
		addChild( quitButton );
		
		var muteButton:Button = new Button(onMuteClick); 
		muteButton.x = 320;
		muteButton.y = 894;
		muteButton.scaleX = 2;
		muteButton.scaleY = 2;
		addChild( muteButton );
		
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

		channel = theme.play( 0, 100,new SoundTransform( volume, 0 ));
		
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
		if (Main.mute == false)
		{
			snd.play( 0, 1, sTransform );
		}
		channel.stop();
		Main.sm.changeScreen(ScreenType.Lev1);
	}
	
	private function onQuitClick()// run game when button is pressed
	{
		if (Main.mute == false)
		{
			snd.play( 0, 1, sTransform );
		}
		#if flash
		Lib.fscommand("quit");
		#end
	}

	
	private function onMuteClick()// run game when button is pressed
	{
	
		if (Main.mute == true)
		{
			Main.mute = false;
			snd.play( 0, 1, sTransform );
			channel = theme.play( 0, 100,new SoundTransform(volume, 0 ));
		}
		else {
			Main.mute = true;
			channel.stop();
		}
		
	}

	override public function onDestroy():Void
	{
		channel.stop();
		channel = null;
	}

}