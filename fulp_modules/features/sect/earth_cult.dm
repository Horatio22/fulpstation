/datum/religion_sect/earth
	name = "Earthen God"
	quote = "From the earth you came; to the earth you shall return."
	desc = "The Earth is alive and loves her children. Even here you can feel her heartbeat under your feet."
	tgui_icon = "robot"
	alignment = ALIGNMENT_NEUT
	desired_items = list(/obj/item/reagent_containers = "holding blood", /mob/living/basic/bull)
	//rites_list = list(/datum/religion_rites/pure_heart, /datum/religion_rites/big_cow)
	altar_icon_state = "convertaltar-blue"
	max_favor = 2500

/obj/item/organ/internal/heart/cybernetic/earth
	name = "pure heart"
	desc = "A pure, undying heart that beats in time with the Earth's."
	icon = 'fulp_modules/features/sect/earth-cult.dmi'
	icon_state = "heart-on"
	organ_flags = ORGAN_SYNTHETIC
	maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
	dose_available = FALSE
	emp_vulnerability = 0

/obj/item/organ/internal/heart/cybernetic/earth/Insert(mob/living/carbon/heart_owner, special = FALSE, drop_if_replaced = TRUE)
	. = ..()
	ADD_TRAIT(heart_owner, TRAIT_SPIRITUAL, ORGAN_TRAIT)
	ADD_TRAIT(heart_owner, TRAIT_VIRUSIMMUNE, ORGAN_TRAIT)


/obj/item/organ/internal/heart/cybernetic/earth/Remove(mob/living/carbon/heart_owner, special = FALSE)
	REMOVE_TRAIT(heart_owner, TRAIT_SPIRITUAL, ORGAN_TRAIT)
	REMOVE_TRAIT(heart_owner, TRAIT_VIRUSIMMUNE, ORGAN_TRAIT)
	return ..()




/obj/item/organ/internal/heart/cybernetic/earth/Insert(mob/living/carbon/brain_owner, special, drop_if_replaced, no_id_transfer)
    . = ..()
    if(!ishuman(brain_owner))
        return
    var/mob/living/carbon/human/human_receiver = brain_owner
    var/datum/species/rec_species = human_receiver.dna.species
    rec_species.update_no_equip_flags(brain_owner, rec_species.no_equip_flags | ITEM_SLOT_FEET)

/obj/item/organ/internal/heart/cybernetic/earth/Remove(mob/living/carbon/brain_owner, special, no_id_transfer)
    . = ..()
    UnregisterSignal(brain_owner)
    if(!ishuman(brain_owner))
        return
    var/mob/living/carbon/human/human_receiver = brain_owner
    var/datum/species/rec_species = human_receiver.dna.species
    rec_species.update_no_equip_flags(brain_owner, initial(rec_species.no_equip_flags))
    return ..()

/obj/effect/decal/cleanable/earthsblood
    name = "earthsblood"
    desc = "Life giving and warm."

/obj/effect/decal/cleanable/earthsblood/ex_act()
    return FALSE

/obj/effect/decal/cleanable/earthsblood/filled
    decal_reagent = /datum/reagent/medicine/earthsblood
    reagent_amount = 5

/mob/living/basic/bull
	name = "bull"
	desc = "Sacred in some communities. Dinner in others."
	icon = 'fulp_modules/features/sect/earth-cult.dmi'
	icon_state = "bull"
	icon_living = "bull"
	icon_dead = "cow_dead"
	icon_gib = "cow_gib"
	gender = MALE
	mob_biotypes = MOB_ORGANIC | MOB_BEAST
	speak_emote = list("moos","moos hauntingly")
	speed = 1.1
	see_in_dark = 6
	butcher_results = list(/obj/item/food/meat/slab = 8, /obj/item/stack/sheet/leather = 1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	attack_vis_effect = ATTACK_EFFECT_KICK
	health = 75
	maxHealth = 75
	gold_core_spawnable = FRIENDLY_SPAWN
	blood_volume = BLOOD_VOLUME_NORMAL
	ai_controller = /datum/ai_controller/basic_controller/cow
	var/list/food_types = list(/obj/item/food/grown/wheat)
	var/tame_message = "lets out a happy moo"
	var/self_tame_message = "let out a happy moo"

/mob/living/basic/bull/Initialize(mapload)
	. = ..()

	AddComponent( \
		/datum/component/aura_healing, \
		range = 5, \
		brute_heal = 0.4, \
		burn_heal = 0.4, \
		blood_heal = 0.4, \
		simple_heal = 1.2, \
		requires_visibility = FALSE, \
		limit_to_trait = TRAIT_SPIRITUAL, \
		healing_color = COLOR_VERY_DARK_LIME_GREEN, \
	)

/datum/religion_sect/earth/sect_bless(mob/living/target, mob/living/chap)
	return TRUE

/datum/religion_sect/earth/on_sacrifice(obj/item/reagent_containers/offering, mob/living/user)
	if(!istype(offering))
		return
	var/datum/reagent/blood/wanted_blood = offering.reagents.has_reagent(/datum/reagent/blood)
	var/favor_earned = offering.reagents.get_reagent_amount(/datum/reagent/blood)
	to_chat(user, span_notice("[GLOB.deity] appreciates your blood offering."))
	adjust_favor(favor_earned, user)
	playsound(get_turf(offering), 'sound/items/drink.ogg', 50, TRUE)
	offering.reagents.clear_reagents()
	return TRUE

/datum/religion_rites/earth/pure_heart
	name = "Trade hearts with Mother Earth."
	desc = "Summons a pure heart. Replace your corrupted heart with it to become one with the Earth."
	invoke_msg = "Let us trade hearts, Mother Earth."
	favor_cost = 150

/datum/religion_rites/earth/pure_heart/invoke_effect(mob/living/user, atom/movable/religious_tool)
	..()
	var/altar_turf = get_turf(religious_tool)
	new /obj/item/organ/internal/heart/cybernetic/earth(altar_turf)
	//playsound(get_turf(religious_tool), 'sound/effects/cashregister.ogg', 60, TRUE)
	return TRUE


