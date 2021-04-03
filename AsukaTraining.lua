require 'Player'
require 'PauseMenu'

P1 = Player1:new()
P2 = Player2:new()
Pause = PauseMenu:new()
imgFile = "/images/6.gif"
imageRegion = gui.drawImageRegion(imgFile, 30, 30, 30, 30, 30, 300)
form = forms.newform(50, 50, "Image")
pictBox = forms.pictureBox(form)


while true do
    if Pause:menuSelected() == 150 and Pause:modeSelected() == 3 then
        if Pause:pauseIsActive() == 0 then
            surface = gui.use_surface("client")
            gui.text(5, 180, "- Player 1 info -")
            gui.text(10, 200, P1:comboCounter())
            gui.text(10, 240, P2:damageCombo())
            gui.text(10, 255, P2:stunInfo())
        
            gui.text(10, 270, "State : " .. P2:stateInfo())
            gui.text(10, 300, "Inputs : ") 
            -- P1:commandInput1()
            -- gui.drawImage(imgFile, 30, 300, 15, 15)
            -- forms.drawImage(pictBox, imgFile, 0, 0)
        else
            width = client.screenwidth()
            height = client.screenheight()
            gui.text(450, 400, "Game is paused")
            gui.text(450, 450, "Width = " .. width .. "\n" .. "Height = " .. height)
        end
    end

    emu.frameadvance()
end