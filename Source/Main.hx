package;

import openfl.display.Sprite;
import screens.*;
import openfl.display.StageDisplayState;

// @author Lynette
// runs the ScreenManager class
class Main extends Sprite {
	
	public static var sm:ScreenManager;
	
	public static var mute:Bool = false;

  	public function new () {
		
		super ();
		
		stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;

		sm = new ScreenManager();
		sm.run();

	}
}