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
	public var rollEnemy : Array<SecondEnemy> = [];
	var projectile : Projectile;

	var timer : Int = 0;
	var sTimer : Int = 0;

	var enemySpawn : Enemy;

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
		addChild( player );
		player.x = 350;
		player.y = 350;

		player.setEnemyArray(enemy);
		player.setSEnemyArray(rollEnemy);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );

		addEventListener(Event.ENTER_FRAME, spawnEnemy);
		addEventListener(Event.ENTER_FRAME, spawnRollEnemy );

	}

	function spawnEnemy( event : Event ) {

		timer++;

		if (timer == 200) {

			enemySpawn = new Enemy( this, player, Std.random(2) == 0 ? 2000 : -100);
			enemy.push(enemySpawn);
			addChild(enemySpawn);

			timer = 0;

		}

	}

	function spawnRollEnemy( event : Event ) {

		sTimer++;

		if (sTimer == 3000 ) {

			var rEnemySpawn = new SecondEnemy(this, player, Std.random(2) == 0 ? 2400 : -400);
			rollEnemy.push(rEnemySpawn);
			addChild(rEnemySpawn);

			sTimer = 0;

		}

	}

}