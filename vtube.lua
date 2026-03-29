VTube = {}

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
}

assert(SMODS.load_file("globals.lua"))()

-- Jokers
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/Jokers/")
for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("Items/Jokers/" .. file))()
end

-- Seals
local seal_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "items/seals/")
for _, file in ipairs(seal_src) do
    assert(SMODS.load_file("items/seals/" .. file))()
end

-- Tarots
local tarot_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/Consumables/Tarots/")
for _, file in ipairs(tarot_src) do
    assert(SMODS.load_file("Items/Consumables/Tarots/" .. file))()
end

-- Tags
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/Tags/")
for _, file in ipairs(tag_src) do
    assert(SMODS.load_file("Items/Tags/" .. file))()
end

-- Editions
local edition_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/Editions/")
for _, file in ipairs(edition_src) do
    assert(SMODS.load_file("Items/Editions/" .. file))()
end

-- Decks
local deck_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/Decks/")
for _, file in ipairs(deck_src) do
    assert(SMODS.load_file("Items/Decks/" .. file))()
end
