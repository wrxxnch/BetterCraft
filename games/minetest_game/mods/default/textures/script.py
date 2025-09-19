import os

def renomear_minetest(nome):
    nome = nome.replace(".png", "")
    
    # Árvores e madeira
    if "log" in nome:
        return f"default_{nome.replace('_log', '_wood')}.png"
    if "leaves" in nome:
        return f"default_{nome}_simple.png"
    if "sapling" in nome:
        return f"default_{nome}.png"
    
    # Portas e trapdoors
    if "door" in nome or "trapdoor" in nome:
        return f"default_{nome}.png"
    
    # Blocos comuns
    if "stone" in nome or "dirt" in nome or "sand" in nome or "clay" in nome:
        return f"default_{nome}.png"
    
    # Minérios
    if "ore" in nome or "block" in nome:
        return f"default_{nome}.png"
    
    # Vidros coloridos
    cores = ["black","blue","brown","cyan","gray","green","light_blue","light_gray",
             "lime","magenta","orange","pink","purple","red","white","yellow"]
    for cor in cores:
        if cor in nome and "glass" in nome:
            return f"default_{cor}_glass.png"
    
    # Caso geral
    return f"default_{nome}.png"

# Exemplo de pasta com arquivos
pasta = "."

for arquivo in os.listdir(pasta):
    if arquivo.endswith(".png"):
        novo_nome = renomear_minetest(arquivo)
        os.rename(os.path.join(pasta, arquivo), os.path.join(pasta, novo_nome))
        print(f"{arquivo} -> {novo_nome}")

