BAG_GUID = Global.getVar('BAG_GUID')
BAG_MONSTER_GUID = Global.getVar('BAG_MONSTER_GUID')
BAG_CHEST_GUID = Global.getVar('BAG_CHEST_GUID')
BAG_FOREST_GUID = Global.getVar('BAG_FOREST_GUID')
BAG_EVENT_GUID = Global.getVar('BAG_EVENT_GUID')
BAG_CASTLE_GUID = Global.getVar('BAG_CASTLE_GUID')
BAG_CRYSTAL_GUID = Global.getVar('BAG_CRYSTAL_GUID')
TABLE_GUID = Global.getVar('TABLE_GUID')

local bagsGUID = {}
local length = 0

function setUpCards()

    loadBags()

    local bag

    z = 11.60
    x = -13.64
    y = 0.96
    width = 1.516
    heigth = 1.785        
    local rows = {1,2,3,4,5,6,7,8,9,10,11,12,13,14}
    local columns = {1,2,3,4,5,6,7,8,9,10,11,12}
    local iz = z

    local flip = true
    local blockCrystal = 0
    local qtdCrystal = 0
    local columnCrystal = 3


    for _, column in ipairs(columns) do
        if blockCrystal > 0 then
            blockCrystal = blockCrystal - 1  
        end      
   
        for _, i in ipairs(rows) do
            local random = math.random(1,length)  
                     
            if random == 1 then
                if qtdCrystal == 4 then
                    random = math.random(2,length)
                end

                if blockCrystal == 0 then
                    qtdCrystal = qtdCrystal + 1
                    blockCrystal = columnCrystal
                else
                    random = math.random(2,length)
                end
            end

            bag = getObjectFromGUID(bagsGUID[random])   

            bag.takeObject({
            flip=flip,
            position={x,y,iz},
            rotation={0,180,180}
            })

            iz = iz - heigth
        
        end

        iz = z - (heigth /2)
        x = x + width
    
        for _, i in ipairs(rows) do
            local random = math.random(1,length)
            
            if random == 1 then
                if qtdCrystal == 4 then
                    random = math.random(2,length)
                end

                if blockCrystal == 0 then
                    qtdCrystal = qtdCrystal + 1
                    blockCrystal = columnCrystal
                else
                    random = math.random(2,length)
                end
            end

            bag = getObjectFromGUID(bagsGUID[random])   

            bag.takeObject({
                flip=flip,
                position={x,y,iz},
                rotation={0,180,180}
            })
    
            iz = iz - heigth
            
        end
        x = x + width
        iz = z
    end

end

function loadBags()

    local crystal = 1
    local base = 5
    local forest = 3
    local monster = 4    
    local chest = 2
    local castle = 1
    local event = 2


    for i = 1, crystal do
        length = length +1
        bagsGUID[length] = BAG_CRYSTAL_GUID
    end


    for i = 1, base do
        length = length +1
        bagsGUID[length] = BAG_GUID        
    end

    for i = 1, forest do
        length = length +1
        bagsGUID[length] = BAG_FOREST_GUID
    end

    for i = 1, monster do
        length = length +1
        bagsGUID[length] = BAG_MONSTER_GUID
    end

    for i = 1, chest do
        length = length +1
        bagsGUID[length] = BAG_CHEST_GUID
    end

    for i = 1, castle do
        length = length +1
        bagsGUID[length] = BAG_CASTLE_GUID
    end

    for i = 1, event do
        length = length +1
        bagsGUID[length] = BAG_EVENT_GUID
    end

end