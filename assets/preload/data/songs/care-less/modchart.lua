--side note: LuaText is just LuaSprite but with a "text" propety

-- this gets called starts when the level loads.
function start(song) -- arguments, the song name
    spinLength = 0
end

function songStart()
    for i=0,7,1 do
        local receptor = _G['receptor_'..i]
        receptor.alpha = 0
    end
    makeSprite("explorer", "explorer", false)
    explorer.y = -500
    explorer.width = 1.5
    explorer.height = 1.5
    explorer.alpha = 0
    makeSprite("large_error", "largeError", false)
    makeText("04b03", "", "10;220", 32, "text1")
    makeText("04b03", "", "-70;220", 32, "text2")
    makeText("04b03", "", "-200;210", 32, "text3")
    makeText("04b03", "", "-150;220", 32, "text4")
    makeText("04b03", "", "70;250", 32, "text5")
    makeText("04b03", "", "90;300", 32, "text6")
    makeText("04b03", "", "90;338", 32, "text7")
    largeError.alpha = 0
end

-- this gets called every frame
function update(elapsed) -- arguments, how long it took to complete a frame
    local currentBeat = (songPos / 1000)*(bpm/60)
    if spinLength ~= 0 then
        for i=0,7,1 do
            local receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + spinLength * math.sin(((currentBeat/2) + i*0.25) * math.pi)
            receptor.y = receptor.defaultY + spinLength * math.cos(((currentBeat/2) + i*0.25) * math.pi)
        end
    end
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
        white.width = white.width*2
        white.height = white.height*2
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
    elseif beat == 217 then
        Game:changeStage("scrollingGrid")
        spinLength = 16
    elseif beat == 264 then
        Game:changeStage("coleWard")
        spinLength = 0
        white.alpha = 1
        white:tweenAlpha(0,1)
    end
end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)
    --text1.text = step.." steps"
    if step == 64 then
        text1.text = "File >"
    elseif step == 66 then
        text1.text = "File > New,"
    elseif step == 73 then
        text1.text = "File > New, stare"
    elseif step == 75 then
        text1.text = "File > New, stare at"
    elseif step == 77 then
        text1.text = "File > New, stare at nothing"
    elseif step == 81 then
        text1.text = "File > New, stare at nothing for"
    elseif step == 83 then
        text1.text = "File > New, stare at nothing for an"
    elseif step == 85 then
        text1.text = "File > New, stare at nothing for an hour"
    elseif step == 89 then
        text1.text = "File > New, stare at nothing for an hour or"
    elseif step == 91 then
        text1.text = "File > New, stare at nothing for an hour or two,"
    elseif step == 95 then
        text1.text = ""
        text2.text = "Drop"
    elseif step == 97 then
        text2.text = "Drop in"
    elseif step == 99 then
        text2.text = "Drop in a"
    elseif step == 101 then
        text2.text = "Drop in a beat,"
    elseif step == 105 then
        text2.text = "Drop in a beat, like"
    elseif step == 107 then
        text2.text = "Drop in a beat, like a"
    elseif step == 109 then
        text2.text = "Drop in a beat, like a hundred"
    elseif step == 113 then
        text2.text = "Drop in a beat, like a hundred other"
    elseif step == 117 then
        text2.text = "Drop in a beat, like a hundred other artists"
    elseif step == 121 then
        text2.text = "Drop in a beat, like a hundred other artists would"
    elseif step == 123 then
        text2.text = "Drop in a beat, like a hundred other artists would do,"
    elseif step == 127 then
        text2.text = ""
        text3.text = "Click"
    elseif step == 129 then
        text3.text = "Click in"
    elseif step == 131 then
        text3.text = "Click in some"
    elseif step == 133 then
        text3.text = "Click in some chords,"
    elseif step == 137 then
        text3.text = "Click in some chords, like"
    elseif step == 139 then
        text3.text = "Click in some chords, like a "
    elseif step == 141 then
        text3.text = "Click in some chords, like a hundred"
    elseif step == 145 then
        text3.text = "Click in some chords, like a hundred other"
    elseif step == 149 then
        text3.text = "Click in some chords, like a hundred other artists"
    elseif step == 153 then
        text3.text = "Click in some chords, like a hundred other artists could"
    elseif step == 155 then
        text3.text = "Click in some chords, like a hundred other artists could do,"
    elseif step == 159 then
        text3.text = "Click in some chords, like a hundred other artists could do, like"
    elseif step == 161 then
        text3.text = ""
    elseif step == 197 then
        text4.text = "Probably"
    elseif step == 201 then
        text4.text = "Probably gonna"
    elseif step == 205 then
        text4.text = "Probably gonna hit"
    elseif step == 207 then
        text4.text = "Probably gonna hit that"
    elseif step == 211 then
        text4.text = "Probably gonna hit that \"don't"
    elseif step == 214 then
        text4.text = "Probably gonna hit that \"don't save"
    elseif step == 217 then
        text4.text = "Probably gonna hit that \"don't save changes\","
    elseif step == 223 then
        text4.text = "Probably gonna hit that \"don't save changes\", again"
    elseif step == 224 then
        explorer.alpha = 1;
        explorer:tweenPos(explorer.x, 200, 2, "expoInOut");
    elseif step == 227 then
        text4.text = ""
    elseif step == 231 then
        text5.text = "Used"
    elseif step == 233 then
        text5.text = "Used to"
    elseif step == 235 then
        text5.text = "Used to write"
    elseif step == 237 then
        text5.text = "Used to write a"
    elseif step == 239 then
        text5.text = "Used to write a song"
    elseif step == 243 then
        text5.text = "Used to write a song a"
    elseif step == 245 then
        text5.text = "Used to write a song a day..."
    elseif step == 253 then
        text5.text = ""
    elseif step == 255 then
        text6.text = "It's"
    elseif step == 257 then
        text6.text = "It's just"
    elseif step == 259 then
        text6.text = "It's just that"
    elseif step == 261 then
        text6.text = "It's just that lately"
    elseif step == 265 then
        text6.text = "It's just that lately my"
    elseif step == 267 then
        text6.text = "It's just that lately my perfection's"
    elseif step == 273 then
        text7.text = "in"
    elseif step == 275 then
        text7.text = "in the"
    elseif step == 277 then
        text7.text = "in the way,"
    elseif step == 281 then
        text7.text = "in the way, of"
    elseif step == 283 then
        text7.text = "in the way, of me,"
        largeError.y = -100
    elseif step == 287 then
        text6.text = ""
        text7.text = ""
        explorer:tweenPos(explorer.x, -500, 2, "expoInOut");
        largeError.alpha = 1
    elseif step == 289 then
        text5.text = "and"
    elseif step == 291 then
        text5.text = "and i"
    elseif step == 293 then
        text5.text = "and i can't"
    elseif step == 295 then
        text5.text = "and i can't make"
    elseif step == 297 then
        text5.text = "and i can't make no"
    elseif step == 301 then
        text5.text = "and i can't make no changes"
    elseif step == 305 then
        text5.text = "and i can't make no changes to"
    elseif step == 307 then
        text5.text = "and i can't make no changes to save"
    elseif step == 309 then
        text5.text = "and i can't make no changes to save me"
    elseif step == 315 then
        text5.text = ""
        makeText("04b03", "", "50;500", 32, "text8")
    elseif step == 321 then
        text8.text = "wish"
    elseif step == 323 then
        text8.text = "wish i"
    elseif step == 325 then
        text8.text = "wish i could"
    elseif step == 327 then
        text8.text = "wish i could write"
    elseif step == 330 then
        text8.text = "wish i could write more,"
    elseif step == 335 then
        text8.text = "wish i could write more, and"
    elseif step == 337 then
        text8.text = "wish i could write more, and care"
    elseif step == 341 then
        text8.text = "wish i could write more, and care less"
    elseif step == 351 then
        text5.text = ""
    elseif step == 353 then
        text8.text = "wish"
    elseif step == 355 then
        text8.text = "wish i"
    elseif step == 357 then
        text8.text = "wish i could"
    elseif step == 359 then
        text8.text = "wish i could write"
    elseif step == 362 then
        text8.text = "wish i could write more,"
    elseif step == 367 then
        text8.text = "wish i could write more, and"
    elseif step == 369 then
        text8.text = "wish i could write more, and care"
    elseif step == 373 then
        text8.text = "wish i could write more, and care less"
    elseif step == 381 then
        text8.text = ""
    elseif step == 389 then
        text8.text = "write"
    elseif step == 393 then
        text8.text = "write more,"
    elseif step == 400 then
        text8.text = "write more, and"
    elseif step == 401 then
        text8.text = "write more, and care"
    elseif step == 405 then
        text8.text = "write more, and care less,"
    elseif step == 416 then
        text8.text = "and"
    elseif step == 417 then
        text8.text = "and care"
    elseif step == 421 then
        text8.text = "and care less"
    elseif step == 429 then
        text8.text = ""
    elseif step == 433 then
        camGame:tweenZoom(100,0.5)
    end
end

-- planning
-- 
-- 
--    what
-- 