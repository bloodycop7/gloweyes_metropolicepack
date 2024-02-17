if not ( glowEyes ) then
    error("[glowEyes: Metropolice Pack] GlowEyes is not installed!")
end

print("[GlowEyes] Metropolice Pack made by eon (bloodycop)")

local eyeMaterialFallBack = Material("sprites/light_glow02_add", "smooth nomips clamp")
glowEyes:Register("models/dpfilms/metropolice/hl2concept.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2

        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 5
    end,
    sizeHeight = function(self, ent)
        return 4
    end,
    color = function(self, ent)
        return Color(0, 205, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/police_bt.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(255, 0, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/c08cop.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(0, 130, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/civil_medic.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(255, 175, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/elite_police.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.2
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.2
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 3.5
    end,
    sizeHeight = function(self, ent)
        return 3
    end,
    color = function(self, ent)
        return Color(255, 145, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/hunter_police.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(0, 135, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/phoenix_police.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 3.5
    end,
    sizeHeight = function(self, ent)
        return 3
    end,
    color = function(self, ent)
        return Color(255, 0, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/police_fragger.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(0, 135, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/rogue_police.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(255, 0, 0)
    end
})

glowEyes:Register("models/dpfilms/metropolice/tribal_police.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(0, 205, 255)
    end
})

glowEyes:Register("models/dpfilms/metropolice/biopolice.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        return Color(253, 255, 136)
    end,
    shouldDraw = function(self, ent)
        return ent:GetSkin() == 0
    end
})

glowEyes:Register("models/dpfilms/metropolice/tron_police.mdl", {
    position = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * 1.8
        pos = pos + attachment.Ang:Up() * -0.2

        return pos
    end,
    postDraw = function(self, ent)
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))

        if not ( attachment ) then
            return
        end

        pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * 1.8
        pos = pos + attachment.Ang:Right() * -1.8
        pos = pos + attachment.Ang:Up() * -0.2
        
        render.SetMaterial( ( isfunction(self.material) and self:material(ent) ) or eyeMaterialFallBack )
        render.DrawSprite(pos, ( isfunction(self.sizeWidth) and self:sizeWidth(ent) ) or 5, ( isfunction(self.sizeHeight) and self:sizeHeight(v) ) or 5, ( isfunction(self.color) and self:color(ent) ) or color_white)
    end,
    sizeWidth = function(self, ent)
        return 6
    end,
    sizeHeight = function(self, ent)
        return 5
    end,
    color = function(self, ent)
        if ( ent:GetSkin() == 0 ) then
            return Color(75, 220, 255)
        end

        return Color(253, 255, 136)
    end,
})

for k, v in pairs(glowEyes.Stored) do
    if ( string.lower(k):find("dpfilms") ) then
        local modelName = string.Replace(k, "models/dpfilms/metropolice/", "")
        modelName = string.Replace(modelName, ".mdl", "")

        local pm = "models/dpfilms/metropolice/playermodels/pm_" .. modelName .. ".mdl"

        glowEyes:Register(pm, v)
    end
end