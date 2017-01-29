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
	static inline var fps : Int = 4;

	// calculates milliseconds every frame should be visible (based on fps)
	var msPerFrame : Int = Std.int( 1000 / fps );

	// total amount of frames in the sprite sheet (to define fram rectangles)
	static inline var frameCount : Int = 36;

	// time measurement to get proper frame rate
	var currentDuration : Int = 0;
	var currentFrame : Int = 1;

	// arrays containing the frame numbers of the animations in sprite sheet
	var leftAttackSequence : Array<Int> = [0, 1, 2];
	var attackRightSequence : Array<Int> = [3, 4, 5];
	var dyingLeftSequence : Array<Int> = [6, 7, 8, 9, 10, 11, 12];
	var dyingRightSequence : Array<Int> = [19, 18, 17, 16, 15, 14, 13];
	var idleLeftSequence : Array<Int> = [20];
	var idleRightSequence : Array<Int> = [21];
	var walkLeftSequence : Array<Int> = [22, 23, 24, 25, 26, 27, 28];
	var walkRightSequence : Array<Int> = [29, 30, 31, 32, 33, 34, 35];

	// current animation. one of sequences will be referenced by this var
	var currentStateFrames : Array<Int>;	

	// determines which side the character faces
	var faces : Int = 0;

	var player : Player;

	var mainStage : Stage;

	var main : screens.GameScreen;

	public function new ( st : screens.GameScreen, playerRef : Player, enemyX : Int ) {

		super();

		player = playerRef;
		
		main = st;
		
		mainStage = st.stage;

		

		var bitmapData : BitmapData = Assets.getBitmapData( "assets/EnemySheet.png" );
		tileSet = new Tileset( bitmapData );

		enemy = new Tilemap( 256, 256, tileSet);

		initializeSpriteSheet();

		enemy.addTile( new Tile( 0 ) );

		addChild( enemy );
		enemy.x = -enemy.width / 2;
		this.x = enemyX;

		currentStateFrames = idleRightSequence;

		this.addEventListener( Event.ENTER_FRAME, updates );
		this.addEventListener( Event.ENTER_FRAME, update );


		lastUpdate = Lib.getTimer();


		this.addEventListener(Event.ENTER_FRAME, everyFrame );


	}

	function initializeSpriteSheet() {

		// frames are 128x128
		for ( i in 0 ... frameCount ) {

			tileSet.addRect( new Rectangle ( i * 256, 0, 256, 256 ) );

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
		if ( this.y < 670 ) {

			// gravity applies, enemy isn't on ground
			velocity.y += gravity;
			isOnGround = false;

		}
		else {

			velocity.y = 0;
			this.y = 670;
			isOnGround = true;

		}

		if ( this.x > player.x ) {

			velocity.x = -0.8;
			currentStateFrames = walkLeftSequence;

		}
		else if (this.x < player.x ) {

			velocity.x = 0.8;
			currentStateFrames = walkRightSequence;

		}
		else {

			velocity.x = 0;

		}
		
		this.y += velocity.y;
		this.x += velocity.x;

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
			main.removeChild( this );

		}

	}

	
}