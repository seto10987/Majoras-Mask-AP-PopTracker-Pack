function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
end

function smack()
    return has("deku") or smack_hard()
end

function smack_hard()
    return has("sword") or has("fairysword") or has("goron") or has("zora")
end

function get_beans()
    return has("beans") or 
    (has("deku") and (has("bottle")) or projectiles())
end

function plant_beans()
    return has("beans") and (has("bottle") or has("storms"))
end

function projectiles()
    return has("bow") or
    (has("deku") and has("magic")) or
    has("zora") or has("hookshot")
end

function explosives()
    return has("bombs") or has("bombchu")
end

function use_keg()
    return has("goron") and has("keg")
end

function use_fire_arrows()
    return has("bow") and has("magic") and has("firearrow")
end

function use_ice_arrows()
    return has("bow") and has("magic") and has("icearrow")
end

function use_light_arrows()
    return has("bow") and has("magic") and has("lightarrow")
end

function use_lens()
    return has("lens") and has("magic")
end

function play_healing()
    return has("ocarina") and has("healing")
end

function play_eponas()
    return has("ocarina") and has("epona")
end

function play_sonata()
    return has("ocarina") and has("sonata")
end

function enter_woodfall()
    return has("deku") and has("sonata") and has("ocarina")
end

function clear_woodfall()
    return  (has("bk_wf") or has("odolwa")) and enter_woodfall() and has("bow")
end

function paper()
    return has("landdeed") or has("swampdeed") or has("mountaindeed") or has("oceandeed") or has ("express") or has ("kafeiletter")
end

function anju_kafei()
    return has("kafeiletter") and has("pendant") and has("hookshot") and (has("garo") or has("gibdo"))
end

-----

function moon()
    return has("ocarina") and has("oath") and has("odolwa") and has("goht") and has("gyorg") and has("twinmold")
end

function swamp_deku_palace()
    return projectiles() and has("deku") or
        has("bottle")
end

function deku_palace()
    return swamp_deku_palace() and has("deku")
end

function woodfall()
    return swamp_deku_palace() and has("deku")
end

function woodfall_temple()
    return woodfall() and has("sonata")
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