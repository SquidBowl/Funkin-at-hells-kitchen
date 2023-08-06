package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxText;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.display.FlxBackdrop;

class DramaState extends MusicBeatState 
{
    var warning:FlxText;
    var background:FlxSprite;
    var customTransition:FlxTransitionableState;

    override function create()
    {
        // Set up background
		var stars:FlxBackdrop = new FlxBackdrop(Paths.image('gallery/background'), XY, FlxG.random.int(0, 0), FlxG.random.int(0, 0));
		stars.scrollFactor.set(0.3, 0.3);
		stars.velocity.set(10, 0);
		add(stars);

        // Set up checkered
		var check:FlxBackdrop = new FlxBackdrop(Paths.image('gallery/checkered'), XY, FlxG.random.int(0, 0), FlxG.random.int(0, 0));
		check.scrollFactor.set(0.3, 0.3);
		check.velocity.set(-10, 0);
		add(check);

        //Setup the bars
        background = new FlxSprite(10, 50).loadGraphic(Paths.image("gallery/barz"));
        background.setGraphicSize(Std.int(background.width * 1));
        background.screenCenter();
        add(background);

        warning = new FlxText(800, 100, 800, "Hey Dingus\nThanks for downloading the mod\nIt means a lot to the devs\n-The Nut Cracker in the Walls", 50);
        warning.scrollFactor.set();
        warning.screenCenter();
        warning.y = 230;
        warning.alignment = CENTER;
        warning.setFormat(Paths.font("goodbyeDespair.ttf"), 48);
        add(warning);

        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        if (controls.BACK)
        {
            FlxTransitionableState.skipNextTransIn = FlxTransitionableState.skipNextTransOut = false;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
        }
    }

    override public function destroy():Void {
        // Cleanup code here
        super.destroy();
    }
}
