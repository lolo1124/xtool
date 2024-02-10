g_lua.register()
g_gui.add_toast(" [Money Loop v1.5] You can find the options in Scripting > Lua Options > Money Loop", "Money Loop")

function trigger_transaction(hash, amount)
    SCRIPT.SET_GLOBAL_I(4537212 + 1, 2147483646)
    SCRIPT.SET_GLOBAL_I(4537212 + 7, 2147483647)
    SCRIPT.SET_GLOBAL_I(4537212 + 6, 0)
    SCRIPT.SET_GLOBAL_I(4537212 + 5, 0)
    SCRIPT.SET_GLOBAL_I(4537212 + 3, hash)
    SCRIPT.SET_GLOBAL_I(4537212 + 2, amount)
    SCRIPT.SET_GLOBAL_I(4537212, 2)
end

submenu = g_util.joaat("MoneyLoop")
item("Money Loop"):submenu():push(submenu)
item("Money Loop"):moveSubMenu(submenu):push(g_util.joaat("MoneyLoop 2"), 930398471)

item("1 Million Money Loop"):boolOption(false):addCall(function()
    if money_loop then
        money_loop = false
    else
        money_loop = true
        if delay == nil then
            g_util.yield()
        elseif warning then
            g_util.yield()
        else
            g_gui.add_toast(" [Money Loop v1.5] Press F3 to UNLOAD the script!", "Money Loop")
            warning = true
        end
    end
end):push(g_util.joaat("MoneyLoop1M"), submenu)
item("Set delay"):floatEditor(300.0, 0.0, 10000.0, 100.0):addCall(function(flt)
    g_util.yield()
    delay = 0
    delay = flt.valueFloat
end):about("Setting the delay too low might cause transaction errors. Recomended delay is 300 ms."):push(g_util.joaat("SetDelay"), submenu)

item("50K Money Loop"):boolOption(false):addCall(function()
    if money_loop2 then
        money_loop2 = false
    else
        money_loop2 = true
        if delay2 == nil then
            g_util.yield()
        elseif warning2 then
            g_util.yield()
        else
            g_gui.add_toast(" [Money Loop v1.5] Press F3 to UNLOAD the script!", "Money Loop")
            warning2 = true
        end
    end
end):push(g_util.joaat("MoneyLoop50K"), submenu)
item("Set delay 2"):floatEditor(1000.0, 0.0, 10000.0, 100.0):addCall(function(flt)
    g_util.yield()
    delay2 = 0
    delay2 = flt.valueFloat
end):about("Setting the delay too low might cause transaction errors. Recommended delay is 1000 ms."):push(g_util.joaat("SetDelay2"), submenu)

item("5K Chip Loop"):boolOption(false):addCall(function()
    if chip_loop then
        chip_loop = false
    else
        chip_loop = true
        if delay3 == nil then
            g_util.yield()
        elseif warning3 then
            g_util.yield()
        else
            g_gui.add_toast(" [Money Loop v1.5] Press F3 to UNLOAD the script!", "Money Loop")
            warning3 = true
        end
    end
end):push(g_util.joaat("ChipLoop5K"), submenu)
item("Set delay 3"):floatEditor(1000.0, 0.0, 10000.0, 100.0):addCall(function(flt)
    g_util.yield()
    delay3 = 0
    delay3 = flt.valueFloat
end):about("Setting the delay too low might cause transaction errors. Recommended delay is 1000 ms."):push(g_util.joaat("SetDelay3"), submenu)

while true do
    if g_util.is_key_pressed(114) then
        g_gui.add_toast(" Unloaded Money_Loop_v1.5", "Money Loop")
        g_lua.unregister()
    end
    if money_loop then
        if delay == nil then
            g_gui.add_toast(" You must press the delay options BEFORE activating the loops", "Money Loop")
            g_util.yield(7500)
        else
            trigger_transaction(0x615762F1, 1000000)
            g_util.yield(delay)
        end
        g_util.yield()
    end
    if money_loop2 then
        if delay2 == nil then
            g_gui.add_toast(" You must press the delay options BEFORE activating the loops", "Money Loop")
            g_util.yield(7500)
        else
            trigger_transaction(1628412596, 50000)
            g_util.yield(delay2)
        end
        g_util.yield()
    end
    if chip_loop then
        if delay3 == nil then
            g_gui.add_toast(" You must press the delay options BEFORE activating the loops", "Money Loop")
            g_util.yield(7500)
        else
            SCRIPT.SET_GLOBAL_I(1963515, 1)
            g_util.yield(delay3)
        end
        g_util.yield()
    end
    g_util.yield()
end