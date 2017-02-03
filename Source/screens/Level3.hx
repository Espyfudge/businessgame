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

//@author Rutger
// screen for the third playable level
class Level3 extends Screen
{
	
	var volume:Float = 0.15;
	var enemyAmount = 15;
	var rEnemyAmount = 9;

	public function new()
	{
		super();
	}

	// loads background, music, characters, UI and eventlisteners
	override public function onLoad():Void
	{

		var backData : BitmapData = Assets.getBitmapData( "assets/BackgroundLevelThree.png" );
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
		

		displayUI();

		addEventListener( Event.ENTER_FRAME, update );

	}

	// loads hearts that signify health and a bar which shows how many enemies are left
	function displayUI()
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

		var timebar : Bitmap = new Bitmap( Assets.getBitmapData("UI/TimerBar.png") );
		addChild(timebar);
		timebar.x = 1400;
		timebar.y = 45;
		timebar.scaleX = 1.5;
		timebar.scaleY = 4;

		timehead = new Bitmap( Assets.getBitmapData("UI/TimerHead.png") );
		addChild(timehead);
		timehead.x = /*1715*/1380;
		timehead.y = 125;
		timehead.scaleX = 3;
		timehead.scaleY = 3;

		totalEn = enemyAmount + rEnemyAmount;
		for (ene in 0...totalEn) {

			timehead.x +=  (335 / totalEn);

		}

	}

	// checks for and adjusts health hearts
	// checks if all enemies are defeated and continues to next level if so 
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

		if ( enemyCount == enemyAmount && rEnemyCount == rEnemyAmount && enemy.length == 0 && rollEnemy.length == 0 ) {

			elvCount++;
			if ( elvCount == 1 ) { 

				elv = new Elevator();
				addChild(elv);
				addChild(player);
			}

			if (elvCount == 120 ) {	
				
				deleteLevel();
				Main.sm.changeScreen(ScreenType.Lev4);
			
			}

		}

	}

	// spawns the enemies randomly left or right of the screen, timer to control how often they spawn
	function spawnEnemy( event : Event ) {

		if ( enemyCount < enemyAmount) {
			timer++;

			if (timer == 160) {

				enemySpawn = new Enemy( this, player, Std.random(2) == 0 ? 1100 : -150);
				enemy.push(enemySpawn);
				addChild(enemySpawn);

				enemyCount++;

				timer = 0;

			}

		}

		if ( rEnemyCount < rEnemyAmount ) {
			sTimer++;

			if (sTimer == 340 ) {

				rEnemySpawn = new SecondEnemy(this, player, Std.random(2) == 0 ? 2000 : -400);
				rollEnemy.push(rEnemySpawn);
				addChild(rEnemySpawn);

				rEnemyCount++;

				sTimer = 0;

			}

		}

	}

	// deletes eventlisteners, characters and music
	override public function deleteLevel():Void {

		removeEventListener(Event.ENTER_FRAME, spawnEnemy);
		removeEventListener(Event.ENTER_FRAME, update );

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
		channel.stop();
		channel = null;
		elv = null;
				

		Main.sm.changeScreen(ScreenType.Menu);

	}

}