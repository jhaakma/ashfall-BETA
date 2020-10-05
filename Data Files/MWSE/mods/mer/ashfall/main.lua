--[[
    Plugin: ashfall.esp
--]]

if not mwse.loadConfig("ashfall") then
    mwse.saveConfig("ashfall", {})
end


local function initialized()

    if tes3.isModActive("Ashfall.esp") then
        require("mer.ashfall.survival")
        -- load modules
        require ("mer.ashfall.common.common")
        require("mer.ashfall.intro")
        require ("mer.ashfall.scriptTimer")
        --needs
        require("mer.ashfall.needs.waterController")
        require("mer.ashfall.needs.needsTooltips")
        require("mer.ashfall.needs.extremeEffects")
        require("mer.ashfall.needs.diseasedMeat")

        require("mer.ashfall.camping.camping")
        require("mer.ashfall.effects.frostbreath")
        require("mer.ashfall.effects.keybinds")
        require("mer.ashfall.ui.hud")
        require("mer.ashfall.ui.itemTooltips")
        require("mer.ashfall.tempEffects.ratings.ratingEffects")

        require("mer.ashfall.backpackController")
        require("mer.ashfall.merchants.merchantController")
        require("mer.ashfall.merchants.priceController")
        require("mer.ashfall.merchants.waterMerchant")
        require("mer.ashfall.merchants.stewMerchant")
        
        require("mer.ashfall.referenceController")
        local versionFile = io.open("Data Files/MWSE/mods/mer/ashfall/version.txt", "r")
        local version = ""
        for line in versionFile:lines() do -- Loops over all the lines in an open text file
            version = line
        end
        mwse.log("[Ashfall %s] Initialized", version)
    end
end


--Need to initialise faders immediately
require ("mer.ashfall.effects.faderController")

event.register("initialized", initialized)

require("mer.ashfall.MCM.mcm")



