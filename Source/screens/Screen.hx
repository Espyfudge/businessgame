package screens;

import openfl.Assets;
import openfl.Lib;

import openfl.display.Sprite;

import openfl.events.Event;

import openfl.display.Bitmap;
import openfl.display.BitmapData;

import openfl.events.KeyboardEvent;

import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

/**
 * The base class for all screens.
 * The onLoad and onDestroy can be implemented in the derived classes.
 */
class Screen extends Sprite
{

	var player : Player;
	public var enemy : Array<Enemy> = [];
	public var rollEnemy : Array<SecondEnemy> = [];
	var projectile : Projectile;

	var timer : Int = 0;
	var sTimer : Int = 0;

	var enemyCount : Int = 0;
	var rEnemyCount : Int = 0;

	var theme:Sound;
	public var channel:SoundChannel;
	
	var heartFullBMD:BitmapData;
	var heartHalfBMD:BitmapData;
	var heartEmptyBMD:BitmapData;
	public var heart01:Bitmap;
	public var heart02:Bitmap;
	public var heart03:Bitmap;
	public var heart04:Bitmap;
	public var heart05:Bitmap;

	var heartsY : Int = 130;

	var enemySpawn : Enemy;
	var rEnemySpawn : SecondEnemy;

	public function new()
	{
		super();
	}

	public function onLoad():Void
	{
	}
	public function onDestroy():Void
	{
	}
	public function deleteLevel():Void
	{
	}

}