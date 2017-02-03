package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.KeyboardEvent;
import openfl.events.Event;

// @author Rutger
//the screen you get upon finishing the game (beating level 5)
class WinScreen extends Screen {

	var keys : Array<Bool> = [];
	var useSpace : Bool;

	public function new () {

		super();

	}

	// adds background and eventlisteners to check for use of spacebar
	override public function onLoad() {

		var back : Bitmap = new Bitmap( Assets.getBitmapData("UI/YouWin.png") );
		addChild(back);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		this.addEventListener(Event.ENTER_FRAME, spacebar);

	}

	//returns true if specified key is pressed down
	public function keyDown( event : KeyboardEvent ) : Void 
	{
		keys[event.keyCode] = true;
	}

	//returns false if key is up
	public function keyUp( event : KeyboardEvent) : Void 
	{
		keys[event.keyCode] = false;
		if ( event.keyCode == 32 ) {

			useSpace = false;

		}
	}

	// returns to main menu on pressing space
	function spacebar( event : Event ) : Void {

		if (keys[32] && !useSpace) {

			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.removeEventListener(Event.ENTER_FRAME, spacebar);
			removeChildren();
			Main.sm.changeScreen(ScreenType.Menu);

		}

	}
	
}