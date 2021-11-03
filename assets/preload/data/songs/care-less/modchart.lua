--side note: LuaText is just LuaSprite but with a "text" propety

-- this gets called starts when the level loads.
function start(song) -- arguments, the song name

end

function songStart()
    for i=0,7,1 do
        local receptor = _G['receptor_'..i]
        receptor.alpha = 0
    end
    makeText("04b03", " ", "10;260", 32, "testText")
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

    elseif beat == 49 then
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
    elseif beat == 81 then
        Game:changeStage("scrollingGrid")
    elseif beat == 111 then
        Game:changeStage("samuraiWard")
    elseif beat == 111 then
        Game:changeStage("coleWardDay")
    end
end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)
    --testText.text = step.." steps"
    if step == 64 then
        testText.text = "File >"
        
    elseif step == 66 then
        testText.text = "File > New,"
    elseif step == 73 then
        testText.text = "File > New, stare"
    elseif step == 75 then
        testText.text = "File > New, stare at"
    elseif step == 77 then
        testText.text = "File > New, stare at nothing"
    elseif step == 81 then
        testText.text = "File > New, stare at nothing for"
    elseif step == 83 then
        testText.text = "File > New, stare at nothing for an"
    elseif step == 85 then
        testText.text = "File > New, stare at nothing for an hour"
    elseif step == 89 then
        testText.text = "File > New, stare at nothing for an hour or"
    elseif step == 91 then
        testText.text = "File > New, stare at nothing for an hour or two,"
    end
end

-- planning
-- 
-- 
-- 
-- 