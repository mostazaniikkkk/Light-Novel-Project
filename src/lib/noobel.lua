txtBox = Image.load("textures/textBlock.png")
timer = Timer.new()

counter = 0

function LineGen(lenght, y, text)
    if counter > lenght then
        screen:print(70, y, text:sub(0,counter - lenght), Color.new(0, 0, 0))
    end
end

function OptionGen(text, xText, x, y)
    screen:blit(x, y, txtBox, 0,71, 70, 88)
    screen:blit(x + 70, y, txtBox, 30,71, 114, 88)
    screen:print(x + xText, y + 5, text, Color.new(0, 0, 0))
end

function TextBox(text00, text01, text02, text03, text04, colorName, posName, cantAlt)
    --NameManager
    --True = izquierda, False = derecha
    if posName == false then
        xPos = 330
     else
         xPos = 30
     end
 
    screen:blit(xPos, 170, txtBox, 0,71, 104, 88)
    screen:print(xPos + 12, 175, name, colorName)
    
    --TextBox
    if counter == 1 then
        timer:start()
    end
    
    screen:blit(20, 195, txtBox, 0, 0, 445, 71)
    if timer:time() % 1 == 0 and counter < #text00 + #text01 + #text02 + #text03 + #text04 then
        counter = counter + 1
    end
    --screen:print(0, 0, counter .. ' seg', Color.new(255, 255, 255))
    LineGen(0, 205, text00)
    LineGen(#text00, 215, text01)
    LineGen(#text00 + #text01, 225, text02)
    LineGen(#text00 + #text01 + #text02, 235, text03)
    LineGen(#text00 + #text01 + #text02 + #text03, 245, text04)

    if counter < 185 and pad:cross() then
       counter = 184
    end

    if counter > 185 and pad:cross() and cantAlt == 0 then
        return false

    elseif  counter > 185 and cantAlt == 2 then
        OptionGen(textAlt00, 0, 0, 0)
        return true
    else
        return true
    end
end

function TextLoad(charCant, char, char2,cantAlt, position)
    while switch == true do
        pad = Controls.read()
        screen:clear(Color.new(0, 0, 0))
        screen:blit(0, 0, background)
        screen:blit(240, 0, char)
        if charCant == 0 then
            screen:blit(0, 0, char2)
        end
    
        --Textbox
        switch = TextBox(text00,text01,text02,text03,text04, Color.new(0, 128, 0),position,cantAlt)
    
        screen.flip()
        screen.waitVblankStart()
    end
end