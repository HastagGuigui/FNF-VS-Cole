--side note: LuaText is just LuaSprite but with a "text" propety

-- this gets called starts when the level loads.
function start(song) -- arguments, the song name
end

function songStart()
    for i=0,7,1 do
        local receptor = _G['receptor_'..i]
        receptor.alpha = 0
    end
    makeText("04b03", "", "10;220", 32, "firstText")
    makeText("04b03", "", "-70;220", 32, "secondText")
    makeText("04b03", "", "-200;210", 32, "thirdText")
end

-- this gets called every frame
function update(elapsed) -- arguments, how long it took to complete a frame
end

-- this gets called every beat
function beatHit(beat) -- arguments, the current beat of the song
    if beat == 1 then
        for i=0,3,1 do
            local receptor = _G['receptor_'..i]
            receptor:tweenAlpha(1,1)
        end
    elseif beat == 5 then
        for i=4,7,1 do
            local receptor = _G['receptor_'..i]
            receptor:tweenAlpha(1,1)
        end
    elseif beat == 15 then 
        Game:changeStage("undefined")
        gf.alpha = 0
        camGame:tweenPos(camGame.x, camGame.y + 100, 1);
    elseif beat == 41 then
        for i=0,3,1 do
            local receptor = _G['receptor_'..i]
            receptor:tweenAlpha(0,0.2)
        end
        for i=4,7,1 do
            local receptor = _G['receptor_'..i]
            receptor:tweenPos(receptor.x-250,receptor.y,0.2)
        end
        camGame:tweenPos(camGame.x, camGame.y - 100, 1);

        makeSprite("white", "white", false)
        white.alpha = 0
        white.x = -300
        white.y = 100

    elseif beat == 47 then
        for i=0,3,1 do
            local receptor = _G['receptor_'..i]
            receptor:tweenAlpha(1,0.2)
        end
        for i=4,7,1 do
            local receptor = _G['receptor_'..i]
            receptor.x = receptor.x+250
        end
        gf.alpha = 1
        Game:changeStage("coleWardDay")
        white.alpha = 1
        white:tweenAlpha(0,1)
        --Game:changeStage("stage")
    elseif beat == 50 then
        white:destroy()
    elseif beat == 81 then
        Game:changeStage("scrollingGrid")
    elseif beat == 111 then
        Game:changeStage("samuraiWard")
    elseif beat == 127 then
        Game:changeStage("coleWardDay")
    elseif beat == 175 then
        Game:changeStage("samuraiWard")
        gf.alpha = 0
    elseif beat == 191 then
        Game:changeStage("undefined")
        boyfriend.alpha = 0
        for i=0,7,1 do
            local receptor = _G['receptor_'..i]
            receptor.alpha = 0
        end
    elseif beat == 195 then
        for i=4,7,1 do
            local receptor = _G['receptor_'..i]
            receptor:tweenAlpha(0.5,1)
        end
    elseif beat == 201 then
        Game:changeStage("coleWard")
        boyfriend.alpha = 1
        gf.alpha = 1
        for i=0,7,1 do
            local receptor = _G['receptor_'..i]
            receptor.alpha = 1
        end
    end
end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)
    --firstText.text = step.." steps"
    if step == 64 then
        firstText.text = "File >"
    elseif step == 66 then
        firstText.text = "File > New,"
    elseif step == 73 then
        firstText.text = "File > New, stare"
    elseif step == 75 then
        firstText.text = "File > New, stare at"
    elseif step == 77 then
        firstText.text = "File > New, stare at nothing"
    elseif step == 81 then
        firstText.text = "File > New, stare at nothing for"
    elseif step == 83 then
        firstText.text = "File > New, stare at nothing for an"
    elseif step == 85 then
        firstText.text = "File > New, stare at nothing for an hour"
    elseif step == 89 then
        firstText.text = "File > New, stare at nothing for an hour or"
    elseif step == 91 then
        firstText.text = "File > New, stare at nothing for an hour or two,"
    elseif step == 95 then
        firstText.text = ""
        secondText.text = "Drop"
    elseif step == 97 then
        secondText.text = "Drop in"
    elseif step == 99 then
        secondText.text = "Drop in a"
    elseif step == 101 then
        secondText.text = "Drop in a beat,"
    elseif step == 105 then
        secondText.text = "Drop in a beat, like"
    elseif step == 107 then
        secondText.text = "Drop in a beat, like a"
    elseif step == 109 then
        secondText.text = "Drop in a beat, like a hundred"
    elseif step == 113 then
        secondText.text = "Drop in a beat, like a hundred other"
    elseif step == 117 then
        secondText.text = "Drop in a beat, like a hundred other artists"
    elseif step == 121 then
        secondText.text = "Drop in a beat, like a hundred other artists would"
    elseif step == 123 then
        secondText.text = "Drop in a beat, like a hundred other artists would do,"
    elseif step == 127 then
        secondText.text = ""
        thirdText.text = "Click"
    elseif step == 129 then
        thirdText.text = "Click in"
    elseif step == 131 then
        thirdText.text = "Click in some"
    elseif step == 133 then
        thirdText.text = "Click in some chords,"
    elseif step == 137 then
        thirdText.text = "Click in some chords, like"
    elseif step == 139 then
        thirdText.text = "Click in some chords, like a "
    elseif step == 141 then
        thirdText.text = "Click in some chords, like a hundred"
    elseif step == 145 then
        thirdText.text = "Click in some chords, like a hundred other"
    elseif step == 149 then
        thirdText.text = "Click in some chords, like a hundred other artists"
    elseif step == 153 then
        thirdText.text = "Click in some chords, like a hundred other artists would"
    elseif step == 155 then
        thirdText.text = "Click in some chords, like a hundred other artists would do,"
    elseif step == 159 then
        thirdText.text = "Click in some chords, like a hundred other artists would do, like"
    elseif step == 161 then
        thirdText.text = ""
    end
end

-- planning
-- 
-- 
-- 
-- 