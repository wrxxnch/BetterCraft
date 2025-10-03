-- mapgen.lua unificado
-- Baseado no primeiro arquivo, mas com valores ajustados do segundo

-- Aliases for map generators
minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:river_water_source")

-- Additional aliases needed for mapgen v6
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "default:snowblock")
minetest.register_alias("mapgen_snow", "default:snow")
minetest.register_alias("mapgen_ice", "default:ice")

-- Mantém todos os biomas, ores e decorações do primeiro,
-- mas aqui devem ser substituídos os valores equivalentes do segundo.

-- Exemplo de substituição (Coal):
-- Antes no primeiro:
-- clust_scarcity = 8*8*8, clust_num_ores = 9, y_min=-31000, y_max=31000
-- Agora com valores do segundo:
-- clust_scarcity = 8*8*8, clust_num_ores = 6, y_min=0, y_max=31000

-- TODO: Continuar ajustando todos os ores e biomas equivalentes
-- conforme os parâmetros do segundo arquivo.
