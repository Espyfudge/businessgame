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

class Level1 extends Screen
{
	
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

		theme = Assets.getSound("Sounds/Game_Theme.mp3");
		
		player = new Player(this);
		addChild( player );
		player.x = 350;
		player.y = 350;

		player.setEnemyArray(enemy);
		player.setSEnemyArray(rollEnemy);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );

		addEventListener(Event.ENTER_FRAME, spawnEnemy);

		if (Main.mute == false)
		{
			channel = theme.play( 0, 10000,new SoundTransform( volume, 0 ));
		}
		

		displayHearts();

		addEventListener( Event.ENTER_FRAME, update );

	}

	function displayHearts()
	{

		heartFullBMD = Assets.getBitmapData("UI/HPfill.png"); //load and display background
		heartHalfBMD = Assets.getBitmapData("UI/HPhalf.png"); 
		heartEmptyBMD = Assets.getBitmapData("UI/HPempty.png");
		
		heart01 = new Bitmap(heartFullBMD);
		heart01.x = 100;
		heart01.y = heartsY;
		heart01.scaleX = 2;
		heart01.scaleY = 2;
		
		heart02 = new Bitmap(heartFullBMD);
		heart02.x = 170;
		heart02.y = heartsY;
		heart02.scaleX = 2;
		heart02.scaleY = 2;
		
		heart03 = new Bitmap(heartFullBMD);
		heart03.x = 240;
		heart03.y = heartsY;
		heart03.scaleX = 2;
		heart03.scaleY = 2;
		
		heart04 = new Bitmap(heartFullBMD);
		heart04.x = 310;
		heart04.y = heartsY;
		heart04.scaleX = 2;
		heart04.scaleY = 2;
		
		heart05 = new Bitmap(heartFullBMD);
		heart05.x = 380;
		heart05.y = heartsY;
		heart05.scaleX = 2;
		heart05.scaleY = 2;

		addChild(heart01);
		addChild(heart02);
		addChild(heart03);
		addChild(heart04);
		addChild(heart05);

	}

	public function update(e:Event)
	{
		var playerHP:Int = player.getHealth();
		
		if (playerHP < 100)
		{
			if (playerHP == 90)
			{
				heart05.bitmapData = heartHalfBMD;
			}
			else if ( playerHP < 90)
			{
				heart05.bitmapData = heartEmptyBMD;
			}
			
			if (playerHP == 70)
			{
				heart04.bitmapData = heartHalfBMD;
			}
			else if ( playerHP < 70)
			{
				heart04.bitmapData = heartEmptyBMD;
			}
			
			if (playerHP == 50)
			{
				heart03.bitmapData = heartHalfBMD;
			}
			else if ( playerHP < 50)
			{
				heart03.bitmapData = heartEmptyBMD;
			}
			
			if (playerHP == 30)
			{
				heart02.bitmapData = heartHalfBMD;
			}
			else if ( playerHP < 30)
			{
				heart02.bitmapData = heartEmptyBMD;
			}
			
			if (playerHP == 10)
			{
				heart01.bitmapData = heartHalfBMD;
			}
			else if ( playerHP < 10)
			{
				heart01.bitmapData = heartEmptyBMD;
			}
		}
	}

	function spawnEnemy( event : Event ) {

		if ( enemyCount < 3) {
			timer++;

			if (timer == 500) {

				enemySpawn = new Enemy( this, player, Std.random(2) == 0 ? 1100 : -150);
				enemy.push(enemySpawn);
				addChild(enemySpawn);

				enemyCount++;

				timer = 0;

			}

		}

		if ( rEnemyCount < 2 ) {
			sTimer++;

			if (sTimer == 600 ) {

				rEnemySpawn = new SecondEnemy(this, player, Std.random(2) == 0 ? 2000 : -400);
				rollEnemy.push(rEnemySpawn);
				addChild(rEnemySpawn);

				rEnemyCount++;

				sTimer = 0;

			}

		}

	}

	

	override public function deleteLevel():Void {

		removeEventListener(Event.ENTER_FRAME, spawnEnemy);
		removeEventListener( Event.ENTER_FRAME, update );

		for (en in enemy) {
			
			en = null;
			enemySpawn = null;
			enemy.remove(en);
			
		}

		for ( rollEn in rollEnemy) {
			
			rollEn = null;
			rEnemySpawn = null;
			rollEnemy.remove(rollEn);
			
		}

		player = null;
				

		Main.sm.changeScreen(ScreenType.Menu);
		
		//stage.removeChildren();
		
		//removeChildren();
		

	}

}