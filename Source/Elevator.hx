package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Lib;
import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.display.Tilemap;
import openfl.geom.Rectangle;
import openfl.events.Event;
import openfl.media.Sound;
import openfl.media.SoundTransform;

//@author Rutger
// creates the animation for the elevator at ends of levels
class Elevator extends Sprite {
	
	var tileSet : Tileset;

	var lastUpdate : Int;

	public var elevator : Tilemap;

	// variable determining frame rate of animations
	static inline var fps : Int = 6;

	// calculates milliseconds every frame should be visible (based on fps)
	var msPerFrame : Int = Std.int( 1000 / fps );

	// total amount of frames in the sprite sheet (to define fram rectangles)
	static inline var frameCount : Int = 6;

	// time measurement to get proper frame rate
	var currentDuration : Int = 0;
	var currentFrame : Int = 0;

	// arrays containing the frame numbers of the animations in sprite sheet
	var openSequence : Array<Int> = [0, 1, 2, 3, 4, 5];
	var openedSequence : Array<Int> = [5];

	// current animation. one of sequences will be referenced by this var
	var currentStateFrames : Array<Int>;	

	var timer : Int = 0;

	var sTransform:SoundTransform;
	var soundDing:Sound;

	// loads the spritesheet, adds music and eventlisteners
	// automatically plays the openSequence
	public function new() {

		super();

		var bitmapData : BitmapData = Assets.getBitmapData( "assets/elevatorSheet.png" );
		tileSet = new Tileset( bitmapData );

		elevator = new Tilemap( 376, 376, tileSet);
		initializeSpriteSheet();

		elevator.addTile( new Tile( 0 ) );

		addChild( elevator );

		soundDing = Assets.getSound("Sounds/Ding_Elevator.mp3");
		if (Main.mute == false )
			{
				soundDing.play( 0, 1, new SoundTransform( 0.3, 0 ) );
			}

		elevator.y = 516;
		elevator.x = 771;

		currentStateFrames = openSequence;

		this.addEventListener( Event.ENTER_FRAME, updates );
		this.addEventListener( Event.ENTER_FRAME, update );

		lastUpdate = Lib.getTimer();

		this.addEventListener(Event.ENTER_FRAME, everyFrame );

	}	

	// selects the frames in the sheet
	function initializeSpriteSheet() {

		// frames are 376x376
		for ( i in 0 ... frameCount ) {

			tileSet.addRect( new Rectangle ( i * 376, 0, 376, 376 ) );

		}


	}

	public function updates( deltaTime : Float ) {

		currentDuration += Std.int( deltaTime * 1000 );

		if( currentDuration > msPerFrame ) {

			currentDuration -= msPerFrame;
			currentFrame++;

			if( currentFrame >= currentStateFrames.length )
				currentFrame = 0;

			elevator.removeTile( elevator.getTileAt( 0 ) );
			elevator.addTile( new Tile( currentStateFrames[currentFrame] ) );


		}

	}

	function update ( event : Event ) {

		var now : Int = Lib.getTimer();
		var deltaTime : Float = ( now - lastUpdate ) / 1000;
		lastUpdate = now;

		updates( deltaTime );

	}

	// increases the timer by 1 per frame. 
	//After 30 frames the animation sequence changes to openedSequence
	function everyFrame(event : Event) {

		timer++;
		if ( timer == 30 ) {

			currentStateFrames = openedSequence;

		}

	}

}