package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.Log;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import haxe.io.Path;
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	#if (windows && !cs)
	private var rootPath = FileSystem.absolutePath (Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
	#else
	private var rootPath = "";
	#end
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/bCard.png", __ASSET__assets_bcard_png);
		type.set ("assets/bCard.png", AssetType.IMAGE);
		className.set ("assets/character.png", __ASSET__assets_character_png);
		type.set ("assets/character.png", AssetType.IMAGE);
		className.set ("assets/CharacterSheet.png", __ASSET__assets_charactersheet_png);
		type.set ("assets/CharacterSheet.png", AssetType.IMAGE);
		className.set ("assets/CharacterSheet.xml", __ASSET__assets_charactersheet_xml);
		type.set ("assets/CharacterSheet.xml", AssetType.TEXT);
		className.set ("assets/character_left.png", __ASSET__assets_character_left_png);
		type.set ("assets/character_left.png", AssetType.IMAGE);
		className.set ("assets/character_right.png", __ASSET__assets_character_right_png);
		type.set ("assets/character_right.png", AssetType.IMAGE);
		className.set ("assets/charcater redo.png", __ASSET__assets_charcater_redo_png);
		type.set ("assets/charcater redo.png", AssetType.IMAGE);
		className.set ("assets/EnemySheet.png", __ASSET__assets_enemysheet_png);
		type.set ("assets/EnemySheet.png", AssetType.IMAGE);
		className.set ("assets/EnemySheet.xml", __ASSET__assets_enemysheet_xml);
		type.set ("assets/EnemySheet.xml", AssetType.TEXT);
		className.set ("assets/enemy_still_left.png", __ASSET__assets_enemy_still_left_png);
		type.set ("assets/enemy_still_left.png", AssetType.IMAGE);
		className.set ("assets/MenuScreen.png", __ASSET__assets_menuscreen_png);
		type.set ("assets/MenuScreen.png", AssetType.IMAGE);
		className.set ("assets/playButton.png", __ASSET__assets_playbutton_png);
		type.set ("assets/playButton.png", AssetType.IMAGE);
		className.set ("assets/Player.png", __ASSET__assets_player_png);
		type.set ("assets/Player.png", AssetType.IMAGE);
		className.set ("assets/SecondEnemySheet.png", __ASSET__assets_secondenemysheet_png);
		type.set ("assets/SecondEnemySheet.png", AssetType.IMAGE);
		className.set ("assets/Sounds/Attack.mp3", __ASSET__assets_sounds_attack_mp3);
		type.set ("assets/Sounds/Attack.mp3", AssetType.MUSIC);
		className.set ("assets/Sounds/Blip_Select.mp3", __ASSET__assets_sounds_blip_select_mp3);
		type.set ("assets/Sounds/Blip_Select.mp3", AssetType.MUSIC);
		className.set ("assets/Sounds/Game_Theme.mp3", __ASSET__assets_sounds_game_theme_mp3);
		type.set ("assets/Sounds/Game_Theme.mp3", AssetType.MUSIC);
		className.set ("assets/Sounds/Hit.mp3", __ASSET__assets_sounds_hit_mp3);
		type.set ("assets/Sounds/Hit.mp3", AssetType.MUSIC);
		className.set ("assets/Sounds/Hit_enemies.mp3", __ASSET__assets_sounds_hit_enemies_mp3);
		type.set ("assets/Sounds/Hit_enemies.mp3", AssetType.MUSIC);
		className.set ("assets/Sounds/Jump.mp3", __ASSET__assets_sounds_jump_mp3);
		type.set ("assets/Sounds/Jump.mp3", AssetType.MUSIC);
		className.set ("assets/Sounds/Menu_Theme.mp3", __ASSET__assets_sounds_menu_theme_mp3);
		type.set ("assets/Sounds/Menu_Theme.mp3", AssetType.MUSIC);
		className.set ("assets/tempbackground.png", __ASSET__assets_tempbackground_png);
		type.set ("assets/tempbackground.png", AssetType.IMAGE);
		className.set ("assets/tempbackground1.png", __ASSET__assets_tempbackground1_png);
		type.set ("assets/tempbackground1.png", AssetType.IMAGE);
		className.set ("assets/UI/Button_Down.png", __ASSET__assets_ui_button_down_png);
		type.set ("assets/UI/Button_Down.png", AssetType.IMAGE);
		className.set ("assets/UI/Button_Over.png", __ASSET__assets_ui_button_over_png);
		type.set ("assets/UI/Button_Over.png", AssetType.IMAGE);
		className.set ("assets/UI/Button_Up.png", __ASSET__assets_ui_button_up_png);
		type.set ("assets/UI/Button_Up.png", AssetType.IMAGE);
		className.set ("assets/UI/GameOver.png", __ASSET__assets_ui_gameover_png);
		type.set ("assets/UI/GameOver.png", AssetType.IMAGE);
		className.set ("assets/UI/HPempty.png", __ASSET__assets_ui_hpempty_png);
		type.set ("assets/UI/HPempty.png", AssetType.IMAGE);
		className.set ("assets/UI/HPfill.png", __ASSET__assets_ui_hpfill_png);
		type.set ("assets/UI/HPfill.png", AssetType.IMAGE);
		className.set ("assets/UI/HPhalf.png", __ASSET__assets_ui_hphalf_png);
		type.set ("assets/UI/HPhalf.png", AssetType.IMAGE);
		className.set ("assets/UI/Icon_Mute.png", __ASSET__assets_ui_icon_mute_png);
		type.set ("assets/UI/Icon_Mute.png", AssetType.IMAGE);
		className.set ("assets/UI/Icon_Play.png", __ASSET__assets_ui_icon_play_png);
		type.set ("assets/UI/Icon_Play.png", AssetType.IMAGE);
		className.set ("assets/UI/Icon_Quit.png", __ASSET__assets_ui_icon_quit_png);
		type.set ("assets/UI/Icon_Quit.png", AssetType.IMAGE);
		className.set ("assets/UI/MenuScreen_0.png", __ASSET__assets_ui_menuscreen_0_png);
		type.set ("assets/UI/MenuScreen_0.png", AssetType.IMAGE);
		className.set ("assets/UI/MenuScreen_1.png", __ASSET__assets_ui_menuscreen_1_png);
		type.set ("assets/UI/MenuScreen_1.png", AssetType.IMAGE);
		className.set ("assets/UI/MenuScreen_2.png", __ASSET__assets_ui_menuscreen_2_png);
		type.set ("assets/UI/MenuScreen_2.png", AssetType.IMAGE);
		className.set ("UI/Button_Down.png", __ASSET__ui_button_down_png);
		type.set ("UI/Button_Down.png", AssetType.IMAGE);
		className.set ("UI/Button_Over.png", __ASSET__ui_button_over_png);
		type.set ("UI/Button_Over.png", AssetType.IMAGE);
		className.set ("UI/Button_Up.png", __ASSET__ui_button_up_png);
		type.set ("UI/Button_Up.png", AssetType.IMAGE);
		className.set ("UI/GameOver.png", __ASSET__ui_gameover_png);
		type.set ("UI/GameOver.png", AssetType.IMAGE);
		className.set ("UI/HPempty.png", __ASSET__ui_hpempty_png);
		type.set ("UI/HPempty.png", AssetType.IMAGE);
		className.set ("UI/HPfill.png", __ASSET__ui_hpfill_png);
		type.set ("UI/HPfill.png", AssetType.IMAGE);
		className.set ("UI/HPhalf.png", __ASSET__ui_hphalf_png);
		type.set ("UI/HPhalf.png", AssetType.IMAGE);
		className.set ("UI/Icon_Mute.png", __ASSET__ui_icon_mute_png);
		type.set ("UI/Icon_Mute.png", AssetType.IMAGE);
		className.set ("UI/Icon_Play.png", __ASSET__ui_icon_play_png);
		type.set ("UI/Icon_Play.png", AssetType.IMAGE);
		className.set ("UI/Icon_Quit.png", __ASSET__ui_icon_quit_png);
		type.set ("UI/Icon_Quit.png", AssetType.IMAGE);
		className.set ("UI/MenuScreen_0.png", __ASSET__ui_menuscreen_0_png);
		type.set ("UI/MenuScreen_0.png", AssetType.IMAGE);
		className.set ("UI/MenuScreen_1.png", __ASSET__ui_menuscreen_1_png);
		type.set ("UI/MenuScreen_1.png", AssetType.IMAGE);
		className.set ("UI/MenuScreen_2.png", __ASSET__ui_menuscreen_2_png);
		type.set ("UI/MenuScreen_2.png", AssetType.IMAGE);
		className.set ("Sounds/Attack.mp3", __ASSET__sounds_attack_mp3);
		type.set ("Sounds/Attack.mp3", AssetType.MUSIC);
		className.set ("Sounds/Blip_Select.mp3", __ASSET__sounds_blip_select_mp3);
		type.set ("Sounds/Blip_Select.mp3", AssetType.MUSIC);
		className.set ("Sounds/Game_Theme.mp3", __ASSET__sounds_game_theme_mp3);
		type.set ("Sounds/Game_Theme.mp3", AssetType.MUSIC);
		className.set ("Sounds/Hit.mp3", __ASSET__sounds_hit_mp3);
		type.set ("Sounds/Hit.mp3", AssetType.MUSIC);
		className.set ("Sounds/Hit_enemies.mp3", __ASSET__sounds_hit_enemies_mp3);
		type.set ("Sounds/Hit_enemies.mp3", AssetType.MUSIC);
		className.set ("Sounds/Jump.mp3", __ASSET__sounds_jump_mp3);
		type.set ("Sounds/Jump.mp3", AssetType.MUSIC);
		className.set ("Sounds/Menu_Theme.mp3", __ASSET__sounds_menu_theme_mp3);
		type.set ("Sounds/Menu_Theme.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/bCard.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/character.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/CharacterSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/CharacterSheet.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/character_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/character_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/charcater redo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/EnemySheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/EnemySheet.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/enemy_still_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/MenuScreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/playButton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/Player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/SecondEnemySheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/Sounds/Attack.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Sounds/Blip_Select.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Sounds/Game_Theme.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Sounds/Hit.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Sounds/Hit_enemies.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Sounds/Jump.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Sounds/Menu_Theme.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/tempbackground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/tempbackground1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/Button_Down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/Button_Over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/Button_Up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/GameOver.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/HPempty.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/HPfill.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/HPhalf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/Icon_Mute.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/Icon_Play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/Icon_Quit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/MenuScreen_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/MenuScreen_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/UI/MenuScreen_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/Button_Down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/Button_Over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/Button_Up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/GameOver.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/HPempty.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/HPfill.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/HPhalf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/Icon_Mute.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/Icon_Play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/Icon_Quit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/MenuScreen_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/MenuScreen_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "UI/MenuScreen_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "Sounds/Attack.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "Sounds/Blip_Select.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "Sounds/Game_Theme.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "Sounds/Hit.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "Sounds/Hit_enemies.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "Sounds/Jump.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "Sounds/Menu_Theme.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/bCard.png", __ASSET__assets_bcard_png);
		type.set ("assets/bCard.png", AssetType.IMAGE);
		
		className.set ("assets/character.png", __ASSET__assets_character_png);
		type.set ("assets/character.png", AssetType.IMAGE);
		
		className.set ("assets/CharacterSheet.png", __ASSET__assets_charactersheet_png);
		type.set ("assets/CharacterSheet.png", AssetType.IMAGE);
		
		className.set ("assets/CharacterSheet.xml", __ASSET__assets_charactersheet_xml);
		type.set ("assets/CharacterSheet.xml", AssetType.TEXT);
		
		className.set ("assets/character_left.png", __ASSET__assets_character_left_png);
		type.set ("assets/character_left.png", AssetType.IMAGE);
		
		className.set ("assets/character_right.png", __ASSET__assets_character_right_png);
		type.set ("assets/character_right.png", AssetType.IMAGE);
		
		className.set ("assets/charcater redo.png", __ASSET__assets_charcater_redo_png);
		type.set ("assets/charcater redo.png", AssetType.IMAGE);
		
		className.set ("assets/EnemySheet.png", __ASSET__assets_enemysheet_png);
		type.set ("assets/EnemySheet.png", AssetType.IMAGE);
		
		className.set ("assets/EnemySheet.xml", __ASSET__assets_enemysheet_xml);
		type.set ("assets/EnemySheet.xml", AssetType.TEXT);
		
		className.set ("assets/enemy_still_left.png", __ASSET__assets_enemy_still_left_png);
		type.set ("assets/enemy_still_left.png", AssetType.IMAGE);
		
		className.set ("assets/MenuScreen.png", __ASSET__assets_menuscreen_png);
		type.set ("assets/MenuScreen.png", AssetType.IMAGE);
		
		className.set ("assets/playButton.png", __ASSET__assets_playbutton_png);
		type.set ("assets/playButton.png", AssetType.IMAGE);
		
		className.set ("assets/Player.png", __ASSET__assets_player_png);
		type.set ("assets/Player.png", AssetType.IMAGE);
		
		className.set ("assets/SecondEnemySheet.png", __ASSET__assets_secondenemysheet_png);
		type.set ("assets/SecondEnemySheet.png", AssetType.IMAGE);
		
		className.set ("assets/Sounds/Attack.mp3", __ASSET__assets_sounds_attack_mp3);
		type.set ("assets/Sounds/Attack.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sounds/Blip_Select.mp3", __ASSET__assets_sounds_blip_select_mp3);
		type.set ("assets/Sounds/Blip_Select.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sounds/Game_Theme.mp3", __ASSET__assets_sounds_game_theme_mp3);
		type.set ("assets/Sounds/Game_Theme.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sounds/Hit.mp3", __ASSET__assets_sounds_hit_mp3);
		type.set ("assets/Sounds/Hit.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sounds/Hit_enemies.mp3", __ASSET__assets_sounds_hit_enemies_mp3);
		type.set ("assets/Sounds/Hit_enemies.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sounds/Jump.mp3", __ASSET__assets_sounds_jump_mp3);
		type.set ("assets/Sounds/Jump.mp3", AssetType.MUSIC);
		
		className.set ("assets/Sounds/Menu_Theme.mp3", __ASSET__assets_sounds_menu_theme_mp3);
		type.set ("assets/Sounds/Menu_Theme.mp3", AssetType.MUSIC);
		
		className.set ("assets/tempbackground.png", __ASSET__assets_tempbackground_png);
		type.set ("assets/tempbackground.png", AssetType.IMAGE);
		
		className.set ("assets/tempbackground1.png", __ASSET__assets_tempbackground1_png);
		type.set ("assets/tempbackground1.png", AssetType.IMAGE);
		
		className.set ("assets/UI/Button_Down.png", __ASSET__assets_ui_button_down_png);
		type.set ("assets/UI/Button_Down.png", AssetType.IMAGE);
		
		className.set ("assets/UI/Button_Over.png", __ASSET__assets_ui_button_over_png);
		type.set ("assets/UI/Button_Over.png", AssetType.IMAGE);
		
		className.set ("assets/UI/Button_Up.png", __ASSET__assets_ui_button_up_png);
		type.set ("assets/UI/Button_Up.png", AssetType.IMAGE);
		
		className.set ("assets/UI/GameOver.png", __ASSET__assets_ui_gameover_png);
		type.set ("assets/UI/GameOver.png", AssetType.IMAGE);
		
		className.set ("assets/UI/HPempty.png", __ASSET__assets_ui_hpempty_png);
		type.set ("assets/UI/HPempty.png", AssetType.IMAGE);
		
		className.set ("assets/UI/HPfill.png", __ASSET__assets_ui_hpfill_png);
		type.set ("assets/UI/HPfill.png", AssetType.IMAGE);
		
		className.set ("assets/UI/HPhalf.png", __ASSET__assets_ui_hphalf_png);
		type.set ("assets/UI/HPhalf.png", AssetType.IMAGE);
		
		className.set ("assets/UI/Icon_Mute.png", __ASSET__assets_ui_icon_mute_png);
		type.set ("assets/UI/Icon_Mute.png", AssetType.IMAGE);
		
		className.set ("assets/UI/Icon_Play.png", __ASSET__assets_ui_icon_play_png);
		type.set ("assets/UI/Icon_Play.png", AssetType.IMAGE);
		
		className.set ("assets/UI/Icon_Quit.png", __ASSET__assets_ui_icon_quit_png);
		type.set ("assets/UI/Icon_Quit.png", AssetType.IMAGE);
		
		className.set ("assets/UI/MenuScreen_0.png", __ASSET__assets_ui_menuscreen_0_png);
		type.set ("assets/UI/MenuScreen_0.png", AssetType.IMAGE);
		
		className.set ("assets/UI/MenuScreen_1.png", __ASSET__assets_ui_menuscreen_1_png);
		type.set ("assets/UI/MenuScreen_1.png", AssetType.IMAGE);
		
		className.set ("assets/UI/MenuScreen_2.png", __ASSET__assets_ui_menuscreen_2_png);
		type.set ("assets/UI/MenuScreen_2.png", AssetType.IMAGE);
		
		className.set ("UI/Button_Down.png", __ASSET__ui_button_down_png);
		type.set ("UI/Button_Down.png", AssetType.IMAGE);
		
		className.set ("UI/Button_Over.png", __ASSET__ui_button_over_png);
		type.set ("UI/Button_Over.png", AssetType.IMAGE);
		
		className.set ("UI/Button_Up.png", __ASSET__ui_button_up_png);
		type.set ("UI/Button_Up.png", AssetType.IMAGE);
		
		className.set ("UI/GameOver.png", __ASSET__ui_gameover_png);
		type.set ("UI/GameOver.png", AssetType.IMAGE);
		
		className.set ("UI/HPempty.png", __ASSET__ui_hpempty_png);
		type.set ("UI/HPempty.png", AssetType.IMAGE);
		
		className.set ("UI/HPfill.png", __ASSET__ui_hpfill_png);
		type.set ("UI/HPfill.png", AssetType.IMAGE);
		
		className.set ("UI/HPhalf.png", __ASSET__ui_hphalf_png);
		type.set ("UI/HPhalf.png", AssetType.IMAGE);
		
		className.set ("UI/Icon_Mute.png", __ASSET__ui_icon_mute_png);
		type.set ("UI/Icon_Mute.png", AssetType.IMAGE);
		
		className.set ("UI/Icon_Play.png", __ASSET__ui_icon_play_png);
		type.set ("UI/Icon_Play.png", AssetType.IMAGE);
		
		className.set ("UI/Icon_Quit.png", __ASSET__ui_icon_quit_png);
		type.set ("UI/Icon_Quit.png", AssetType.IMAGE);
		
		className.set ("UI/MenuScreen_0.png", __ASSET__ui_menuscreen_0_png);
		type.set ("UI/MenuScreen_0.png", AssetType.IMAGE);
		
		className.set ("UI/MenuScreen_1.png", __ASSET__ui_menuscreen_1_png);
		type.set ("UI/MenuScreen_1.png", AssetType.IMAGE);
		
		className.set ("UI/MenuScreen_2.png", __ASSET__ui_menuscreen_2_png);
		type.set ("UI/MenuScreen_2.png", AssetType.IMAGE);
		
		className.set ("Sounds/Attack.mp3", __ASSET__sounds_attack_mp3);
		type.set ("Sounds/Attack.mp3", AssetType.MUSIC);
		
		className.set ("Sounds/Blip_Select.mp3", __ASSET__sounds_blip_select_mp3);
		type.set ("Sounds/Blip_Select.mp3", AssetType.MUSIC);
		
		className.set ("Sounds/Game_Theme.mp3", __ASSET__sounds_game_theme_mp3);
		type.set ("Sounds/Game_Theme.mp3", AssetType.MUSIC);
		
		className.set ("Sounds/Hit.mp3", __ASSET__sounds_hit_mp3);
		type.set ("Sounds/Hit.mp3", AssetType.MUSIC);
		
		className.set ("Sounds/Hit_enemies.mp3", __ASSET__sounds_hit_enemies_mp3);
		type.set ("Sounds/Hit_enemies.mp3", AssetType.MUSIC);
		
		className.set ("Sounds/Jump.mp3", __ASSET__sounds_jump_mp3);
		type.set ("Sounds/Jump.mp3", AssetType.MUSIC);
		
		className.set ("Sounds/Menu_Theme.mp3", __ASSET__sounds_menu_theme_mp3);
		type.set ("Sounds/Menu_Theme.mp3", AssetType.MUSIC);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return Preloader.audioBuffers.get (path.get (id));
		
		#else
		
		if (className.exists (id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (rootPath + path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (rootPath + path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (rootPath + path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (rootPath + path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		#if flash
		
		return className.exists (id);
		
		#elseif html5
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		return switch (requestedType) {
			
			case FONT:
				
				className.exists (id);
			
			case IMAGE:
				
				Preloader.images.exists (path.get (id));
			
			case MUSIC, SOUND:
				
				Preloader.audioBuffers.exists (path.get (id));
			
			default:
				
				Preloader.loaders.exists (path.get (id));
			
		}
		
		#else
		
		return true;
		
		#end
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		if (Assets.isLocal (id)) {
			
			promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
			
		} else if (path.exists (id)) {
			
			promise.completeWith (AudioBuffer.loadFromFile (path.get (id)));
			
		} else {
			
			promise.error (null);
			
		}
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (loader.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (loader.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				Log.warn ("Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			Log.warn ('Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_bcard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_character_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_charactersheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_charactersheet_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_character_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_character_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_charcater_redo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_enemysheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_enemysheet_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_enemy_still_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_menuscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_playbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_secondenemysheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attack_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_blip_select_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_game_theme_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_enemies_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_theme_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_tempbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_tempbackground1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_button_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_button_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_button_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_hpempty_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_hpfill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_hphalf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_icon_mute_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_icon_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_icon_quit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_menuscreen_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_menuscreen_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_menuscreen_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_button_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_button_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_button_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_hpempty_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_hpfill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_hphalf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_icon_mute_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_icon_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_icon_quit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_menuscreen_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_menuscreen_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_menuscreen_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__sounds_attack_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__sounds_blip_select_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__sounds_game_theme_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__sounds_hit_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__sounds_hit_enemies_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__sounds_jump_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__sounds_menu_theme_mp3 extends null { }


#elseif html5



























































#else



#if (windows || mac || linux || cpp)


@:image("Assets/bCard.png") #if display private #end class __ASSET__assets_bcard_png extends lime.graphics.Image {}
@:image("Assets/character.png") #if display private #end class __ASSET__assets_character_png extends lime.graphics.Image {}
@:image("Assets/CharacterSheet.png") #if display private #end class __ASSET__assets_charactersheet_png extends lime.graphics.Image {}
@:file("Assets/CharacterSheet.xml") #if display private #end class __ASSET__assets_charactersheet_xml extends lime.utils.Bytes {}
@:image("Assets/character_left.png") #if display private #end class __ASSET__assets_character_left_png extends lime.graphics.Image {}
@:image("Assets/character_right.png") #if display private #end class __ASSET__assets_character_right_png extends lime.graphics.Image {}
@:image("Assets/charcater redo.png") #if display private #end class __ASSET__assets_charcater_redo_png extends lime.graphics.Image {}
@:image("Assets/EnemySheet.png") #if display private #end class __ASSET__assets_enemysheet_png extends lime.graphics.Image {}
@:file("Assets/EnemySheet.xml") #if display private #end class __ASSET__assets_enemysheet_xml extends lime.utils.Bytes {}
@:image("Assets/enemy_still_left.png") #if display private #end class __ASSET__assets_enemy_still_left_png extends lime.graphics.Image {}
@:image("Assets/MenuScreen.png") #if display private #end class __ASSET__assets_menuscreen_png extends lime.graphics.Image {}
@:image("Assets/playButton.png") #if display private #end class __ASSET__assets_playbutton_png extends lime.graphics.Image {}
@:image("Assets/Player.png") #if display private #end class __ASSET__assets_player_png extends lime.graphics.Image {}
@:image("Assets/SecondEnemySheet.png") #if display private #end class __ASSET__assets_secondenemysheet_png extends lime.graphics.Image {}
@:file("Assets/Sounds/Attack.mp3") #if display private #end class __ASSET__assets_sounds_attack_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Blip_Select.mp3") #if display private #end class __ASSET__assets_sounds_blip_select_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Game_Theme.mp3") #if display private #end class __ASSET__assets_sounds_game_theme_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Hit.mp3") #if display private #end class __ASSET__assets_sounds_hit_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Hit_enemies.mp3") #if display private #end class __ASSET__assets_sounds_hit_enemies_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Jump.mp3") #if display private #end class __ASSET__assets_sounds_jump_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Menu_Theme.mp3") #if display private #end class __ASSET__assets_sounds_menu_theme_mp3 extends lime.utils.Bytes {}
@:image("Assets/tempbackground.png") #if display private #end class __ASSET__assets_tempbackground_png extends lime.graphics.Image {}
@:image("Assets/tempbackground1.png") #if display private #end class __ASSET__assets_tempbackground1_png extends lime.graphics.Image {}
@:image("Assets/UI/Button_Down.png") #if display private #end class __ASSET__assets_ui_button_down_png extends lime.graphics.Image {}
@:image("Assets/UI/Button_Over.png") #if display private #end class __ASSET__assets_ui_button_over_png extends lime.graphics.Image {}
@:image("Assets/UI/Button_Up.png") #if display private #end class __ASSET__assets_ui_button_up_png extends lime.graphics.Image {}
@:image("Assets/UI/GameOver.png") #if display private #end class __ASSET__assets_ui_gameover_png extends lime.graphics.Image {}
@:image("Assets/UI/HPempty.png") #if display private #end class __ASSET__assets_ui_hpempty_png extends lime.graphics.Image {}
@:image("Assets/UI/HPfill.png") #if display private #end class __ASSET__assets_ui_hpfill_png extends lime.graphics.Image {}
@:image("Assets/UI/HPhalf.png") #if display private #end class __ASSET__assets_ui_hphalf_png extends lime.graphics.Image {}
@:image("Assets/UI/Icon_Mute.png") #if display private #end class __ASSET__assets_ui_icon_mute_png extends lime.graphics.Image {}
@:image("Assets/UI/Icon_Play.png") #if display private #end class __ASSET__assets_ui_icon_play_png extends lime.graphics.Image {}
@:image("Assets/UI/Icon_Quit.png") #if display private #end class __ASSET__assets_ui_icon_quit_png extends lime.graphics.Image {}
@:image("Assets/UI/MenuScreen_0.png") #if display private #end class __ASSET__assets_ui_menuscreen_0_png extends lime.graphics.Image {}
@:image("Assets/UI/MenuScreen_1.png") #if display private #end class __ASSET__assets_ui_menuscreen_1_png extends lime.graphics.Image {}
@:image("Assets/UI/MenuScreen_2.png") #if display private #end class __ASSET__assets_ui_menuscreen_2_png extends lime.graphics.Image {}
@:image("Assets/UI/Button_Down.png") #if display private #end class __ASSET__ui_button_down_png extends lime.graphics.Image {}
@:image("Assets/UI/Button_Over.png") #if display private #end class __ASSET__ui_button_over_png extends lime.graphics.Image {}
@:image("Assets/UI/Button_Up.png") #if display private #end class __ASSET__ui_button_up_png extends lime.graphics.Image {}
@:image("Assets/UI/GameOver.png") #if display private #end class __ASSET__ui_gameover_png extends lime.graphics.Image {}
@:image("Assets/UI/HPempty.png") #if display private #end class __ASSET__ui_hpempty_png extends lime.graphics.Image {}
@:image("Assets/UI/HPfill.png") #if display private #end class __ASSET__ui_hpfill_png extends lime.graphics.Image {}
@:image("Assets/UI/HPhalf.png") #if display private #end class __ASSET__ui_hphalf_png extends lime.graphics.Image {}
@:image("Assets/UI/Icon_Mute.png") #if display private #end class __ASSET__ui_icon_mute_png extends lime.graphics.Image {}
@:image("Assets/UI/Icon_Play.png") #if display private #end class __ASSET__ui_icon_play_png extends lime.graphics.Image {}
@:image("Assets/UI/Icon_Quit.png") #if display private #end class __ASSET__ui_icon_quit_png extends lime.graphics.Image {}
@:image("Assets/UI/MenuScreen_0.png") #if display private #end class __ASSET__ui_menuscreen_0_png extends lime.graphics.Image {}
@:image("Assets/UI/MenuScreen_1.png") #if display private #end class __ASSET__ui_menuscreen_1_png extends lime.graphics.Image {}
@:image("Assets/UI/MenuScreen_2.png") #if display private #end class __ASSET__ui_menuscreen_2_png extends lime.graphics.Image {}
@:file("Assets/Sounds/Attack.mp3") #if display private #end class __ASSET__sounds_attack_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Blip_Select.mp3") #if display private #end class __ASSET__sounds_blip_select_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Game_Theme.mp3") #if display private #end class __ASSET__sounds_game_theme_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Hit.mp3") #if display private #end class __ASSET__sounds_hit_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Hit_enemies.mp3") #if display private #end class __ASSET__sounds_hit_enemies_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Jump.mp3") #if display private #end class __ASSET__sounds_jump_mp3 extends lime.utils.Bytes {}
@:file("Assets/Sounds/Menu_Theme.mp3") #if display private #end class __ASSET__sounds_menu_theme_mp3 extends lime.utils.Bytes {}



#end
#end

#if (openfl && !flash)

#end

#end
