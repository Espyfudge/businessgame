package;

import openfl.display.Sprite;

import screens.*;

class Main extends Sprite 
{

	// which screen is visible/active now
	private var currentScreen:Screen;

	public static var instance(get, null):Main;

	private function new () 
	{
		super ();
	}

	public function loadScreen( which:ScreenType )
	{
		if( currentScreen != null && contains( currentScreen ) )
		{
			removeChild( currentScreen );
			currentScreen.onDestroy();
		}

		switch ( which ) 
		{
			case ScreenType.Menu:
				currentScreen = new MenuScreen();
			case ScreenType.Game:
				currentScreen = new GameScreen();
		}

		addChild( currentScreen );
		currentScreen.onLoad();
	}

	public static function get_instance():Main
	{
		if( instance == null )
			instance = new Main();

		return instance;
	}

	
	public static function main()
	{
		var m:Main = Main.instance;
		openfl.Lib.current.stage.addChild( m );

		m.loadScreen( ScreenType.Menu );
	}
}