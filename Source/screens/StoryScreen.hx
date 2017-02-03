package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.KeyboardEvent;
import openfl.events.Event;

//@author Vilius & Rutger
//displays the story and controls 
class StoryScreen extends Screen
{
	var keys : Array<Bool> = [];
	var illu1 : Bitmap;
	var illu2 : Bitmap;
	var useSpace : Bool;
	var space : Int = 0;

	public function new() 
	{
		super();
		
	}

	// Vilius
	//loads first story image and adds eventlisteners for use of spacebar
	override public function onLoad():Void
	{
		illu1 = new Bitmap( Assets.getBitmapData("assets/illustration1.png") );
		addChild(illu1);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		this.addEventListener(Event.ENTER_FRAME, spacebar);
	}
	
	// Vilius
	//returns true if a key is pressed down
	public function keyDown( event : KeyboardEvent ) : Void 
	{
		keys[event.keyCode] = true;
	}

	// Vilius 
	//returns false if a key is up
	public function keyUp( event : KeyboardEvent) : Void 
	{
		keys[event.keyCode] = false;
		if ( event.keyCode == 32 ) {

			useSpace = false;

		}
	}
 	
 	// Vilius & Rutger
	//continuously checks if spacebar is pressed and adds the next story image
	//after controls, starts the game
	function spacebar( event : Event ) : Void
	{
		if ( keys[32] && !useSpace && space == 0)
		{
			removeChild(illu1);
			illu2 = new Bitmap( Assets.getBitmapData("assets/illustration2.png") );
			addChild(illu2);
			useSpace = true;
			space = 1;
		}
		 
		if ( keys[32] && !useSpace && space == 1)
		{
			removeChild(illu2);
			var illu3 : Bitmap = new Bitmap (Assets.getBitmapData("assets/illustration3.png") );
			addChild(illu3);
			useSpace = true;
			space = 2;
		}

		if ( keys[32] && !useSpace && space == 2)
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.removeEventListener(Event.ENTER_FRAME, spacebar);
			removeChildren();
			Main.sm.changeScreen(ScreenType.Lev1);
		}
	}
}