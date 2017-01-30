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
	var gravity : Float = 0.8;
	var velocity : Point = new Point( 0, 0 );
	var isOnGround : Bool;

	var playerHealth : Int = 3;

	// tilesheet instance containing the sprite sheet
	var tileSet : Tileset;

	public var character : Tilemap;

	// variable determining frame rate of animations
	static inline var fps : Int = 8;

	// calculates milliseconds every frame should be visible (based on fps)
	var msPerFrame : Int = Std.int( 1000 / fps );

	// total amount of frames in the sprite sheet (to define fram rectangles)
	static inline var frameCount : Int = 22;

	// time measurement to get proper frame rate
	var currentDuration : Int = 0;
	var currentFrame : Int = 1;

	// arrays containing the frame numbers of the animations in sprite sheet
	var idleLeftSequence : Array<Int> = [0];
	var idleRightSequence : Array<Int> = [1];
	var throwLeftSequence : Array<Int> = [2, 3, 4];
	var throwRightSequence : Array<Int> = [5, 6, 7];
	var walkLeftSequence : Array<Int> = [8, 9, 10, 11, 12, 13, 14];
	var walkRightSequence : Array<Int> = [15, 16, 17, 18, 19, 20, 21];

	// current animation. one of sequences will be referenced by this var
	var currentStateFrames : Array<Int>;	

	// determines which side the character faces
	var faces : Int = 1;

	var attackPressed : Bool;

	//public var projectile : Projectile;
	public var projectiles : Array<Projectile> = [];
	var projectileID : Int = 0;

	var enemy : Array<Enemy>;

	var screen : screens.GameScreen;

	var thrownTimer : Int = 0;
	var thrown : Bool = false;

	var timer : Int = 0;
	var timerCooldown : Bool = false;

	public function new (s:screens.GameScreen) {

		super();

		screen = s;

		var bitmapData : BitmapData = Assets.getBitmapData( "assets/CharacterSheet.png" );
		tileSet = new Tileset( bitmapData );

		character = new Tilemap( 256, 256, tileSet);
		character.x = -150;
		initializeSpriteSheet();

		character.addTile( new Tile( 0 ) );

		addChild( character );

		currentStateFrames = idleLeftSequence;

		this.addEventListener( Event.ENTER_FRAME, updates );
		this.addEventListener( Event.ENTER_FRAME, update );


		lastUpdate = Lib.getTimer();


		keys = [];
		this.addEventListener(Event.ENTER_FRAME, everyFrame );

	}

	public function setEnemyArray(a:Array<Enemy>)
	{
		enemy = a;
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
				currentFrame = 0;

			character.removeTile( character.getTileAt( 0 ) );
			character.addTile( new Tile( currentStateFrames[currentFrame] ) );


		}


	}

	public function keyDown( event : KeyboardEvent ) : Void {

		// key is pressed 
		keys[event.keyCode] = true;

	}

	public function keyUp( event : KeyboardEvent) : Void {

		// key isn't pressed down 
		keys[event.keyCode] = false;
		if ( event.keyCode == 40 ) {

			attackPressed = false;

		}

	}

	function everyFrame( event : Event ) : Void {

		// if the character is higher above ( less than) #
		if ( this.y < 670 ) {

			// gravity applies, character isn't on ground
			velocity.y += gravity;
			isOnGround = false;

		}
		else {

			// if character is on the level above, he is on ground
			velocity.y = 0;
			this.y = 670;
			isOnGround = true;

		}

		if ( this.x < -45 ) {

			this.x += 8;

		}

		if ( this.x > (stage.stageWidth -77) ) {

			this.x -= 8;

		}

		if (keys[37] && !attackPressed) {

			velocity.x = -5;
			faces = 0;
			currentStateFrames = walkLeftSequence;

		}
		else if (keys[39] && !attackPressed) {

			velocity.x = 5;
			faces = 1;
			currentStateFrames = walkRightSequence;
		}
		else {

			velocity.x = 0;
			if ( faces == 1 && !attackPressed ) {

				currentStateFrames = idleRightSequence;

			}
			else if ( faces == 0 && !attackPressed ) {

				currentStateFrames = idleLeftSequence;

			}

		}
		

		if ((keys[32] && isOnGround) || (keys[38] && isOnGround)) {

			velocity.y -= 20;

		}

		this.y += velocity.y;
		this.x += velocity.x;

		if (keys[40] && isOnGround && !attackPressed && timer == 0) {

			
		
			var projectile : Projectile = new Projectile(projectileID, enemy, this, faces == 0);
			projectiles[projectileID] = projectile;

			projectileID++;

			screen.addChild( projectile );
			
			thrown = true;
			thrownTimer = 0;
			attackPressed = true;
			timerCooldown = true;

		}
		
		if (timerCooldown) {

			timer++;
			if(timer == 35) {

				timer = 0;
				timerCooldown = false;

			}

		}

		if(thrown)
		{
			if ( faces == 0 ) {

				velocity.x = 0;
				currentStateFrames = throwLeftSequence;
				
			}
			else {

				currentStateFrames = throwRightSequence;

			}

			thrownTimer ++;
			if(thrownTimer >= 15)
			{
				thrownTimer = 0;
				thrown = false;

				if(faces == 0 ) {

					currentStateFrames = idleLeftSequence;

				}
				else {

					currentStateFrames = idleRightSequence;

				}

			}
		}

	}

	public function destroyProjectile(proj:Int)
	{
		screen.removeChild(projectiles[proj]);
		projectiles[proj] = null;
	}

	function update ( event : Event ) {

		var now : Int = Lib.getTimer();
		var deltaTime : Float = ( now - lastUpdate ) / 1000;
		lastUpdate = now;

		updates( deltaTime );

	}

}