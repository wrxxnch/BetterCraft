-- hand_breakable/init.lua
-- Torna todos blocos quebráveis à mão, mas com tempos diferentes

minetest.register_on_mods_loaded(function()
    for name, def in pairs(minetest.registered_nodes) do
        if def and def.groups then
            local groups = table.copy(def.groups)

            -- Se já é quebrável à mão, não mexe
            if not groups.oddly_breakable_by_hand then
                if groups.cracky then
                    -- pedra/metais: mais demorados
                    groups.oddly_breakable_by_hand = 1
                elseif groups.choppy then
                    -- madeira: médio
                    groups.oddly_breakable_by_hand = 2
                elseif groups.crumbly or groups.snappy then
                    -- terra/areia/plantas: rápido
                    groups.oddly_breakable_by_hand = 3
                else
                    -- qualquer outro bloco não classificado
                    groups.oddly_breakable_by_hand = 2
                end

                minetest.override_item(name, {groups = groups})
            end
        end
    end
end)
