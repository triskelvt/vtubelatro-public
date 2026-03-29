return {
    descriptions = {
        Joker = {
            j_vtb_beefquake_bonk = {
                name = "Beef Bonk!",
                text = {
                    "{C:attention}Steel Cards{} trigger",
                    "their effect {C:attention}twice{}."
                }
            },
            j_vtb_hanako_management = {
                name = "Hanako's Management",
                text = {
                    "{X:mult,C:white} X1 {} Mult for each",
                    "{C:attention}Vtuber Joker{} owned",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive}Mult)"
                }
            },
            j_vtb_lumoria_pick = {
                name = "Lumoria's Pick",
                text = {
                    "At the start of each {C:attention}Blind{},",
                    "fixate on a random {C:attention}suit{}.",
                    "Each scored card of that suit",
                    "gives {C:mult}+#1#{} Mult",
                    "{C:inactive}(Currently: {C:attention}#2#{C:inactive})"
                }
            },
            j_vtb_daz_graverobber = {
                name = "Daz the Graverobber",
                text = {
                    "Gain {C:attention}+1{} Joker slot",
                    "for each {C:attention}Boss Blind{}",
                    "defeated",
                    "{C:inactive}(Currently {C:attention}+#1#{C:inactive} slots)"
                }
            },
            j_vtb_mono_feast = {
                name = "Mono's Feast",
                text = {
                    "If {C:attention}5{} cards are played,",
                    "gain {X:mult,C:white}+X#1#{} Mult permanently.",
                    "Otherwise, lose {X:mult,C:white}-X#2#{} Mult.",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                }
            },
            j_vtb_yanichii_adherence = {
                name = "Yanichii's Adherence",
                text = {
                    "Every {C:attention}#2#{} played cards,",
                    "gain {C:mult}+1{} Mult permanently",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult,",
                    "{C:inactive}{C:attention}#3#{C:inactive}/{C:attention}#2#{C:inactive} cards)"
                }
            },
            j_vtb_wifipunk_ping = {
                name = "WiFiPunk's Ping",
                text = {
                    "If the {C:attention}played hand{} matches",
                    "the {C:attention}previous hand{} this round,",
                    "gain {C:chips}+#1#{} Chips",
                    "{C:inactive}(Last: {C:attention}#2#{C:inactive})"
                }
            },
            j_vtb_lyzui_block = {
                name = "Lyzui's Block",
                text = {
                    "Hands played without discarding",
                    "grant {C:attention}+1 Sketch{}",
                    "Discarding cashes in all Sketches",
                    "for {C:chips}+#1#{} Chips{} each, then resets",
                    "{C:inactive}(#2# Sketches = {C:chips}+#3#{C:inactive} Chips)"
                }
            },
            j_vtb_chinchillada_stash = {
                name = "Chinchilladas' Stash",
                text = {
                    "Each time a card is {C:attention}sold{},",
                    "store its sell value",
                    "as {C:mult}+1 Mult{} per {C:money}$1{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                }
            },
            j_vtb_dinkityz_rush = {
                name = "Dinkityzs' Rush",
                text = {
                    "Each hand played after the",
                    "{C:attention}3rd{} in a round gives",
                    "{X:mult,C:white}+#1#X{} Mult permanently",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_vtb_hanyachi_cunning = {
                name = "Hanyachi's Cunning",
                text = {
                    "If the played hand contains",
                    "no {C:attention}Face Cards{},",
                    "gain {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult"
                }
            },
            j_vtb_jacknyeko_9_lives = {
                name = "Jacknyeko's Nine Lives",
                text = {
                    "Gives {C:mult}+#1#{} Mult per life remaining.",
                    "Loses {C:attention}1{} life at the end of each {C:attention}Blind{}.",
                    "When all lives are lost, this Joker is {C:red}destroyed{}",
                    "{C:inactive}(#2# lives remaining, {C:mult}+#3# {C:inactive}Mult)"
                }
            },
            j_vtb_keebler_die = {
                name = "Keebler's Die",
                text = {
                    "At the start of each {C:attention}Blind{}, roll a {C:attention}d6{}.",
                    "{C:red}1{}: Destroy a random {C:attention}Joker{}.",
                    "{C:inactive}2{}: Nothing.",
                    "{C:chips}3{}: {C:chips}+#4#{} Chips{} per hand this Blind.",
                    "{C:chips}4-5{}: {C:chips}+#1#{} Chips{} per hand this Blind.",
                    "{C:mult}6{}: {X:mult,C:white}X#2#{} Mult{} per hand this Blind",
                    "{C:inactive}(Last roll: {C:attention}#3#{C:inactive})"
                }
            },
            j_vtb_laeyna_reserve = {
                name = "Laeyna's Reserve",
                text = {
                    "At end of each {C:attention}Round{},",
                    "gain {X:mult,C:white}+X#1#{} Mult per",
                    "{C:attention}hand{} remaining permanently.",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_vtb_tonyo = {
                name = "Tonyo's Soul",
                text = {
                    "At the start of each {C:attention}round{},",
                    "if there is an empty {C:attention}Joker slot{},",
                    "{C:green}#1# in #2#{} chance to create a",
                    "random {C:spectral}Spectral{} card",
                    "{C:inactive}(Must have room)"
                }
            },
            j_vtb_smugalana_duality = {
                name = "SmugAlana's Duality",
                text = {
                    "{C:inactive}[#1#]{}",
                    "{C:attention}Frost{}: Scored {C:spades}Spades{}/{C:clubs}Clubs{}",
                    "give {C:chips}+#2#{} Chips.",
                    "{C:attention}Fire{}: Each hand gives {C:mult}+#3#{} Mult.",
                    "Switches form at {C:attention}end of every round{}"
                }
            },
            j_vtb_makkiatto_regrowth = {
                name = "Makkiatto's Regrowth",
                text = {
                    "Gain {C:mult}+#1#{} Mult permanently",
                    "each time a {C:attention}playing card{} is destroyed",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_vtb_flaers_ace = {
                name = "Flaer's Ace",
                text = {
                    "Each played {C:attention}Ace{} gives {C:mult}+#1#{} Mult",
                    "and has a {C:green}1 in #2#{} chance to",
                    "gain a random {C:attention}Seal{}.",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
                }
            },
            j_vtb_triskel_masks = {
                name = "Triskel's Masks",
                text = {
                    "{C:attention}Jester{}: {C:mult}+#1#{} to {C:mult}+#2#{} Mult",
                    "{C:attention}Plague Doctor{}: {C:chips}+#3#{} Chips",
                    "{C:attention}Demon{}: {X:mult,C:white} X#4# {} Mult, {C:money}-$1{}",
                    "{C:inactive}(Active: {C:attention}#5#{C:inactive})"
                }
            },
            j_vtb_meiwi_vigil = {
                name = "Meiwi's Vigil",
                text = {
                    "Gain {C:mult}+#1#{} Mult permanently",
                    "each {C:attention}Blind{} completed",
                    "without {C:attention}discarding{}.",
                    "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)"
                }
            },
            j_vtb_mookei_yapping = {
                name = "Mookei's Yapping",
                text = {
                    "Each {C:attention}hand{} played this Blind",
                    "gives {C:mult}+#1#{} more Mult",
                    "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)"
                }
            },
            j_vtb_kompie = {
                name = "Kompie's Luck",
                text = {
                    "Cards held in hand that",
                    "score have a {C:green}1 in #1#{}",
                    "chance to retrigger"
                }
            },
            j_vtb_kaien = {
                name = "Kaien's Support",
                text = {
                    "{C:clubs}Club{} cards held in hand",
                    "add their {C:chips}Chips{} to",
                    "the played hand"
                }
            },
            j_vtb_reina_clock = {
                name = "Reina's Clock",
                text = {
                    "Each hand has a {C:green}1 in #1#{} chance",
                    "to {C:attention}fracture{}: all scored",
                    "cards are {C:attention}retriggered{} once.",
                    "{C:inactive}(Fractures: {C:attention}#2#{C:inactive})"
                }
            },
            j_vtb_shogun_shapeshift = {
                name = "Shogun's Shapeshift",
                text = {
                    "At the start of each blind,",
                    "transforms into a {C:attention}random Edition{}",
                    "{C:inactive}(Except {C:dark_edition}Negative{C:inactive})"
                }
            },
            j_vtb_hype_train = {
                name = "Hype Train",
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult for every",
                    "{C:attention}Vtuber Joker{} to the left of this card.",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_vtb_mercury_orbit = {
                name = "Mercury's Orbit",
                text = {
                    "If played hand is a {C:attention}Flush Five{}, create a",
                    "random {C:spectral}Spectral{} card.",
                    "{C:inactive}(Must have room)"
                }
            },
            j_vtb_mimi_card = {
                name = "Mimi's Virtue",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for every {C:attention}Mimi Seal{} in your",
                    "deck. {C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive})"
                },
                label = 'Mimi Saturniidae'
            },
            j_vtb_kiiro_whisper = {
                name = "Kiiro's Whisper",
                text = {
                    "Played cards with rank {C:attention}5 or lower{}",
                    "give {C:chips}+#1#{} Chips each.",
                    "If {C:attention}all{} played cards are rank",
                    "{C:attention}5 or lower{}, also give {X:mult,C:white} X#2# {} Mult"
                }
            },
            j_vtb_kyuuons_gamble = {
                name = "Kyuuon's Gamble",
                text = {
                    "{C:green}#1# in #2#{} chance to {C:chips}Double{} all Chips,",
                    "but {C:green}#1# in #3#{} chance to",
                    "set hand score to {C:red}0{}"
                }
            },
            j_vtb_melka_bite = {
                name = "Melka's Bite",
                text = {
                    "Played {C:hearts}Hearts{} have a {C:green}#1# in #2#{} chance",
                    "to be {C:red}destroyed{} when scored.",
                    "Gains {X:mult,C:white} X#3# {} Mult per card destroyed.",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)"
                }
            },
            j_vtb_snackerwheel = {
                name = "Snackerwheel",
                text = {
                    "Each {C:tarot}Wheel of Fortune{} use",
                    "gives {X:mult,C:white}+0.25x{} Mult.",
                    "If the wheel {C:green}succeeds{},",
                    "gives {X:mult,C:white}+0.5x{} Mult instead",
                    "{C:inactive}(Currently {X:mult,C:white}x#1# {C:inactive}Mult)"
                }
            },
            j_vtb_nico_nectar = {
                name = "Nico's Nectar",
                text = {
                    "Gives an extra {C:money}$#1#{} interest for",
                    "every {C:money}$#2#{} held at end of round.",
                    "{C:green}#3# in #4#{} chance this card",
                    "{C:red}breaks{} at the end of round."
                }
            },
            j_vtb_pardoky_bag = {
                name = "Pardo's Paper Bag",
                text = {
                    "If played hand is a {C:attention}Five of a Kind{},",
                    "create a random",
                    "{C:dark_edition}Negative{} {C:legendary}Legendary Joker{}"
                }
            },
            j_vtb_sprout_tour = {
                name = "Sprout's Tour",
                text = {
                    "Gains {X:mult,C:white} X#1# {} Mult when",
                    "a {C:attention}Boss Blind{} is defeated.",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_vtb_sakuyoi_devourer = {
                name = "Sakuyoi, The Devourer",
                text = {
                    "At the start of each {C:attention}Big Blind{},",
                    "consumes the leftmost {C:tarot}Consumable{}.",
                    "{C:tarot}Tarot{} gives {X:mult,C:white}+#1#X{} Mult,",
                    "{C:planet}Planet{} gives {X:mult,C:white}+#2#X{} Mult.",
                    "If none, destroys leftmost {C:attention}Joker{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#3# {C:inactive}Mult)"
                }
            },
            j_vtb_dashie_stardust = {
                name = "Dashie's Stardust",
                text = {
                    "{X:mult,C:white}+X#1#{} Mult for each card",
                    "with {C:dark_edition}Hyped{} edition in your {C:attention}full deck{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_vtb_scylla_devotion = {
                name = "Scylla's Devotion",
                text = {
                    "Each {C:attention}Joker{} to the {C:mult}left{}",
                    "gives {X:mult,C:white}+#1#X{} Mult to this card",
                    "Each {C:attention}Joker{} to the {C:chips}right{}",
                    "gives {C:chips}+#2#{} Chips",
                    "{C:inactive}(Currently {X:mult,C:white}X#3# {C:inactive}Mult,",
                    "{C:inactive}{C:chips}+#4# {C:inactive}Chips)"
                }
            },
            j_vtb_bloody_aki = {
                name = "Bloody Aki",
                text = {
                    "Each scored {C:hearts}Ace of Hearts{} gives {C:mult}+2{} Mult.",
                    "Earn {C:money}$5{} if played hand",
                    "is a {C:hearts}Flush of Hearts{}.",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                }
            },
            j_vtb_spookyushii_card = {
                name = "Spooky's Suits",
                text = {
                    "Gains {C:mult}+#1#{} Mult if played hand",
                    "contains exactly {C:attention}2{} different suits.",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                },
                label = 'Chef de Cuisine'
            },
            j_vtb_cozymammoth_card = {
                name = "Cozy's Exile",
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "{C:attention}empty Joker slot{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_vtb_milis_glow = {
                name = "Milis's Glow",
                text = {
                    "{C:chips}+#1#{} Chips for each scored {C:hearts}Heart{}",
                    "{C:mult}+#2#{} Mult for each scored {C:spades}Spade{}"
                }
            },
            j_vtb_enzio_card = {
                name = "Enzio's Round",
                text = {
                    "At end of round, gain {C:money}$#1#{}",
                    "for each {C:attention}unused discard{}"
                }
            },
            j_vtb_rashiira_sketch = {
                name = "Rashiira's Sketch",
                text = {
                    "At end of round, a random card",
                    "in hand gains a random {C:dark_edition}Edition{}",
                    "if it has no {C:attention}edition{}"
                }
            },
            j_vtb_sarbi_projection = {
                name = "Sarbi's Projection",
                text = {
                    "Each scoring card has a {C:green}1 in #1#{}",
                    "chance to gain {C:dark_edition}Polychrome{}",
                    "if it has no {C:attention}edition{}"
                }
            },
            j_vtb_gyaru_mixup = {
                name = "Gyaru's Mixup",
                text = {
                    "{C:mult}+#1#{} Mult when you play a",
                    "{C:attention}different hand type{} than",
                    "your previous hand this round"
                }
            },
            j_vtb_romanticxlily_card = {
                name = "Lily's Grudge",
                text = {
                    "{C:mult}+#1#{} Mult for each {C:attention}hand{}",
                    "already played this round",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_vtb_skibi_swarm = {
                name = "SkiBi's Swarm",
                text = {
                    "{C:chips}+#1#{} Chips for each card in",
                    "your {C:attention}full hand{} (played + held)",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_vtb_rickynyanheart_card = {
                name = "Ricky's Yap",
                text = {
                    "After each {C:attention}hand{} played,",
                    "permanently gain {C:chips}+#1#{} Chips",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_vtb_pierrot_tent = {
                name = "Pierrot's Tent",
                text = {
                    "{C:attention}+1{} hand size for every",
                    "{C:attention}#1#{} hands you start the round with",
                    "If you finish a round with",
                    "{C:attention}0 hands{} remaining, lose {C:money}$#2#{}",
                    "{C:inactive}(Currently {C:attention}+#3#{C:inactive} hand size)"
                }
            },
            j_vtb_kida_touch = {
                name = "Kida's Touch",
                text = {
                    "Played {C:attention}Gold Cards{} have a",
                    "{C:green}#1# in #2#{} chance to gain a {C:attention}random Seal{},",
                    "and a {C:green}#1# in #3#{} chance to be {C:red}destroyed{}"
                }
            },
        },
        Back = {
            b_vtb_kick = {
                name = "Kick Deck",
                text = {
                    "Start with a random",
                    "{C:dark_edition}Negative{} {C:attention}VTuber{} Joker",
                    "Deck contains only",
                    "{C:diamonds}Diamonds{} and {C:spades}Spades{}"
                }
            },
            b_vtb_twitch = {
                name = "Twitch Deck",
                text = {
                    "Start with {C:attention}2{} random",
                    "{C:attention}VTuber{} Jokers,",
                    "one has {C:dark_edition}Hyped{} edition",
                    "Deck contains only",
                    "{C:hearts}Hearts{} and {C:clubs}Clubs{}"
                }
            },
            b_vtb_collab = {
                name = "Collab Deck",
                text = {
                    "All {C:attention}4{} suits per rank,",
                    "shuffled {C:attention}randomly{}",
                    "{C:attention}2{} random {C:attention}VTuber{} Jokers",
                    "but only {C:attention}4{} Joker slots",
                    "Start with {C:money}$1{} to {C:money}$10{}"
                }
            },
        },
        Tag = {
            tag_vtb_kick_tag = {
                name = "Kick",
                text = {
                    "Next {C:attention}Shop{} has a",
                    "free {C:dark_edition}Negative{} {C:attention}Vtuber Joker{}"
                }
            },
            tag_vtb_myoshi = {
                name = "MyOshi",
                text = {
                    "If a {C:attention}Vtuber Joker{} appears",
                    "in the next {C:attention}Shop{}, get a",
                    "free random {C:attention}Vtuber Joker{}",
                    "{C:inactive}(if there is room)"
                }
            },
            tag_vtb_clip_tag = {
                name = "Clip",
                text = {
                    "Adds a random {C:dark_edition}Edition{}",
                    "to all {C:attention}Jokers{} without one"
                }
            },
            tag_vtb_youtube_live = {
                name = "Youtube",
                text = {
                    "Next {C:attention}Shop{} has a",
                    "free {C:attention}Vtuber Joker{}"
                }
            },
            tag_vtb_twitch_tag = {
                name = "Twitch",
                text = {
                    "Next {C:attention}Shop{} has a",
                    "free {C:dark_edition}Hyped{} {C:attention}Joker{}"
                }
            },
            tag_vtb_raid_tag = {
                name = "Raid",
                text = {
                    "On pick, gain {C:money}$3{}",
                    "for each {C:attention}Vtuber Joker{} owned"
                }
            },
        },
        Tarot = {
            c_wheel_of_fortune = {
                name = "The Wheel of Fortune",
                text = {
                    "{C:green}#1# in #2#{} chance to add a",
                    "random {C:attention}Edition{} to a",
                    "random {C:attention}Joker{}"
                }
            },
            c_vtb_mimi_tarot = {
                name = "Mimi's Bless",
                text = {
                    "Add a {C:attention}Mimi Seal{} to",
                    "up to {C:attention}2{} selected cards",
                    "in your hand"
                }
            },
            c_vtb_the_bits = {
                name = "The Bits",
                text = {
                    "Add a {C:attention}Bits Seal{} to",
                    "up to {C:attention}2{} selected cards",
                    "in your hand"
                }
            },
            c_vtb_blank = {
                name = "Blank",
                text = {
                    "Add a {C:attention}Follower Seal{} to",
                    "{C:attention}1{} selected card",
                    "in your hand"
                }
            },
        },
        Edition = {
            e_vtb_hyped = {
                name = "Hyped",
                text = {
                    "{C:money}+$5{}"
                }
            },
            e_vtb_debut = {
                name = "Debut",
                text = {
                    "{C:chips}-5{} Chips, {C:mult}+5{} Mult"
                }
            },
            e_vtb_glitched = {
                name = "Glitched",
                text = {
                    "{C:green}1 in 2{} chance to retrigger",
                    "{C:green}1 in 8{} chance to destroy"
                }
            },
        },
        Other = {
            vtb_bits_seal = {
                name = "Bits Seal",
                text = {
                    "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, and",
                    "{C:money}$#3#{} for each {C:attention}Vtuber Joker{}",
                    "{C:inactive}(when played){}"
                },
                label = 'Bits Seal'
            },
            vtb_follower_seal = {
                name = "Follower Seal",
                text = {
                    "Gives {C:chips}+#1#{} Chips when scored.",
                    "Increases by {C:chips}+10{} Chips each play"
                },
                label = 'Follower Seal'
            },
            vtb_mimi_seal = {
                name = "Mimi Seal",
                text = {
                    "Gives {C:money}$#1#{} when scored.",
                    "Increases by {C:money}$1{} per score.",
                    "{C:green}#2# in 4{} chance to destroy card"
                },
                label = 'Mimi Seal'
            },
        },
    },
    misc = {
        labels = {
            vtb_hyped = "Hyped",
            vtb_debut = "Debut",
            vtb_glitched = "Glitched",
            vtb_bits_seal = "Bits Seal",
            vtb_follower_seal = "Follower Seal",
            vtb_mimi_seal = "Mimi Seal",
        },
    }
}
