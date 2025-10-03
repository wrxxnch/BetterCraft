local S = mesecon.S

-- Torch normal
minetest.register_node("bluestone_torch:torch", {
    description = S("Bluestone Torch"),
    drawtype = "mesh",
    mesh = "torch.obj",
    tiles = {{
        name = "bluestone_torch_animated.png",
        animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2}
    }},
    inventory_image = "bluestone_torch.png",
    wield_image = "bluestone_torch.png",
    use_texture_alpha = "clip",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    light_source = 10,
    walkable = false,
    selection_box = {
        type = "wallmounted",
        wall_top = {-0.1, 0.5, -0.1, 0.1, 0.5, 0.1},
        wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.3, 0.1},
        wall_side = {-0.5, -0.5, -0.1, -0.3, 0.3, 0.1},
    },
    groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1, torch = 1},
    sounds = default.node_sound_wood_defaults(),

    mesecons = {receptor = {
        state = mesecon.state.on,
        rules = mesecon.rules.pplate -- pode usar regras padrão
    }},

    on_blast = mesecon.on_blastnode,
})
