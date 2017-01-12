package screens;

import openfl.Assets;

import openfl.display.Sprite;
import openfl.display.Bitmap;

/**
 * Simple screen in the application.
 * Shows a text and a button.
 *
 */
class MenuScreen extends Screen
{
	public function new()
	{
		super();
	}
	
	override public function onLoad():Void
	{
		var backScreen : Bitmap = new Bitmap( Assets.getBitmapData("assets/MenuScreen.png") );
		addChild(backScreen);

		var toGame:Button = new Button( 
			Assets.getBitmapData("assets/playButton.png"), 
			Assets.getBitmapData("assets/playButton.png"), 
			Assets.getBitmapData("assets/playButton.png"), 
			"", 
			onPlayClick );

		toGame.x = (stage.stageWidth-toGame.width) / 2;
		toGame.y = stage.stageHeight / 3;
		addChild( toGame );
	}

	private function onPlayClick()
	{
		Main.instance.loadScreen( ScreenType.Game );
	}

}