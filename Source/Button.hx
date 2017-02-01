package;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

/**
 * A fairly crude button with state functionality and a callback for when clicked.
 *
 */
class Button extends Sprite 
{
	var upBitmapData:BitmapData;
	var overBitmapData:BitmapData;
	var downBitmapData:BitmapData;

	var mousePressed:Bool = false;

	var image:Bitmap;

	var callback:Void->Void;

	var snd:Sound;
	var channel:SoundChannel;

	public function new(callback:Void->Void )
	{
		super();
		
		upBitmapData = Assets.getBitmapData("UI/Button_Up.png");
		overBitmapData = Assets.getBitmapData("UI/Button_Over.png");
		downBitmapData =Assets.getBitmapData("UI/Button_Down.png");

		image = new Bitmap( upBitmapData );
		addChild( image );
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}

	function init( e:Event)
	{
		snd = Assets.getSound("Sounds/Blip_Select.mp3");

		removeEventListener( Event.ADDED_TO_STAGE, init );
		addEventListener( MouseEvent.CLICK, onClick );
		addEventListener( MouseEvent.MOUSE_OVER, onHover );
		addEventListener( MouseEvent.MOUSE_OUT, onOut );
		addEventListener( MouseEvent.MOUSE_DOWN, onDown );
		stage.addEventListener( MouseEvent.MOUSE_UP, onUp );
	}

	function onHover( e:MouseEvent ):Void
	{
		if( mousePressed )
			image.bitmapData = downBitmapData;
		else
			image.bitmapData = overBitmapData;
	}
	function onOut( e:MouseEvent ):Void
	{
		image.bitmapData = upBitmapData;	
	}
	function onDown( e:MouseEvent ):Void
	{
		image.bitmapData = downBitmapData;
		mousePressed = true;
	}
	function onUp( e:MouseEvent ):Void
	{
		image.bitmapData = upBitmapData;
		mousePressed = false;
	}

	function onClick( e:MouseEvent ):Void
	{
		if (Main.mute == false)
		{
			channel = snd.play( 0, 1,new SoundTransform( 1, 0 ));
			channel.addEventListener( Event.SOUND_COMPLETE, onSoundComplete );
		}
		callback();
	}

	function onSoundComplete( e:Event ):Void
	{
		channel = null;
	}
	
}
