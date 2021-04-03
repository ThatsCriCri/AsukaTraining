-- Asuka 120% L.O. Pause Menu class --
PauseMenu = {}

-- Initializing
function PauseMenu:new()
    setmetatable({}, PauseMenu)

    self.m_menu = 0x0FFB82
    self.m_pause = 0x07984A
    self.m_modeSelect = 0x07C9B6
    self.m_isEnabled = false

    return self
end

--[[Return the value of the selected menu :
- 99 is the main menu
- 1 is VS Game
- 2 is Ranking mode
- 3 is Deathmatch
- 4 is Config 
- 150 is the battle screen (playing)]]
function PauseMenu:menuSelected()
    menuSelect = memory.readbyte(self.m_menu)
    return menuSelect
end

function PauseMenu:pauseIsActive()
    pauseEnabled = memory.readbyte(self.m_pause)
    return pauseEnabled
end

--[[Return the value of the select Vs Mode :
- 0 is 1p vs 2p
- 1 is vs com 
- 2 is com vs com 
- 3 is deku]]
function PauseMenu:modeSelected()
    vsModeSelected = memory.readbyte(self.m_modeSelect)
    return vsModeSelected
end



