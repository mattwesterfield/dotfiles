--[[

     Powerarrow Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/matt"
theme.wallpaper                                 = theme.dir .. "/arch.jpg"
theme.font                                      = "Terminus 10"
theme.fg_normal                                 = "#FEFEFE"
theme.fg_focus                                  = "#32D6FF"
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#1E2320"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#00CCFF"
theme.tasklist_bg_focus                         = "#353535"
theme.tasklist_fg_focus                         = "#00CCFF"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_brightness                         = theme.dir .. "/icons/brightness.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
--theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.tasklist_plain_task_name                  = true
--theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 10
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Clock
local clock = awful.widget.watch("date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal(
    {
        --cal = "cal --color=always",
        attach_to = { clock },
        followtag = true,
        week_start = 1,
        notification_preset =
            {
                font = "Monospace 10",
                fg = theme.fg_normal,
                bg = theme.bg_normal
            }
   }
)

-- Keyboard map indicator
mykeyboardlayout = awful.widget.keyboardlayout()

-- Taskwarrior
local task = wibox.widget.imagebox(theme.widget_task)
lain.widget.contrib.task.attach(task,
    {
        -- do not colorize output
        show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'",
        followtag = true
    }
)
task:buttons(my_table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa(
    {
        settings =
            function()
                if volume_now.status == "off" then
                    volicon:set_image(theme.widget_vol_mute)
                elseif tonumber(volume_now.level) == 0 then
                    volicon:set_image(theme.widget_vol_no)
                elseif tonumber(volume_now.level) <= 50 then
                    volicon:set_image(theme.widget_vol_low)
                else
                    volicon:set_image(theme.widget_vol)
                end

                widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
            end
    }
)
theme.volume.widget:buttons(
    awful.util.table.join(
        awful.button({}, 4,
            function()
                awful.util.spawn("amixer set Master 1%+")
                theme.volume.update()
            end
        ),
        awful.button({}, 5,
            function()
                awful.util.spawn("amixer set Master 1%-")
                theme.volume.update()
            end
        )
    )
)
-- theme.volume = lain.widget.alsabar(
--     {
--         --togglechannel = "IEC958,3",
--         notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
--     }
-- )

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem(
    {
       settings =
           function()
               widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
           end
    }
)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu(
    {
        settings =
            function()
                widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
            end
    }
)

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs(
    {
         notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
         followtag = true,
         settings =
             function()
                 local fsp = string.format(" %3.2f %s ", fs_now["/"].free, fs_now["/"].units)
                 widget:set_markup(markup.font(theme.font, fsp))
             end
    }
)

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat(
    {
        settings =
            function()
                if bat_now.status and bat_now.status ~= "N/A" then
                    if bat_now.ac_status == 1 then
                        widget:set_markup(markup.font(theme.font, " AC "))
                        baticon:set_image(theme.widget_ac)
                        return
                    elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                        baticon:set_image(theme.widget_battery_empty)
                    elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                        baticon:set_image(theme.widget_battery_low)
                    else
                        baticon:set_image(theme.widget_battery)
                    end
                    widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
                else
                    widget:set_markup()
                    baticon:set_image(theme.widget_ac)
                end
            end
    }
)

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net(
    {
        settings =
            function()
                widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", " " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
            end
    }
)

-- Separators
local arrow = separators.arrow_left

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height/2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth         , 0        )
    cr:line_to(offset + width               , 0        )
    cr:line_to(offset + width - arrow_depth , height/2 )
    cr:line_to(offset + width               , height   )
    cr:line_to(offset + arrow_depth         , height   )
    cr:line_to(offset                       , height/2 )

    cr:close_path()
end

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, dpi(16), dpi(16)), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    if s.geometry.width >= s.geometry.height then
       -- Default to basic tiling on a landscape screen
       awful.tag(awful.util.tagnames, s, awful.layout.layouts[2])
    else
       -- Default to bottom tiling on a portrait screen
       awful.tag(awful.util.tagnames, s, awful.layout.layouts[3])
    end
    --awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
        my_table.join(
            awful.button({}, 1, function () awful.layout.inc( 1) end),
            awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
            awful.button({}, 3, function () awful.layout.inc(-1) end),
            awful.button({}, 4, function () awful.layout.inc( 1) end),
            awful.button({}, 5, function () awful.layout.inc(-1) end)
        )
    )
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(16), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup
        {
            layout = wibox.layout.align.horizontal,
                -- Left widgets
                {
                    layout = wibox.layout.fixed.horizontal,
                    s.mytaglist,
                    s.mypromptbox,
                    spr,
                },
                -- Middle widget(s)
                s.mytasklist,
                -- Right widgets
                {
                    layout = wibox.layout.fixed.horizontal,
                    -- System tray
                    wibox.widget.systray(),
                    -- Keyboard layout
                    mykeyboardlayout,
                    -- Volume
                    volicon,
                    theme.volume.widget,
                    -- Task Warrior widget
                    arrow(theme.bg_normal, "#353535"),
                    wibox.container.background(wibox.container.margin(task, dpi(3), dpi(7)), "#353535"),
                    -- Memory widget
                    arrow("#353535", "#5DD2D9"),
                    wibox.container.background(wibox.container.margin(wibox.widget { memicon, mem.widget, layout = wibox.layout.align.horizontal }, dpi(2), dpi(3)), "#5DD2D9"),
                    -- CPU widget
                    arrow("#5DD2D9", "#00C5CD"),
                    wibox.container.background(wibox.container.margin(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.align.horizontal }, dpi(3), dpi(4)), "#00C5CD"),
                    -- File system widget
                    arrow("#00C5CD", "#6F65BD"),
                    wibox.container.background(wibox.container.margin(wibox.widget { fsicon, theme.fs and theme.fs.widget, layout = wibox.layout.align.horizontal }, dpi(3), dpi(3)), "#6F65BD"),
                    -- Battery widget
                    arrow("#6F65BD", "#5946B2"),
                    wibox.container.background(wibox.container.margin(wibox.widget { baticon, bat.widget, layout = wibox.layout.align.horizontal }, dpi(3), dpi(3)), "#5946B2"),
                    -- Network speed widget
                    arrow("#5946B2", "#3333A1"),
                    wibox.container.background(wibox.container.margin(wibox.widget { nil, neticon, net.widget, layout = wibox.layout.align.horizontal }, dpi(3), dpi(3)), "#3333A1"),
                    -- Clock / calendar widget
                    arrow("#3333A1", "#000081"),
                    wibox.container.background(wibox.container.margin(clock, dpi(4), dpi(8)), "#000081"),
                    arrow("#000081", "alpha"),
                    -- Active layout widget
                    s.mylayoutbox,
                },
        }
end

return theme
