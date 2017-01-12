package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.geom.Point;
import openfl.events.Event;

class Projectile extends Sprite {
	
	var velocity : Point = new Point( 0, 0 );

	public var bCard : Bitmap;

	var enemy : Array<Enemy>; 

	var playerDamage : Int = 30;

	var player:Player;

	public var ID : Int;

	var left : Bool;

	public function new (i : Int, en : Array<Enemy>, p:Player, b : Bool) {

		super();

		left = b;

		ID = i;

		enemy = en;
		player = p;

		var bCardData : BitmapData = Assets.getBitmapData( "assets/bCard.png" );
		bCard = new Bitmap( bCardData );
		bCard.x = -bCardData.width;
		addChild( bCard );

		this.addEventListener(Event.ENTER_FRAME, shoot );

	}

	public function shoot( event : Event ) {

		this.x += (velocity.x * (left ? -1 : 1));
		velocity.x = 5;

		for ( badguy in enemy ) {

			if ( this.x >= badguy.x - 30 && this.x <= badguy.x + 30 ) {

				badguy.takeDamage( playerDamage + Math.ceil( 30 * Math.random() ) );
				player.destroyProjectile(ID);
				this.removeEventListener(Event.ENTER_FRAME, shoot );
				return;

			}

		}

		if(this.x > 2000 || this.x < -2000)
		{
			player.destroyProjectile(ID);
			this.removeEventListener(Event.ENTER_FRAME, shoot );
		}
		
	}

}
