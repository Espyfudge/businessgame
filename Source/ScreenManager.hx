package;

import openfl.display.Sprite;

import screens.*;

//@author Lynette
// divides the application into multiple screens, each with their own classes
class ScreenManager extends Sprite 
{

	// which screen is visible/active now
	public var currentScreen:Screen;
	
	private var m:ScreenManager;

	// the static variable pointing to the instance of this class
	public static var instance(get, null):ScreenManager;

	private function new () 
	{
		super ();
	}

	// Loads a screen.
	//If there is a screen active it is removed first from the display list and
	//it's onDestroy function is called to do possible house keeping tasks
	//Then it checks which screen to load and loads it and calls its onLoad function
	public function loadScreen( which:ScreenType )
	{
		if( currentScreen != null )
		{
			removeChild( this.currentScreen );
			this.currentScreen.onDestroy();
		}

		switch ( which ) 
		{
			case ScreenType.Menu:
				currentScreen = new MenuScreen();
			case ScreenType.Story:
				currentScreen = new StoryScreen();
			case ScreenType.Lev1:
				currentScreen = new Level1();
			case ScreenType.Lev2:
				currentScreen = new Level2();
			case ScreenType.Lev3:
				currentScreen = new Level3();
			case ScreenType.Lev4:
				currentScreen = new Level4();
			case ScreenType.Lev5:
				currentScreen = new Level5();
			case ScreenType.GameOver:
				currentScreen = new GameOverScreen();
			case ScreenType.Win:
				currentScreen = new WinScreen();

		}

		addChild( currentScreen );
		currentScreen.onLoad();
		trace(currentScreen);
	}

	
	//The public access to the private instance variable
	public static function get_instance():ScreenManager
	{
		if( instance == null )
			instance = new ScreenManager();

		return instance;
	}
	
	//sets which screen to load
	public function changeScreen(which:ScreenType)
	{
		m.loadScreen(which);
	}
	
	public function run()
	{
		m = ScreenManager.instance;
		openfl.Lib.current.stage.addChild( m );
		
		changeScreen(ScreenType.Menu);
	}
}