package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Lib;
import openfl.events.Event;

class Main extends Sprite {

	var player : Player;
	public var enemy : Array<Enemy> = [];
	var projectile : Projectile;

  	public function new () {
		
		super ();

		var backData : BitmapData = Assets.getBitmapData( "assets/tempbackground.png" );
		var back : Bitmap = new Bitmap( backData );
		addChild( back );

		player = new Player();
		stage.addChild( player );

		enemy[0] = new Enemy( this, player, 900 );
		stage.addChild( enemy[0] );

		enemy[1] = new Enemy( this, player, 1300 );
		stage.addChild( enemy[1] );

		enemy[2] = new Enemy( this, player, 1600 );
		stage.addChild( enemy[2] );

		player.setEnemyArray(enemy);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );
		
		
		
	}


}