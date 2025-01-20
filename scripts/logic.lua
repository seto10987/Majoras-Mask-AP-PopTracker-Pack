-- Songs
function can_play_healing() -- was "play_healing"
    return has("healing") and has("ocarina")
end

function can_play_eponas() -- was "play_eponas"
    return has("epona") and has("ocarina")
end

function can_play_storms()
    return has("storms") and has("ocarina")
end

function can_play_sonata() -- was "play_sonata"
    return has("sonata") and has("ocarina")
end

function can_play_lullaby()
    return has("goronlullaby") and has("ocarina")
end

function can_play_bossa_nova()
    return has("bossanova") and has("ocarina")
end

function can_play_elegy()
    return has("elegy") and has("ocarina")
end


-- Rules consistent between difficulties

function can_get_magic_beans() -- was "get_beans"
    return has("beans") and has("deku") and deku_palace()
end

-- has_bombchus() unnecessary: any bombchu pickup is linked to one toggle "bombchu"

function has_explosives() -- was "explosives"
    return has("bombs") or has("bombchu") or has("blast")
end

function has_hard_projectiles() -- was "projectiles_hard"
    return has("bow") or has("zora") or has("hookshot")
end

function has_projectiles() -- was "projectiles"
    return (has("deku") and has("magic")) or has_hard_projectiles()
end

function can_smack_hard() -- was "smack_hard"
    return has("sword") or has("fiercedeity") or has("fairysword") or has("goron") or has("zora")
end

function can_smack() -- was "smack"
    return can_smack_hard() or has("deku")
end

function has_paper() -- was "paper"
    return has("landdeed") or has("swampdeed") or has("mountaindeed") or has("oceandeed") or has ("kafeiletter") or has ("express")
end

function can_plant_beans() -- was "plant_beans"
    return can_get_magic_beans() and (has("bottle") or has("storms"))
end

function can_use_powder_keg() -- was "use_keg"
    return has("keg") and has("goron")
end

function can_use_fire_arrows() -- was "use_fire_arrows"
    return has("bow") and has("magic") and has("firearrow")
end

function can_use_ice_arrows() -- was "use_ice_arrows"
    return has("bow") and has("magic") and has("icearrow")
end

function can_use_light_arrows() -- was "use_light_arrows"
    return has("bow") and has("magic") and has("lightarrow")
end

function can_use_lens() -- was "use_lens"
    return has("lens") and has("magic")
end

function can_bring_to_player()
    return has("hookshot") or has("zora")
end


-- Difficulty specific settings (WIP)

-- Baby and normal rules have slight differences!!!
--function can_reach_scarecrow()
--    return can_reach_astral_observatory() --[[or can_reach_trading_post()]]and has("hookshot")
--end

-- Baby and normal rules have slight differences!!!
--function can_reach_seahorse()
--    return can_reach_fisherman_house()
--end

function can_purchase()
    if price > 200 then
        return has("giantswallet")
    elseif price > 99 then
        return has("adultswallet")
    else
    end
end

function anju_kafei() -- was "anju_kafei"
    return has("kafeimask") and play_eponas() and has("kafeiletter") and has("pendant") and has("hookshot") and 
    (has("garo") or has("gibdo"))
end


-- Region rules

function moon() -- was "moon"
    return has("ocarina") and has("oath") and has("odolwa") and has("goht") and has("gyorg") and has("twinmold")
end

function south_swamp() -- was "south_swamp"
    return projectiles_hard() and has("deku") and has("redpotion")
end

function deku_palace() -- was "deku_palace"
    return south_swamp() and has("deku")
end

function swamp_skull_house() -- was "swamp_skull_house"
    return south_swamp() and has("deku") and use_fire_arrows()
end

function woodfall() -- was "woodfall"
    return south_swamp() and has("deku")
end

function enter_woodfall() -- was "enter_woodfall"
    return has("deku") and has("sonata") and has("ocarina")
end

function woodfall_temple() -- was "woodfall_temple"
    return woodfall() and play_sonata()
end

function clear_woodfall() -- was "clear_woodfall"
    return (has("bk_wf") or has("odolwa")) and enter_woodfall() and has("bow")
end

-----

function bottle_count()
    if Tracker:FindObjectForCode("redpotion").Active then
        if Tracker:FindObjectForCode("bottle_1").Active then
                if Tracker:FindObjectForCode("bottle_2").Active then
                    Tracker:FindObjectForCode("bottle_3").Active = true
                        else Tracker:FindObjectForCode("bottle_2").Active = true
                end
            else Tracker:FindObjectForCode("bottle_1").Active = true
        end
    end
end

function clear_wft()
    if Tracker:FindObjectForCode("boss_odolwa_hosted").Active then
        Tracker:FindObjectForCode("wftreward").Active = true
    end
    if Tracker:FindObjectForCode("boss_odolwa_hosted").Active == false then
        Tracker:FindObjectForCode("wftreward").Active = false
    end
end


ScriptHost:AddWatchForCode("bottlecounter_wft", "boss_odolwa_hosted", clear_wft)
ScriptHost:AddWatchForCode("bottlecounter_red", "redpotion", bottle_count)
ScriptHost:AddWatchForCode("bottlecounter_blue", "bluepotion", bottle_count)
ScriptHost:AddWatchForCode("bottlecounter_chateau", "chateau", bottle_count)