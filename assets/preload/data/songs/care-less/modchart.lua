-- this gets called starts when the level loads.
function start(song) -- arguments, the song name
    window.x = 10
    window.y = 25

    -- set to the games res
    window.height = 720
    window.width = 1280
end

function songStart()
    for i=0,7,1 do
        local receptor = _G['receptor_'..i]
        receptor.alpha = 0
    end
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
    end
end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)

end

-- planning
-- 
-- 
-- 
-- 