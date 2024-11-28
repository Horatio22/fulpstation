/mob/living/basic/parrot/headsetted/turkey
	name = "\improper turkey"
	desc = "it's that time again."
	icon = 'fulp_modules/features/events/icons/event_icons.dmi'
	icon_state = "turkey_plain"
	icon_living = "turkey_plain"
	icon_dead = "turkey_plain_dead"
	verb_say = "gobbles"
	speak_emote = list("clucks","gobbles")
	density = FALSE
	health = 50
	maxHealth = 50
	melee_damage_lower = 13
	melee_damage_upper = 15
	attack_verb_continuous = "pecks"
	attack_verb_simple = "peck"
	attack_sound = 'fulp_modules/features/events/thanksgiving/turkey.ogg'
	chat_color = "#FFDC9B"
	butcher_results = list(/obj/item/food/meat/slab/chicken/turkey = 2)
	icon_sit = "turkey_plain"

/mob/living/basic/parrot/headsetted/turkey/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
	AddElementTrait(TRAIT_WADDLING, INNATE_TRAIT, /datum/element/waddling)

/obj/item/food/meat/slab/chicken/turkey
	name = "turkey meat"
	icon_state = "birdmeat"
	desc = "A slab of raw turkey. Remember to wash your hands!"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/inverse/healing/tirimol = 5, /datum/reagent/consumable/nutriment = 30) //sleepy and fat
	tastes = list("turkey" = 1)
	starting_reagent_purity = 1

/obj/item/food/meat/slab/chicken/turkey/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/chicken/turkey, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut")

/obj/item/food/meat/slab/chicken/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/chicken/turkey, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe? (no this is chicken)

/obj/item/food/meat/rawcutlet/chicken/turkey
	name = "raw turkey cutlet"
	tastes = list("turkey" = 1)

/obj/item/food/meat/steak/chicken/turkey
	name = "turkey steak"
	icon_state = "birdsteak"
	tastes = list("turkey" = 1)



// Turkey sprite and 'turkey.ogg' ported from Beestation.
// Link to source repository/pull request for ported feature:
// https://github.com/BeeStation/BeeStation-Hornet/pull/851
// Original PR authored by GitHub user "MarkSuckerberg"
