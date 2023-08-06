package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import sys.io.File;
import flixel.util.FlxColor;
import flixel.FlxObject;

class MainMenuState extends MusicBeatState 
{
    // Variables
    var storymode: FlxSprite;
    var freeplay: FlxSprite;
    var credits: FlxSprite;
    var options: FlxSprite;
    var menubg:FlxSprite;

    override public function create():Void {

        //Systemm Shit
        Paths.clearStoredMemory();
        Paths.clearUnusedMemory();

        FlxG.mouse.visible = true;

        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;

        // Visuals and Buttons;
        
        menubg = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/background'));
		menubg.antialiasing = ClientPrefs.globalAntialiasing;
        menubg.screenCenter();
		add(menubg);

        menubg = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/table'));
		menubg.antialiasing = ClientPrefs.globalAntialiasing;
        menubg.screenCenter();
		add(menubg);

        storymode = new FlxSprite(350, 300);
        storymode.frames = Paths.getSparrowAtlas('menus/mainmenu/buttons/storymode');
        storymode.animation.addByPrefix('storymode', "storymode", 8);
        storymode.animation.play('storymode');
        storymode.updateHitbox();
        // Calculate the center coordinates
        var centerX:Float = FlxG.width / 2 - storymode.width / 2;
        var centerY:Float = FlxG.height / 2 - storymode.height / 2;
        add(storymode);

        // Position options
        options = new FlxSprite(850, 300);
        options.frames = Paths.getSparrowAtlas('menus/mainmenu/buttons/options');
        options.animation.addByPrefix('options', "options", 8);
        options.animation.play('options');
        options.updateHitbox();
        add(options);

        // Position freeplay 50 pixels to the left of storymode
        freeplay = new FlxSprite(100, 300);
        freeplay.frames = Paths.getSparrowAtlas('menus/mainmenu/buttons/freeplay');
        freeplay.animation.addByPrefix('freeplay', "freeplay", 8);
        freeplay.animation.play('freeplay');
        freeplay.updateHitbox();
        add(freeplay);

        // Calculate the position of credits at the top left corner
        credits = new FlxSprite(0, 100);  // Adjust the coordinates
        credits.frames = Paths.getSparrowAtlas('menus/mainmenu/buttons/credits');
        credits.animation.addByPrefix('credits', "credits", 8);
        credits.animation.play('credits');
        credits.updateHitbox();
        credits.x = 0;  // Position at the left edge
        credits.y = 0;  // Position at the top edge
        add(credits);        

        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];     
    }

    override public function update(elapsed: Float):Void {
        super.update(elapsed);

        if (controls.BACK) {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new TitleState());
        }
        if (FlxG.mouse.overlaps(storymode)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(storymode)) {
            FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);     
				PlayState.storyPlaylist = ['fried'];
				PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + '-hard', PlayState.storyPlaylist[0].toLowerCase());
				PlayState.campaignScore = 0;
				PlayState.campaignMisses = 0;
				LoadingState.loadAndSwitchState(new PlayState(), true);
				FreeplayState.destroyFreeplayVocals();
                PlayState.isStoryMode = true;
        }
        if (FlxG.mouse.overlaps(freeplay)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(freeplay)) {
            FlxG.sound.play(Paths.sound('wtf'), 0.7);
        }
        if (FlxG.mouse.overlaps(credits)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(credits)) {
            MusicBeatState.switchState(new CustomCreditState());
		    FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);                          
        }
        if (FlxG.mouse.overlaps(options)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(options)) {
			MusicBeatState.switchState(new options.OptionsState());
		    FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);                  
        }
        // ... rest of your code ...
    }
}