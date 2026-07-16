local shaderPath = os.getenv("HOME") .. "/.config/hypr/shaders/grayscale.frag"

function apply(mainMod)
    hl.bind(mainMod .. " + G", function()
        local current = hl.get_config("decoration.screen_shader")
        if current == shaderPath then
            hl.config({ decoration = { screen_shader = nil } })
        else
            hl.config({ decoration = { screen_shader = shaderPath } })
        end
    end)
end

return { apply = apply }
