package screens;

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
		player = new Player();
		addChild( player );
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDown );
		stage.addEventListener(KeyboardEvent.KEY_UP, player.keyUp );
	}
	
}