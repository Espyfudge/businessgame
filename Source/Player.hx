package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Stage;
import openfl.Lib;

import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.display.Tilemap;

import openfl.geom.Rectangle;

class Player extends Sprite {
	
	var lastUpdate : Int;

	var keys : Array<Bool>;
	var gravity : Float = 0.9;
	var velocity : Point = new Point( 0, 0 );
	var isOnGround : Bool;

	var playerHealth : Int = 100;
	var playerDamage : Int = 30 + Math.ceil( 30 * Math.random() );


	// tilesheet instance containing the sprite sheet
	var tileSet : Tileset;

	var tilemap : Tilemap;

	// variable determining frame rate of animations
	static inline var fps : Int = 7;

	// calculates milliseconds every frame should be visible (based on fps)
	var msPerFrame : Int = Std.int( 1000 / fps );

	// total amount of frames in the sprite sheet (to define fram rectangles)
	static inline var frameCount : Int = 14;

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
	var faces : Int = 1;



	public function new () {

		super();

		//var bitmapData : BitmapData = Assets.getBitmapData( "assets/CharacterSheet.png" );
		var bitmapData : BitmapData = Assets.getBitmapData( "img/character.png" );

		tileSet = new Tileset( bitmapData );

		tilemap = new Tilemap( 128, 128, tileSet);

		initializeSpriteSheet();

		tilemap.addTile( new Tile( 0 ) );

		addChild( tilemap );

		currentStateFrames = idleRightSequence;

		this.addEventListener( Event.ENTER_FRAME, updates );
		this.addEventListener( Event.ENTER_FRAME, update );


		lastUpdate = Lib.getTimer();


		keys = [];
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
				currentFrame = 0;

			tilemap.removeTile( tilemap.getTileAt( 0 ) );
			tilemap.addTile( new Tile( currentStateFrames[currentFrame] ) );


		}


	}

	public function keyDown( event : KeyboardEvent ) : Void {

		// key is pressed 
		keys[event.keyCode] = true;

	}

	public function keyUp( event : KeyboardEvent) : Void {

		// key isn't pressed down 
		keys[event.keyCode] = false;

	}

	function everyFrame( event : Event ) : Void {

		// if the character is higher above ( less than) #
		if ( tilemap.y < 450 ) {

			// gravity applies, character isn't on ground
			velocity.y += gravity;
			isOnGround = false;

		}
		else {

			// if character is on the level above, he is on ground
			velocity.y = 0;
			isOnGround = true;

		}

		if ( tilemap.x < -45 ) {

			tilemap.x += 8;

		}

		if ( tilemap.x > (stage.stageWidth -77) ) {

			tilemap.x -= 8;

		}

		if (keys[37]) {

			velocity.x = -5;
			faces = 0;
			currentStateFrames = walkLeftSequence;

		}
		else if (keys[39]) {

			velocity.x = 5;
			faces = 1;
			currentStateFrames = walkRightSequence;
		}
		else {

			velocity.x = 0;
			if ( faces == 1 ) {

				currentStateFrames = idleRightSequence;

			}
			else {

				currentStateFrames = idleLeftSequence;

			}

		}
		

		if (keys[32] && isOnGround || keys[38] && isOnGround ) {

			velocity.y -= 10;

		}

		if (keys[40] && isOnGround) {

			
			
		}

		tilemap.y += velocity.y;
		tilemap.x += velocity.x;

	}

	function update ( event : Event ) {

		var now : Int = Lib.getTimer();
		var deltaTime : Float = ( now - lastUpdate ) / 1000;
		lastUpdate = now;

		updates( deltaTime );

	}

}