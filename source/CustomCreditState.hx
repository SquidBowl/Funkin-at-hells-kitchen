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
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxColor;
import sys.io.File;
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;

class CustomCreditState extends MusicBeatState 
{
    // Variables
    var name: FlxText;
    var quote: FlxText;
    var descText: FlxText;       
    var tink: FlxSprite;
    var stick: FlxSprite;
    var cheese: FlxSprite;
    var menubg: FlxSprite;
    var table: FlxSprite;    
    var bars: FlxSprite;
    var shader: FlxRuntimeShader;    

    override public function create():Void {
        var textWidth: Int = 250;
        var screenWidth: Int = FlxG.width;
        var screenHeight: Int = FlxG.height;
        var textHeight: Int = 50;

        Paths.clearStoredMemory();
        Paths.clearUnusedMemory();

        FlxG.mouse.visible = true;

        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;

        menubg = new FlxSprite().loadGraphic(Paths.image('menus/credits/background'));
        menubg.antialiasing = ClientPrefs.globalAntialiasing;
        menubg.alpha = 0.6;
        menubg.screenCenter();
        add(menubg);

        // Portraits
        tink = new FlxSprite(100, 0);
        tink.frames = Paths.getSparrowAtlas('menus/credits/portraits/tink');
        tink.animation.addByPrefix('tink', "tink", 8);
        tink.animation.play('tink');
        tink.updateHitbox();
        add(tink);

        stick = new FlxSprite(350, 0);
        stick.frames = Paths.getSparrowAtlas('menus/credits/portraits/stick');
        stick.animation.addByPrefix('stick', "stick", 8);
        stick.animation.play('stick');
        stick.updateHitbox();
        add(stick);

        cheese = new FlxSprite(850, 0);
        cheese.frames = Paths.getSparrowAtlas('menus/credits/portraits/cheese');
        cheese.animation.addByPrefix('cheese', "cheese", 8);
        cheese.animation.play('cheese');
        cheese.updateHitbox();
        add(cheese);

        // Visual Shit
        table = new FlxSprite().loadGraphic(Paths.image('menus/credits/table'));
        table.antialiasing = ClientPrefs.globalAntialiasing;
        table.screenCenter();
        add(table);

        super.create();

        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];
    }

    override public function update(elapsed: Float): Void {
        super.update(elapsed);

        if (controls.BACK) {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
        }
        
        // tink gimmick
        if (FlxG.mouse.overlaps(tink)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(tink)) {
            CoolUtil.browserLoad('https://www.youtube.com/channel/UCcmSo3U6ob1C04bPz2wSNtQ');
        }
        // stick gimmick
        if (FlxG.mouse.overlaps(stick)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(stick)) {
            CoolUtil.browserLoad('https://youtube.com/@stick-pi');
        // cheese gimmick
        if (FlxG.mouse.overlaps(cheese)) {
        }
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(cheese)) {
            CoolUtil.browserLoad('https://youtube.com/@thecheesepants');            
        }
    }
}

    override public function destroy():Void {
        // Cleanup code here

        super.destroy();
    }
}
