-- Asuka 120% L.O. Player class
Player = {}

-- Initializing
function Player:new()
    setmetatable({}, Player)

    self.m_life = 0
    self.m_redLife = 0
    self.m_meter = 0
    self.m_stun = 0
    self.m_stunLimit = 0
    self.m_stunTimer = 0
    self.m_side = 0
    self.m_stick = 0
    self.m_buttons = 0
    self.m_walkDash = 0
    self.m_speedX = 0
    self.m_speedY = 0
    self.m_cameraHeight = 0
    self.m_state = 0
    self.m_combo = 0
    self.m_prevCombo = 0

    return self
end

function Player:damageCombo()
    previousDamage = 0
    damage = 191 - memory.readbyte(self.m_life)
    if damage ~= 0 then
        previousDamage = damage
    end
    damageString = "Damage : " .. damage .. " (" .. previousDamage .. ")"
    return damageString
end

function Player:comboCounter()
    previousCombo = 0
    combo = memory.readbyte(self.m_combo)
    previousCombo = memory.readbyte(self.m_prevCombo)
    comboString = "Combo : " .. combo .. " (" .. previousCombo .. ")"
    return comboString
end

function Player:stunInfo()
    stun = memory.readbyte(self.m_stun)
    stunLimit = memory.readbyte(self.m_stunLimit)
    stunTime = memory.readbyte(self.m_stunTimer)
    stunString = "Stun : " .. stun .. "/" .. stunLimit .. " - " .. stunTime
    return stunString
end

function Player:stateInfo()
    statePlayer = memory.readbyte(self.m_state)
    if statePlayer == 0 then
        stateString = "Hit"
    elseif statePlayer == 127 then
        stateString = "Clash"
    elseif statePlayer == 8 then
        stateString = "Thrown"
    elseif statePlayer == 15 then
        stateString = "Idle"
    end
    return stateString
end

function Player:commandInput()
    commandStick = memory.readbyte(self.m_stick)
    commandButtons = memory.readbyte(self.m_buttons)
    if commandStick == 1 then
        commandStickStr = "↙"
    elseif commandStick == 2 then
        commandStickStr = "↓"
    elseif commandStick == 3 then
        commandStickStr = "↘"
    elseif commandStick == 4 then
        commandStickStr = "←"
    elseif commandStick == 0 then
        commandStickStr = " "
    elseif commandStick == 6 then
        commandStickStr = "→"
    elseif commandStick == 7 then
        commandStickStr = "↖"
    elseif commandStick == 8 then
        commandStickStr = "↑"
    elseif commandStick == 9 then
        commandStickStr = "↗"
    end
    return commandStickStr
end
 



-- ****** Player 1 ****** --
Player1 = Player:new()

function Player1:new()
    setmetatable({}, Player1)

    self.m_life = 0x086F74
    self.m_redLife = 0x086F76
    self.m_meter = 0x086F7C
    self.m_stun = 0x086CF2
    self.m_stunLimit = 0x086CF8
    self.m_stunTimer = 0x086CF4
    self.m_side = 0x086C74
    self.m_stick1 = 0x086D00
    self.m_buttons = 0x086D04
    self.m_walkDash = 0x086D73
    self.m_speedX = 0x086D72
    self.m_speedY = 0x086D82
    self.m_cameraHeight = 0x086EB6
    self.m_state = 0x086F84
    self.m_combo = 0x0873FC
    self.m_prevCombo = 0x086E12

    return self
end

-- Display the damage on Player one
function Player1:damageCombo()
    previousDamage = 0
    damage = 191 - memory.readbyte(self.m_life)
    if damage ~= 0 then
        previousDamage = damage
    end
    damageString = "P2 Damage : " .. damage .. " (" .. previousDamage .. ") "
    return damageString
end

-- Display the number of hits for Player one
function Player1:comboCounter()
    previousCombo = 0
    combo = memory.readbyte(self.m_combo)
    previousCombo = memory.readbyte(self.m_prevCombo)
    comboString = "P1 Combo : " .. combo .. " (" .. previousCombo .. ")"
    return comboString
end

-- Display the stun information of Player one
function Player1:stunInfo()
    stun = memory.readbyte(self.m_stun)
    stunLimit = memory.readbyte(self.m_stunLimit)
    stunTime = memory.readbyte(self.m_stunTimer)
    stunString = "P1 Stun : " .. stun .. "/" .. stunLimit .. " - " .. stunTime
    return stunString
end

-- Display the state information of Player one
function Player1:stateInfo()
    stateP1 = memory.readbyte(self.m_state)
    if stateP1 == 0 then
        stateString = "Hit"
    elseif stateP1 == 127 then
        stateString = "Clash"
    elseif stateP1 == 8 then
        stateString = "Thrown"
    elseif stateP1 == 15 then
        stateString = "Idle"
    end
    return stateString
end

-- Display the input of Player one
function Player1:commandInput1()
    commandStick = memory.readbyte(self.m_stick1)
    -- commandButtons = memory.readbyte(self.m_buttons)
    if commandStick == 1 then
        guiInput = gui.drawImage("./images/1.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "1"
    elseif commandStick == 2 then
        guiInput = gui.drawImage("./images/2.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "2"
    elseif commandStick == 3 then
        guiInput = gui.drawImage("./images/3.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "3"
    elseif commandStick == 4 then
        guiInput = gui.drawImage("./images/4.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "4"
    elseif commandStick == 0 then
        guiInput = " "
        -- stickStr = "0"
    elseif commandStick == 6 then
        guiInput = gui.drawImage("./images/6.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "6"
    elseif commandStick == 7 then
        guiInput = gui.drawImage("./images/7.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "7"
    elseif commandStick == 8 then
        guiInput = gui.drawImage("./images/8.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "8"
    elseif commandStick == 9 then
        guiInput = gui.drawImage("./images/9.gif", 30, 300, 20, 20, "surface")
        -- stickStr = "9"
    end
    return guiInput
end



-- ****** Player 2 ****** --
Player2 = Player:new()

function Player2:new()
    setmetatable({}, Player2)

    self.m_life = 0x0875C4
    self.m_redLife = 0x0875C6
    self.m_meter = 0x0875CC
    self.m_stun = 0x087342
    self.m_stunLimit = 0x087348
    self.m_stunTimer = 0x087344
    self.m_side = 0x087350
    self.m_stick = 0x087354
    self.m_buttons = 0x087354
    --self.m_walkDash = 0x
    self.m_speedX = 0x0873DE -- Need testing to find the correct address
    self.m_speedY = 0x0873C4 -- Need testing to find the correct address
    self.m_cameraHeight = 0x087506
    self.m_state = 0x083EB0
    self.m_combo = 0x086DAE
    self.m_prevCombo = 0x086E12 -- Need testing

    return self
end

-- Display the damage on Player two
function Player2:damageCombo()
    previousDamage = 0
    damage = 191 - memory.readbyte(self.m_life)
    if damage ~= 0 then
        previousDamage = damage
    end
    damageString = "P1 Damage : " .. damage .. " (" .. previousDamage .. ") "
    return damageString
end

-- Display the number of hits for Player two
function Player2:comboCounter2()
    previousCombo = 0
    combo = memory.readbyte(self.m_combo)
    previousCombo = memory.readbyte(self.m_prevCombo)
    comboString = "P2 Combo : " .. combo .. " (" .. previousCombo .. ")"
    return comboString
end

-- Display the stun information of Player two
function Player2:stunInfo()
    stun = memory.readbyte(self.m_stun)
    stunLimit = memory.readbyte(self.m_stunLimit)
    stunTime = memory.readbyte(self.m_stunTimer)
    stunString = "P2 Stun : " .. stun .. "/" .. stunLimit .. " - " .. stunTime
    return stunString
end

-- Display the state information of Player two
function Player2:stateInfo()
    stateP2 = memory.readbyte(self.m_state)
    if stateP2 == 0 then
        stateString = "Hit"
    elseif stateP2 == 127 then
        stateString = "Clash"
    elseif stateP2 == 8 then
        stateString = "Thrown"
    elseif stateP2 == 15 then
        stateString = "Idle"
    end
    return stateString
end

function Player2:commandInput()
    commandStick = memory.readbyte(self.m_stick)
    commandButtons = memory.readbyte(self.m_buttons)
    if commandStick == 1 then
        commandStickStr = "↙"
    elseif commandStick == 2 then
        commandStickStr = "↓"
    elseif commandStick == 3 then
        commandStickStr = "↘"
    elseif commandStick == 4 then
        commandStickStr = "←"
    elseif commandStick == 0 then
        commandStickStr = " "
    elseif commandStick == 6 then
        commandStickStr = "→"
    elseif commandStick == 7 then
        commandStickStr = "↖"
    elseif commandStick == 8 then
        commandStickStr = "↑"
    elseif commandStick == 9 then
        commandStickStr = "↗"
    end
    return commandStickStr
end


