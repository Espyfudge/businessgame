package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.display.Bitmap;
import openfl.Lib;
import openfl.events.Event;

class Main extends Sprite {

	var player : Player;
	var counter : Counter;

  	public function new () {
		
		super ();

		player = new Player();
		addChild( player );
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );
		
		counter = new Counter();
		add(counter);
		
		
	}

	


}
