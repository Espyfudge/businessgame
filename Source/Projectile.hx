package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.geom.Point;
import openfl.events.Event;

import openfl.media.Sound;
import openfl.media.SoundTransform;

//@author Rutger
// represents the businesscards/projectiles the player shoots
class Projectile extends Sprite {
	
	var velocity : Point = new Point( 0, 0 );

	public var bCard : Bitmap;

	var enemy : Array<Enemy>; 

	var rollEnemy : Array<SecondEnemy>;

	var playerDamage : Int = 30;

	var player:Player;

	public var ID : Int;

	var left : Bool;

	var soundEHit:Sound;
	var sTransform:SoundTransform;

	var timer : Int = 0;

	// adds the bitmap, sound, and eventlisteners
	public function new (projID : Int, en : Array<Enemy>, ren : Array<SecondEnemy>, pl : Player, dirLeft : Bool) {

		super();

		left = dirLeft;

		ID = projID;

		enemy = en;
		rollEnemy = ren;
		player = pl;

		soundEHit = Assets.getSound("Sounds/Hit_enemies.mp3"); // Lynette

		var bCardData : BitmapData = Assets.getBitmapData( "assets/bCard.png" );
		bCard = new Bitmap( bCardData );
		bCard.x = -bCardData.width / 2;
		addChild( bCard );
		bCard.y = -500;

		this.x = Std.int(left ? player.x + 10 : player.x + 80 );
		this.y = player.y + 50;

		this.addEventListener(Event.ENTER_FRAME, shoot );

	}

	// gives the card velocity and checks if it's close to an enemy to damage them
	// if hit an enemy or outside the screen, it removes itself 
	public function shoot( event : Event ) {

		bCard.x = this.x;
		bCard.y = this.y;
		this.x += (velocity.x * (left ? -1 : 1));
		this.y += velocity.y;
		velocity.x = 6;

		timer++;

		if (timer == 1 ) {

			velocity.y = 0.35;

		}

		if ( timer == 60 ) {

			velocity.y = -0.15;
		}

		if ( timer == 70 ) {

			velocity.y = -0.20;

		}

		for ( badguy in enemy ) {

			if ( this.x >= badguy.x && this.x <= badguy.x + 90 ) {

				if (Main.mute == false) // Lynette
				{
					soundEHit.play( 0, 1, new SoundTransform( 6.0, 0 ) );
				}

				badguy.takeDamage( playerDamage + Math.ceil( 30 * Math.random() ) );
				player.destroyProjectile(ID);
				this.removeEventListener(Event.ENTER_FRAME, shoot );
				return;

			}

		}

		for ( roller in rollEnemy ) {

			if ( this.x >= roller.x - 40 && this.x <= roller.x + 90 ) {

				if (Main.mute == false) // Lynette 
				{
					soundEHit.play( 0, 1, new SoundTransform( 6.0, 0 ) );
				}

				roller.takeDamage( playerDamage );
				player.destroyProjectile(ID);
				this.removeEventListener(Event.ENTER_FRAME, shoot );
				return;

			}

		}


		if(this.x > 1000 || this.x < -10)
		{
			player.destroyProjectile(ID);
			this.removeEventListener(Event.ENTER_FRAME, shoot );
		}
		
	}

}
