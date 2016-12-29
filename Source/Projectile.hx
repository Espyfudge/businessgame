package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.geom.Point;
import openfl.events.Event;

class Projectile extends Sprite {
	
	var velocity : Point = new Point( 0, 0 );

	public var tempCard : Bitmap;

	var enemy : Array<Enemy>; 

	var playerDamage : Int = 30;

	var player:Player;

	public function new ( en : Array<Enemy>, p:Player) {

		super();

		enemy = en;
		player = p;

		var tempCardData : BitmapData = Assets.getBitmapData( "assets/tempcard.png" );
		tempCard = new Bitmap( tempCardData );
		tempCard.x = -tempCardData.width;
		addChild( tempCard );

		this.addEventListener(Event.ENTER_FRAME, shoot );

	}

	public function shoot( event : Event ) {

		tempCard.x += velocity.x;
		velocity.x = 5;

		for ( badguy in enemy ) {

			if ( tempCard.x >= badguy.enemy.x - 50 && tempCard.x <= badguy.enemy.x + 50 ) {

				badguy.takeDamage( playerDamage + Math.ceil( 30 * Math.random() ) );
				player.destroyProjectile();
				this.removeEventListener(Event.ENTER_FRAME, shoot );


			}

		}
		
	}

}
