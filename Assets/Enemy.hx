package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

import openfl.display.Stage;
import openfl.Lib;
import openfl.events.Event;

import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.display.Tilemap;

import openfl.geom.Rectangle;
import openfl.geom.Point;

class Enemy extends Sprite {

	var lastUpdate : Int;

	var gravity : Float = 0.9;
	var velocity : Point = new Point( 0, 0 );
	var isOnGround : Bool;

	var enemyHealth : Int = 100;
	var enemyDamage : Int = 35;


	// tilesheet instance containing the sprite sheet
	var tileSet : Tileset;

	public var enemy : Tilemap;

	// variable determining frame rate of animations
	static inline var fps : Int = 7;

	// calculates milliseconds every frame should be visible (based on fps)
	var msPerFrame : Int = Std.int( 1000 / fps );

	// total amount of frames in the sprite sheet (to define fram rectangles)
	static inline var frameCount : Int = 1;

	// time measurement to get proper frame rate
	var currentDuration : Int = 0;
	var currentFrame : Int = 1;

	// arrays containing the frame numbers of the animations in sprite sheet
	var idleLeftSequence : Array<Int> = [0];
	var idleRightSequence : Array<Int> = [1];
	var walkLeftSequence : Array<Int> = [2, 3, 4, 5, 6, 7];
	var walkRightSequence : Array<Int> = [8, 9, 10, 11, 12, 13];

	// current animation. one of sequences will be referenced by this var
	var currentStateFrames : Array<Int>;	

	// determines which side the character faces
	var faces : Int = 0;

	var player : Player;

	var mainStage : Stage;

	var main : Main;

	public function new ( st : Main, playerRef : Player, enemyX : Int ) {

		super();

		player = playerRef;

		mainStage = st.stage;

		main = st;

		var bitmapData : BitmapData = Assets.getBitmapData( "assets/enemy_still_left.png" );
		tileSet = new Tileset( bitmapData );

		enemy = new Tilemap( 128, 128, tileSet);

		initializeSpriteSheet();

		enemy.addTile( new Tile( 0 ) );

		addChild( enemy );
		enemy.x = enemyX;

		currentStateFrames = idleRightSequence;

		this.addEventListener( Event.ENTER_FRAME, updates );
		this.addEventListener( Event.ENTER_FRAME, update );


		lastUpdate = Lib.getTimer();


		this.addEventListener(Event.ENTER_FRAME, everyFrame );


	}

	function initializeSpriteSheet() {

		// frames are 128x128
		for ( i in 0 ... frameCount ) {

			tileSet.addRect( new Rectangle ( i * (128+1), 0, 128, 128 ) );

		}


	}

	public function updates( deltaTime : Float ) {

		currentDuration += Std.int( deltaTime * 1000 );

		if( currentDuration > msPerFrame ) {

			currentDuration -= msPerFrame;
			currentFrame++;

			if( currentFrame >= currentStateFrames.length )
				currentFrame = 1;

			enemy.removeTile( enemy.getTileAt( 0 ) );
			enemy.addTile( new Tile( currentStateFrames[currentFrame] ) );


		}


	}

	function everyFrame( event : Event ) : Void {

		// if the enemy is higher above ( less than ) #
		if ( enemy.y < 450 ) {

			// gravity applies, enemy isn't on ground
			velocity.y += gravity;
			isOnGround = false;

		}
		else {

			velocity.y = 0;
			enemy.y = 450;
			isOnGround = true;

		}

		if ( enemy.x > player.character.x ) {

			velocity.x = -0.8;

		}
		else if (enemy.x < player.character.x ) {

			velocity.x = 0.8;

		}
		else {

			velocity.x = 0;

		}
		
		enemy.y += velocity.y;
		enemy.x += velocity.x;

	}

	function update ( event : Event ) {

		var now : Int = Lib.getTimer();
		var deltaTime : Float = ( now - lastUpdate ) / 1000;
		lastUpdate = now;

		updates( deltaTime );




	}

	public function takeDamage ( damage : Int ) {

		enemyHealth -= damage;

		if ( enemyHealth <= 0 ) {

			main.enemy.remove( this );
			mainStage.removeChild( this );

		}

	}

	
}