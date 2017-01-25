package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Lynette
 */
class GameScreen extends Screen
{
	var player : Player;

	public function new() 
	{
		super();
	}
	
	override public function onLoad():Void
	{
		//player = new Player();
		//addChild( player );
		
		//stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		//stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );
	}
	
	private function playerTakesDmg(dmg:Int)
	{
		//health - dmg;
		//update healthbar
	}
	
	private function playerHeal(heal:Int)
	{
		//health + heal;
		//update healthbar
	}
	
}