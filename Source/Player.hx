package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Stage;

class Player extends Sprite {
	
	var keys : Array<Bool>;
	var gravity : Float = 0.9;
	var velocity : Point = new Point( 0, 0 );
	var isOnGround : Bool;
	var character : Bitmap;

	public function new () {

		super();

		var charStillData : BitmapData = Assets.getBitmapData("assets/character.png");
		character = new Bitmap( charStillData );
		addChild( character );

		keys = [];
		this.addEventListener(Event.ENTER_FRAME, everyFrame );

	}

	public function keyDown( event : KeyboardEvent ) : Void {

		keys[event.keyCode] = true;

	}

	public function keyUp( event : KeyboardEvent) : Void {

		keys[event.keyCode] = false;

	}

	function everyFrame( event : Event ) : Void {


		if ( character.y < 450 ) {

			velocity.y += gravity;
			isOnGround = false;

		}
		else {

			velocity.y = 0;
			isOnGround = true;

		}

		if ( character.x < -45 ) {

			character.x += 8;

		}

		if ( character.x > (stage.stageWidth -77) ) {

			character.x -= 8;

		}

		if (keys[37]) {

			velocity.x = -7;

		}
		else if (keys[39]) {

			velocity.x = 7;

		}
		else {

			velocity.x = 0;

		}
		

		if (keys[32] && isOnGround || keys[38] && isOnGround ) {

			velocity.y -= 10;

		}

		character.y += velocity.y;
		character.x += velocity.x;

	}

}