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

// @author Mimosa
// based on Enemy class
// the roller enemy that goes from side to side of the screen
class SecondEnemy extends Sprite
{
	
	var lastUpdate : Int;
	
	var gravity : Float = 0.9;
	var velocity : Point = new Point( 0, 0 );
	var isOnGround : Bool;
	
	var enemyHealth : Int = 1;
	var enemyDamage : Int = 10;
	
	var tileSet : Tileset;
	
	public var secondEnemy : Tilemap;
	
	static inline var fps : Int = 3;
	var msPerFrame : Int = Std.int( 1000 / fps );
	static inline var frameCount : Int = 22;
	
	var currentDuration : Int = 0;
	var currentFrame : Int = 1;
	
	var rollLeftSequence : Array<Int> = [0, 1, 2, 3];
	var rollRightSequence : Array<Int> = [18, 19, 20, 21];
	var dyingLeftSequence : Array<Int> = [4, 5, 6, 7, 8, 9, 10];
	var dyingRightSequence : Array<Int> = [17, 16, 15, 14, 13, 12, 11];
	
	var currentStateFrames : Array<Int>;
	
	var faces : Int = 0;

	var player : Player;

	var mainStage : Stage;

	var main : screens.Screen;

	var timer : Int = 0;
	var playerHit : Bool;

	var isDead : Bool;
	var deadTimer : Int = 0;
	
	// adds spritesheet and eventlisteners
	public function new(st : screens.Screen, playerRef : Player, secondEnemyX : Int) 
	{
		super();
		
		player = playerRef;
		
		main = st;
		
		mainStage = st.stage;
		
		
		var bitmapData : BitmapData = Assets.getBitmapData( "assets/SecondEnemySheet.png" );
		tileSet = new Tileset( bitmapData );
		
		secondEnemy = new Tilemap( 256, 256, tileSet);
		
		initializeSpriteSheet();
		
		secondEnemy.addTile( new Tile( 0 ) );
		
		addChild( secondEnemy );
		secondEnemy.x = -secondEnemy.width / 2;
		
		this.x = secondEnemyX;
		
		currentStateFrames = rollRightSequence;
		
		this.addEventListener( Event.ENTER_FRAME, updates );
		this.addEventListener( Event.ENTER_FRAME, update );
		
		lastUpdate = Lib.getTimer();
		
		this.addEventListener(Event.ENTER_FRAME, everyFrame );
		this.addEventListener(Event.ENTER_FRAME, damagePlayer );
	}
	
	// selects the frames in the sheet
	function initializeSpriteSheet() 
	{
		// frames are 256
		for ( i in 0 ... frameCount ) 
		{
			tileSet.addRect( new Rectangle ( i * 256, 0, 256, 256 ) );
		}
	}
	
	public function updates( deltaTime : Float ) 
	{
		currentDuration += Std.int( deltaTime * 1000 );
		
		if ( currentDuration > msPerFrame ) 
		{
			currentDuration -= msPerFrame;
			currentFrame++;
			
			if( currentFrame >= currentStateFrames.length )
			currentFrame = 1;
			
			secondEnemy.removeTile( secondEnemy.getTileAt( 0 ) );
			secondEnemy.addTile( new Tile( currentStateFrames[currentFrame] ) );
		}
	}
	
	// applies gravity, checks position to add correct movement 
	function everyFrame( event : Event ) : Void 
	{
		// if the enemy is higher above ( less than ) 
		if ( this.y < 318 ) 
		{
			// gravity applies, enemy isn't on ground 
			velocity.y += gravity;
			isOnGround = false;
		}
		
		else 
		{
			velocity.y = 0;
			this.y = 318;
			isOnGround = true;
		}
		
		
		if ( this.x >= 2000 ) 
		{
			faces = 0;
			velocity.x = -6;
			currentStateFrames = rollLeftSequence;
		}
		else if (this.x <= -300 )
		{
			faces = 1;
			velocity.x = 6;
			currentStateFrames = rollRightSequence;
		}

		secondEnemy.x = this.x;
		secondEnemy.y = this.y;
		this.y += velocity.y;
		this.x += velocity.x;
	
	}
	
	// runs isDead function if turned to true in other function
	function update ( event : Event ) 
	{
		var now : Int = Lib.getTimer();
		var deltaTime : Float = ( now - lastUpdate ) / 1000;
		lastUpdate = now;
		
		updates( deltaTime );

		//tests for takedamage function - if enemy is dead
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

			if(deadTimer == 30) {
			
				main.timehead.x -= (355 / main.totalEn);
				main.rollEnemy.remove( this );
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

		main.rollEnemy.remove( this );
		main.removeChild( this );


	}

	// removes health if taken damage, checks and sets isDead to true if 0 or less health
	public function takeDamage ( damage : Int ) {

		enemyHealth -= damage;
		
		if ( enemyHealth <= 0 ) {

			isDead = true;
			

		}


	}

	// checks range to player and damages them if in range.
	// timer so it doesn't damage every frame
	public function damagePlayer ( event : Event ) {

		if ( playerHit ) {
			
			timer++;

		}

		if ( timer == 40 ) {

			timer = 0;
			playerHit = false;

		}

		if ( timer == 0 ) {

			if ( this.x >= player.x - 80 && this.x <= player.x + 90 ) {

				if ( player.y > this.y - 20 ) {

					if ( player.playerHealth > 0 ) {

						player.takeDamage(enemyDamage);
						playerHit = true;

					}

				}

			}

		}

	}

}