-- Songs
function can_play_healing() -- was "play_healing"
    return has("healing") and has("ocarina")
end

function can_play_eponas()
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

function has_hard_projectiles() -- was "has_hard_projectiles"
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

function has_paper()
    return has("landdeed") or has("swampdeed") or has("mountaindeed") or has("oceandeed") or has("kafeiletter") or has("express")
end

function can_plant_beans() -- was "plant_beans"
    return can_get_magic_beans() and (has("bottle") or can_play_storms())
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


-- Easy difficulty rules
function baby_has_bombchus()
    return has("bombchu1") and has("bombchu5") and has("bombchu10")
end

function baby_has_explosives()
    return has("bombs") and baby_has_bombchus() and has("blast")
end

function baby_has_hard_projectiles()
    return has("bow") and has("zora") and has("hookshot")
end

function baby_has_projectiles()
    return has("deku") and has("magic") and baby_has_hard_projectiles()
end

function baby_can_smack_hard()
    return has("sword") and has("fiercedeity") and has("fairysword") and has("goron") and has("zora")
end

function baby_can_smack()
    return has("deku") and baby_can_smack_hard()
end

function baby_has_paper()
    return has("landdeed") and has("swampdeed") and has("mountaindeed") or has("oceandeed") or has("kafeiletter") or has("express")
end

function baby_has_bottle()
    return has("redpotion") and has("chateau")
end

function baby_can_plant_beans()
    return can_get_magic_beans() and baby_has_bottle() and can_play_storms()
end

function baby_can_bring_to_player()
    return has("hookshot") and has("zora")
end

function baby_can_reach_seahorse()
    return great_bay() and has("zora") and has("hookshot") and has("goron") and has("pictobox")
end

function easy_can_reach_seahorse()
    return great_bay() and has("zora") and (has("hookshot") or has("goron")) and has("pictobox")
end

--[[
function can_purchase()
    if price > 200 then
        return has("giantswallet")
    elseif price > 99 then
        return has("adultswallet")
    else
    end
end]]


-- Region rules

function moon()
    return has("ocarina") and has("oath") and has("odolwa") and has("goht") and has("gyorg") and has("twinmold")
end

--- SWAMP REGION ---
-- Southern Swamp -> Southern Swamp (Deku Palace)
function baby_south_swamp()
    return has("redpotion") and baby_has_hard_projectiles() and has("deku")
end
function south_swamp()
    return has("redpotion") or (has_hard_projectiles() and has("deku")) or (has("pictobox") and has("deku"))
end

-- Southern Swamp (Deku Palace) -> Swamp Spider House
function baby_swamp_skull_house()
    return baby_south_swamp() and has("deku") and can_use_fire_arrows()
end
function swamp_skull_house()
    return south_swamp() and has("deku")
end

-- Southern Swamp (Deku Palace) -> Deku Palace
function baby_deku_palace()
    return baby_south_swamp() and has("deku")
end
function deku_palace()
    return south_swamp() and has("deku")
end

-- Southern Swamp (Deku Palace) -> Woodfall
function baby_woodfall()
    return baby_south_swamp() and has("deku")
end
function woodfall()
    return south_swamp() and has("deku")
end

-- Woodfall -> Woodfall Temple
function baby_woodfall_temple()
    return baby_woodfall() and can_play_sonata() and has("bosskey_wf") and has("smallkey_wf")
end
function woodfall_temple()
    return woodfall() and can_play_sonata()
end

-- What's needed to defeat Odolwa
function baby_clear_woodfall()
    return baby_woodfall_temple() and has("bow") and baby_can_smack_hard() and has("bosskey_wf") and has("odolwa")
end
function clear_woodfall()
    return woodfall_temple() and has("bow") and can_smack() and (has("bosskey_wf") or has("odolwa"))
end


--- MOUNTAIN REGION ---
-- Termina Field -> Path to Mountain Village
-- Easy and normal
function path_mountain()
    return has("bow")
end

-- Path to Mountain Village -> Mountain Village
function baby_moutain_village()
    return path_mountain() and has("goron") and baby_has_explosives() and can_use_fire_arrows()
end
function mountain_village()
    return path_mountain() and (has("goron") or has_explosives() or can_use_fire_arrows())
end

-- Path to Snowhead -> Snowhead Temple
function baby_snowhead_temple()
    return baby_moutain_village() and has("goron") and can_play_lullaby() and has("magic") and has("bosskey_sh") and has("smallkey_sh", 3)
end
function snowhead_temple()
    return mountain_village() and has("goron") and can_play_lullaby() and has("magic")
end

-- What's needed to defeat Goht ***will likely need to revisit in the future
function baby_clear_snowhead()
    return baby_snowhead_temple() and can_use_fire_arrows() and baby_has_explosives()
end
function clear_snowhead()
    return snowhead_temple() and (can_use_fire_arrows() and has("smallkey", 1) and has("bosskey_sh")) or (can_use_fire_arrows() and has("goht"))
end


--- GREAT BAY REGION ---
-- Termina Field -> Great Bay
-- Easy and normal
function great_bay()
    return can_play_eponas()
end

-- Great Bay -> Ocean Spider House
function baby_ocean_spider_house()
    return great_bay() and baby_has_explosives() and has("hookshot")
end
function ocean_spider_house()
    return great_bay() and has_explosives()
end

-- Great Bay -> Pirates' Fortress
-- Easy and normal
function pirates_fortress()
    return great_bay() and has("zora")
end

-- Pirates' Fortress -> Pirates' Fortress (Interior)
function baby_pirates_fortress_interior()
    return pirates_fortress() and has("goron") and has("hookshot")
end
function pirates_fortress_interior()
    return pirates_fortress() and (has("goron") or has("hookshot"))
end

-- Zora Cape -> Great Bay Temple
function baby_great_bay_temple()
    return great_bay() and can_play_bossa_nova() and has("hookshot") and has("zora") and has("bosskey_gb") and has("smallkey_gb")
end
function great_bay_temple()
    return great_bay() and can_play_bossa_nova() and has("hookshot") and has("zora")
end

-- What's needed to defeat Gyorg
function baby_clear_greatbay()
    return baby_great_bay_temple() and has("zora") and can_use_ice_arrows() and can_use_fire_arrows() and has("bow")
end

function clear_greatbay()
    return great_bay_temple() and has("zora") and can_use_ice_arrows() and can_use_fire_arrows() and (has("bosskey_gb") or has("gyorg"))
end


--- IKANA REGION ---
-- Road to Ikana -> Ikana Graveyard
-- Easy and normal
function graveyard()
    return can_play_eponas()
end

--Road to Ikana -> Ikana Canyon
function baby_ikana_canyon()
    return can_play_eponas() and has("hookshot") and has("garo") and has("gibdo")
end
function ikana_canyon()
    return can_play_eponas() and has("hookshot") and (has("garo") or has("gibdo"))
end

-- Ikana Canyon -> Secret Shrine
function baby_secret_shrine()
    return baby_ikana_canyon() and can_use_light_arrows()
end
function secret_shrine()
    return ikana_canyon()
end

-- Ikana Canyon -> Beneath the Well
function baby_well()
    return baby_ikana_canyon() and can_use_ice_arrows() and has("gibdo") and baby_has_bottle()
end
function well()
    return ikana_canyon() and can_use_ice_arrows() and has("gibdo") and has("bottle")
end

-- Ikana Canyon -> Ikana Castle
function baby_ikana_castle()
    return baby_ikana_canyon() and can_use_ice_arrows() and can_use_light_arrows() and has("gibdo") and has("mirrorshield") and baby_has_bottle()
end
function ikana_castle()
    return ikana_canyon() and can_use_ice_arrows() and (can_use_light_arrows() or has("mirrorshield"))
end

-- Stone Tower -> Stone Tower Temple
function baby_stone_tower_temple()
    return baby_ikana_canyon() and can_use_ice_arrows() and can_play_elegy() and has("goron") and has("zora") and has("bosskey_st") and has("smallkey_st", 4)
end
function stone_tower_temple()
    return ikana_canyon() and can_use_ice_arrows() and can_play_elegy() and has("goron") and has("zora")
end

-- Stone Tower -> Stone Tower (Inverted)
function baby_inverted_stone_tower()
    return baby_stone_tower_temple() and can_use_light_arrows()
end
function inverted_stone_tower()
    return stone_tower_temple() and can_use_light_arrows()
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