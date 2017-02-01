package screens;

import openfl.Assets;
import openfl.Lib;

import openfl.display.Sprite;

import openfl.events.Event;

import openfl.display.Bitmap;
import openfl.display.BitmapData;

import openfl.events.KeyboardEvent;

import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;
/**
 * Simple screen in the application.
 * Shows a text, a button and a moving element.
 *
 */

class GameScreen extends Screen
{
	var player : Player;
	public var enemy : Array<Enemy> = [];
	var projectile : Projectile;
	var timer : Int = 0;

	var theme:Sound;
	public var channel:SoundChannel;
	var volume:Float = 0.15;
	
	public function new()
	{
		super();
	}

	override public function onLoad():Void
	{
		
		var backData : BitmapData = Assets.getBitmapData( "assets/tempbackground1.png" );
		var back : Bitmap = new Bitmap( backData );
		addChild( back );

		player = new Player(this);
		stage.addChild( player );

		player.setEnemyArray(enemy);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );

		stage.addEventListener(Event.ENTER_FRAME, spawnTime);
		
		if (Main.mute == false)
		{
			channel = theme.play( 0, 10000,new SoundTransform( volume, 0 ));
		}
		
		addEventListener( Event.ENTER_FRAME, update );
	}
	
	public function update(e:Event)
	{	
	}
	
	override public function onDestroy():Void
	{
		//removeChild(player);
		//stage.removeEventListener(KeyboardEvent.KEY_DOWN);
		//stage.removeEventListener(KeyboardEvent.KEY_UP);
		//stage.removeEventListener(Event.ENTER_FRAME);
	}

	function spawnTime( event : Event ) {
		timer++;

		if (timer == 100) {

			var enemySpawn = new Enemy( this, player, Std.random(2) == 0 ? 2000 : -100);
			enemy.push(enemySpawn);
			addChild(enemySpawn);

			timer = 0;
		}

	}

}