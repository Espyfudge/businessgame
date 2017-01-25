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
		
		className.set ("img/4chartile_test.png", __ASSET__img_4chartile_test_png);
		type.set ("img/4chartile_test.png", AssetType.IMAGE);
		className.set ("img/BusinessChar.png", __ASSET__img_businesschar_png);
		type.set ("img/BusinessChar.png", AssetType.IMAGE);
		className.set ("img/character.png", __ASSET__img_character_png);
		type.set ("img/character.png", AssetType.IMAGE);
		className.set ("img/character_left.png", __ASSET__img_character_left_png);
		type.set ("img/character_left.png", AssetType.IMAGE);
		className.set ("img/character_right.png", __ASSET__img_character_right_png);
		type.set ("img/character_right.png", AssetType.IMAGE);
		className.set ("img/charcater redo.png", __ASSET__img_charcater_redo_png);
		type.set ("img/charcater redo.png", AssetType.IMAGE);
		className.set ("img/Player.png", __ASSET__img_player_png);
		type.set ("img/Player.png", AssetType.IMAGE);
		className.set ("UI/Button_Down.png", __ASSET__ui_button_down_png);
		type.set ("UI/Button_Down.png", AssetType.IMAGE);
		className.set ("UI/Button_Over.png", __ASSET__ui_button_over_png);
		type.set ("UI/Button_Over.png", AssetType.IMAGE);
		className.set ("UI/Button_Up.png", __ASSET__ui_button_up_png);
		type.set ("UI/Button_Up.png", AssetType.IMAGE);
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
		
		
		#elseif html5
		
		var id;
		id = "img/4chartile_test.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/BusinessChar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/character.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/character_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/character_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/charcater redo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Player.png";
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
		
		className.set ("img/4chartile_test.png", __ASSET__img_4chartile_test_png);
		type.set ("img/4chartile_test.png", AssetType.IMAGE);
		
		className.set ("img/BusinessChar.png", __ASSET__img_businesschar_png);
		type.set ("img/BusinessChar.png", AssetType.IMAGE);
		
		className.set ("img/character.png", __ASSET__img_character_png);
		type.set ("img/character.png", AssetType.IMAGE);
		
		className.set ("img/character_left.png", __ASSET__img_character_left_png);
		type.set ("img/character_left.png", AssetType.IMAGE);
		
		className.set ("img/character_right.png", __ASSET__img_character_right_png);
		type.set ("img/character_right.png", AssetType.IMAGE);
		
		className.set ("img/charcater redo.png", __ASSET__img_charcater_redo_png);
		type.set ("img/charcater redo.png", AssetType.IMAGE);
		
		className.set ("img/Player.png", __ASSET__img_player_png);
		type.set ("img/Player.png", AssetType.IMAGE);
		
		className.set ("UI/Button_Down.png", __ASSET__ui_button_down_png);
		type.set ("UI/Button_Down.png", AssetType.IMAGE);
		
		className.set ("UI/Button_Over.png", __ASSET__ui_button_over_png);
		type.set ("UI/Button_Over.png", AssetType.IMAGE);
		
		className.set ("UI/Button_Up.png", __ASSET__ui_button_up_png);
		type.set ("UI/Button_Up.png", AssetType.IMAGE);
		
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

@:keep @:bind #if display private #end class __ASSET__img_4chartile_test_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_businesschar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_character_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_character_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_character_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_charcater_redo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_button_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_button_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_button_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_icon_mute_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_icon_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_icon_quit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_menuscreen_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_menuscreen_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_menuscreen_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5



















#else



#if (windows || mac || linux || cpp)


@:image("assets/img/4chartile_test.png") #if display private #end class __ASSET__img_4chartile_test_png extends lime.graphics.Image {}
@:image("assets/img/BusinessChar.png") #if display private #end class __ASSET__img_businesschar_png extends lime.graphics.Image {}
@:image("assets/img/character.png") #if display private #end class __ASSET__img_character_png extends lime.graphics.Image {}
@:image("assets/img/character_left.png") #if display private #end class __ASSET__img_character_left_png extends lime.graphics.Image {}
@:image("assets/img/character_right.png") #if display private #end class __ASSET__img_character_right_png extends lime.graphics.Image {}
@:image("assets/img/charcater redo.png") #if display private #end class __ASSET__img_charcater_redo_png extends lime.graphics.Image {}
@:image("assets/img/Player.png") #if display private #end class __ASSET__img_player_png extends lime.graphics.Image {}
@:image("assets/UI/Button_Down.png") #if display private #end class __ASSET__ui_button_down_png extends lime.graphics.Image {}
@:image("assets/UI/Button_Over.png") #if display private #end class __ASSET__ui_button_over_png extends lime.graphics.Image {}
@:image("assets/UI/Button_Up.png") #if display private #end class __ASSET__ui_button_up_png extends lime.graphics.Image {}
@:image("assets/UI/Icon_Mute.png") #if display private #end class __ASSET__ui_icon_mute_png extends lime.graphics.Image {}
@:image("assets/UI/Icon_Play.png") #if display private #end class __ASSET__ui_icon_play_png extends lime.graphics.Image {}
@:image("assets/UI/Icon_Quit.png") #if display private #end class __ASSET__ui_icon_quit_png extends lime.graphics.Image {}
@:image("assets/UI/MenuScreen_0.png") #if display private #end class __ASSET__ui_menuscreen_0_png extends lime.graphics.Image {}
@:image("assets/UI/MenuScreen_1.png") #if display private #end class __ASSET__ui_menuscreen_1_png extends lime.graphics.Image {}
@:image("assets/UI/MenuScreen_2.png") #if display private #end class __ASSET__ui_menuscreen_2_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)

#end

#end
