package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.display.Bitmap;
import openfl.Lib;
import openfl.events.Event;
import screens.*;

class Main extends Sprite {
	
	var sm:ScreenManager;

  	public function new () {
		
		super ();
		
		sm = new ScreenManager();
		sm.loadScreen(ScreenType.Menu);
	}
}