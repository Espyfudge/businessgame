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
	
	var heartFullBMD:BitmapData;
	var heartHalfBMD:BitmapData;
	var heartEmptyBMD:BitmapData;
	public var heart01:Bitmap;
	public var heart02:Bitmap;
	public var heart03:Bitmap;
	public var heart04:Bitmap;
	public var heart05:Bitmap;
	
	public function new()
	{
		super();
	}

	override public function onLoad():Void
	{
		theme = Assets.getSound("Sounds/Game_Theme.mp3");
		heartFullBMD = Assets.getBitmapData("UI/HPfill.png"); //load and display background
		heartHalfBMD = Assets.getBitmapData("UI/HPhalf.png"); 
		heartEmptyBMD = Assets.getBitmapData("UI/HPempty.png");
		
		heart01 = new Bitmap(heartFullBMD);
		heart01.x = 100;
		heart01.y = 50;
		heart01.scaleX = 2;
		heart01.scaleY = 2;
		
		heart02 = new Bitmap(heartFullBMD);
		heart02.x = 170;
		heart02.y = 50;
		heart02.scaleX = 2;
		heart02.scaleY = 2;
		
		heart03 = new Bitmap(heartFullBMD);
		heart03.x = 240;
		heart03.y = 50;
		heart03.scaleX = 2;
		heart03.scaleY = 2;
		
		heart04 = new Bitmap(heartFullBMD);
		heart04.x = 310;
		heart04.y = 50;
		heart04.scaleX = 2;
		heart04.scaleY = 2;
		
		heart05 = new Bitmap(heartFullBMD);
		heart05.x = 380;
		heart05.y = 50;
		heart05.scaleX = 2;
		heart05.scaleY = 2;
		
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
		
		addChild(heart01);
		addChild(heart02);
		addChild(heart03);
		addChild(heart04);
		addChild(heart05);
		
		addEventListener( Event.ENTER_FRAME, update );
	}
	
	public function update(e:Event)
	{
		switch (player.getHealth())
		{
			case 90:
				//90 hp
				heart05.bitmapData = heartHalfBMD;
			case 80:
				//80hp;
				heart05.bitmapData = heartEmptyBMD;
			case 70:
				//70 hp
				heart04.bitmapData = heartHalfBMD;
			case 60:
				//60hp;
				heart04.bitmapData = heartEmptyBMD;
			case 50:
				//50 hp
				heart03.bitmapData = heartHalfBMD;
			case 40:
				//40hp;
				heart03.bitmapData = heartEmptyBMD;
			case 30:
				//30 hp
				heart02.bitmapData = heartHalfBMD;
			case 20:
				//20hp;
				heart02.bitmapData = heartEmptyBMD;
			case 10:
				//10 hp
				heart01.bitmapData = heartHalfBMD;
			case 0:
				//0 hp
				heart01.bitmapData = heartEmptyBMD;
		}
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