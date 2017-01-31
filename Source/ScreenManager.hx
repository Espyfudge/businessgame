package;

import openfl.display.Sprite;

import screens.*;

/**
 * Demonstrates a way to devide up an application into seperate screens represented by their own class.
 *
 * This Main class is a Singleton
 */
class ScreenManager extends Sprite
{

	// which screen is visible/active now
	public var currentScreen:Screen;

	private var m:ScreenManager;

	// the static variable pointing to the instance of this class
	// see http://haxe.org/manual/class-field-property.html for the access modifiers
	public static var instance(get, null):ScreenManager;

	/**
	 * This constructor does not do much...
	 */
	private function new ()
	{
		super ();
	}

	/**
	 * Load a screen.
	 * If there is a screen active:
	 * - it is removed first from the display list
	 * - it's onDestroy function is called to do possible house keeping tasks
	 *
	 * Then a check is done for which screen to load,
	 *  it is instantitated, added to the display list and it's onLoad function is called.
	 */
	public function loadScreen( which:ScreenType )
	{
		if( currentScreen != null)
		{
				removeChild( this.currentScreen );
				this.currentScreen.onDestroy();
				trace(currentScreen.toString() + " Destroyed!");
		}

		switch ( which ) 
		{
			case ScreenType.Menu:
				currentScreen = new MenuScreen();
				trace(currentScreen.toString() + " Created!");
			case ScreenType.Game:
				currentScreen = new GameScreen();
				trace(currentScreen.toString() + " Created!");
			case ScreenType.GameOver:
				currentScreen = new GameOverScreen();
				trace(currentScreen.toString() + " Created!");
		}

		addChild( currentScreen );
		trace(currentScreen.toString() + " Active!");
		currentScreen.onLoad();
	}

	/**
	 * The public access to the private instance variable
	 *
	 */
	public static function get_instance():ScreenManager
	{
		if ( instance == null )
			instance = new ScreenManager();

		return instance;
	}

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