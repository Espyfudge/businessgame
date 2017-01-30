package screens;

import openfl.Assets;
import openfl.Lib;

import openfl.display.Sprite;

import openfl.events.Event;

import openfl.display.Bitmap;
import openfl.display.BitmapData;

import openfl.events.KeyboardEvent;

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