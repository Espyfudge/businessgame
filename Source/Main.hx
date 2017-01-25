package;

import openfl.display.Sprite;
import screens.*;

class Main extends Sprite {
	
	public static var sm:ScreenManager;
	
	public static var mute:Bool = false;

  	public function new () {
		
		super ();
		
		sm = new ScreenManager();
		sm.run();
		//sm.loadScreen(ScreenType.Menu);
	}
}