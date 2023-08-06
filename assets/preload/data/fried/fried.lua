function onCreate()
	makeLuaSprite('black','black', 0, 0)
	setObjectCamera("black", "other")
	addLuaSprite('black', false)	
end

function onBeatHit()
	if curBeat == 1 then
		doTweenAlpha('black', 'black', 0.1, 12, 'linear')  
		elseif curBeat == 392 then
		doTweenAlpha('black', 'black', 1.0, 16, 'linear')  
	end
end