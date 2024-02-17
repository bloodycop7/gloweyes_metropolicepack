if not ( glowEyes ) then
    error("[glowEyes: Metropolice Pack] GlowEyes is not installed!")
end

print("[GlowEyes] Metropolice Pack made by eon (bloodycop)")

glowEyes:Register("models/dpfilms/metropolice/biopolice.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 125, 0), Color(255, 125, 0), Color(255, 125, 0)
    end,
    serverThink = function(self, ent)
        if ( ent.glowEyesTable ) then
            for k, v in ipairs(ent.glowEyesTable) do
                if not ( IsValid(v) ) then
                    continue
                end

                if ( ent:GetSkin() == 1 ) then
                    v:SetNoDraw(true)
                else
                    v:SetNoDraw(false)
                end
            end
        end
    end
})

glowEyes:Register("models/dpfilms/metropolice/c08cop.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(0, 90, 255), Color(0, 90, 255), Color(0, 90, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/civil_medic.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 170, 0), Color(255, 170, 0), Color(255, 170, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/elite_police.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.1
        pos = pos + attachment.Ang:Up() * -0.3
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.1
        leftEyePos = leftEyePos + attachment.Ang:Up() * -0.3
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.1
        rightEyePos = rightEyePos + attachment.Ang:Up() * -0.3
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 170, 0), Color(255, 170, 0), Color(255, 170, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/hl2concept.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/hunter_police.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/phoenix_police.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.1
        pos = pos + attachment.Ang:Up() * 0.2
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.1
        leftEyePos = leftEyePos + attachment.Ang:Up() * 0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.1
        rightEyePos = rightEyePos + attachment.Ang:Up() * 0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 0, 0), Color(255, 0, 0), Color(255, 0, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/police_bt.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 0, 0), Color(255, 0, 0), Color(255, 0, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/police_fragger.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/rogue_police.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.7
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 0, 0), Color(255, 0, 0), Color(255, 0, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/tribal_police.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.6
        pos = pos + attachment.Ang:Up() * -0.2
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        leftEyePos = leftEyePos + attachment.Ang:Up() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        rightEyePos = rightEyePos + attachment.Ang:Up() * -0.2

        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/tron_police.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.6
        pos = pos + attachment.Ang:Up() * -0.2
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * 1.6
        leftEyePos = leftEyePos + attachment.Ang:Up() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * 1.6
        rightEyePos = rightEyePos + attachment.Ang:Up() * -0.2

        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 125, 0), Color(255, 125, 0), Color(255, 125, 0)
    end,
    serverThink = function(self, ent)
        for k, v in ipairs(ent.glowEyesTable) do
            if not ( IsValid(v) ) then
                continue
            end

            if not ( ent:GetSkin() == 1 ) then
                v:SetNoDraw(true)
            else
                v:SetNoDraw(false)
            end
        end
    end
})

glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_biopolice.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/biopolice.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_c08cop.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/c08cop.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_civil_medic.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/civil_medic.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_elite_police.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/elite_police.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/hl2concept.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_hunter_police.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/hunter_police.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_phoenix_police.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/phoenix_police.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_police_bt.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/police_bt.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_police_fragger.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/police_fragger.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_rogue_police.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/rogue_police.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_tribal_police.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/tribal_police.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_tron_police.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/tron_police.mdl"]
glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_tron_police_or.mdl"] = glowEyes.Stored["models/dpfilms/metropolice/tron_police.mdl"]

glowEyes.Stored["models/dpfilms/metropolice/playermodels/pm_tron_police_or.mdl"]["serverThink"] = nil