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

//@author Rutger
// the regular walking enemy 
class Enemy extends Sprite {

	var lastUpdate : Int;

	var gravity : Float = 0.9;
	var velocity : Point = new Point( 0, 0 );
	var isOnGround : Bool;

	var enemyHealth : Int = 100;
	var enemyDamage : Int = 20;

	// tilesheet instance containing the sprite sheet
	var tileSet : Tileset;

	public var enemy : Tilemap;

	// variable determining frame rate of animations
	static inline var fps : Int = 5;

	// calculates milliseconds every frame should be visible (based on fps)
	var msPerFrame : Int = Std.int( 1000 / fps );

	// total amount of frames in the sprite sheet (to define fram rectangles)
	static inline var frameCount : Int = 44;

	// time measurement to get proper frame rate
	var currentDuration : Int = 0;
	var currentFrame : Int = 1;

	// arrays containing the frame numbers of the animations in sprite sheet
	var attackLeftSequence : Array<Int> = [0, 1, 2];
	var attackRightSequence : Array<Int> = [3, 4, 5];
	var dyingLeftSequence : Array<Int> = [6, 7, 8, 9, 10, 11, 12];
	var dyingRightSequence : Array<Int> = [19, 18, 17, 16, 15, 14, 13];
	var idleLeftSequence : Array<Int> = [20];
	var idleRightSequence : Array<Int> = [21];
	var walkLeftSequence : Array<Int> = [22, 23, 24, 25, 26, 27, 28];
	var walkRightSequence : Array<Int> = [29, 30, 31, 32, 33, 34, 35];
	var hitLeftSequence : Array<Int> = [36, 37, 38, 39];
	var hitRightSequence : Array<Int> = [43, 42, 41, 40];

	// current animation. one of sequences will be referenced by this var
	var currentStateFrames : Array<Int>;	

	// determines which side the character faces
	var faces : Int = 0;

	var player : Player;

	var mainStage : Stage;

	var main : screens.Screen;

	var timer : Int = 0;
	var playerHit : Bool;

	var gotHit : Bool;
	var hitTimer : Int = 0;

	var isDead : Bool;
	var deadTimer : Int = 0;
	
	// adds spritesheet and eventlisteners
	public function new ( st : screens.Screen, playerRef : Player, enemyX : Int ) {

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
		this.addEventListener(Event.ENTER_FRAME, damagePlayer );

	}

	// selects the frames in the sheet
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

	// applies gravity, checks for player y to add movement, and adds animations
	function everyFrame( event : Event ) : Void {

		// if the enemy is higher above ( less than ) #
		if ( this.y < 318 ) {

			// gravity applies, enemy isn't on ground
			velocity.y += gravity;
			isOnGround = false;

		}
		else {

			velocity.y = 0;
			this.y = 318;
			isOnGround = true;

		}

		if ( this.x >= player.x + 30 ) {

			velocity.x = -0.9;
			faces = 0;
			currentStateFrames = walkLeftSequence;

		}
		else if ( this.x <= player.x - 30 ) {

			velocity.x = 0.9;
			faces = 1;
			currentStateFrames = walkRightSequence;

		}
		else {

			velocity.x = 0;

		}
		
		enemy.x = this.x;
		enemy.y = this.y;
		this.y += velocity.y;
		this.x += velocity.x;

		//tests for takedamage function, if enemy got hit
		if (gotHit) {
			
			velocity.x = 0;
			if ( faces == 0 ) {

				currentStateFrames = hitLeftSequence;

			}
			else {

				currentStateFrames = hitRightSequence;

			}

			hitTimer++;

			if(hitTimer >= 30) {
			
				hitTimer = 0;
				gotHit = false;

				if( faces == 0 ) {

					currentStateFrames = idleLeftSequence;

				}
				else {

					currentStateFrames = idleRightSequence;

				}
				
			}
		}

	}

	// runs isDead if set to true in other function
	function update ( event : Event ) {

		var now : Int = Lib.getTimer();
		var deltaTime : Float = ( now - lastUpdate ) / 1000;
		lastUpdate = now;

		updates( deltaTime );

		//tests for takedamage - if enemy is dead
		if (isDead) {
			
			removeEventListener(Event.ENTER_FRAME, everyFrame );
			removeEventListener(Event.ENTER_FRAME, damagePlayer);

			if ( faces == 0 ) {
				
				currentStateFrames = dyingLeftSequence;

			}
			else {

				currentStateFrames = dyingRightSequence;

			}

			deadTimer++;

			if(deadTimer == 33) {
			
				main.timehead.x -= (355 / main.totalEn);
				main.enemy.remove( this );
				main.removeChild( this );
				
			}

		}

	}

	// removes eventlisteners and the enemy from the level screen
	public function removeEnemy() {

		removeEventListener(Event.ENTER_FRAME, everyFrame );
		removeEventListener(Event.ENTER_FRAME, damagePlayer);
		removeEventListener(Event.ENTER_FRAME, update);
		removeEventListener(Event.ENTER_FRAME, updates);

		main.enemy.remove( this );
		main.removeChild( this );

	}

	// removes health from enemy if taken damage, checks if enemy still has health to run correct animations
	public function takeDamage ( damage : Int ) {

		enemyHealth -= damage;

		if ( enemyHealth > 0 ) {

			gotHit = true;

		}

		if ( enemyHealth <= 0 ) {

			isDead = true;

		}

	}

	// checks for range to player and damages them if in range, timer on it so it cant hit every frame
	public function damagePlayer ( event : Event ) {

		if ( playerHit ) {
			
			timer++;

		}

		if ( timer == 120 ) {

			timer = 0;
			playerHit = false;

		}

		if ( timer == 0 ) {

			if ( this.x >= player.x - 30 && this.x <= player.x + 30 ) {

				if ( player.y > this.y - 70 ) {

					if ( player.playerHealth > 0 ) {

						if( faces == 0 ) {

							currentStateFrames = attackLeftSequence;

						}
						else {

							currentStateFrames = attackRightSequence;

						}

						player.takeDamage(enemyDamage);
						playerHit = true;

					}

				}
	
			}

		}

	}

}