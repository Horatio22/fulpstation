
/datum/supply_pack/science/research_pod
	name = "Research Post Pod"
	desc = "Establish a state-of-the-art research post anywhere in the universe! \
		Contains a research post pod."
	cost = CARGO_CRATE_VALUE * 6
	special = TRUE
	access_view = ACCESS_COMMAND
	contains = list(/obj/item/survivalcapsule/research = 1)
	crate_name= "resarch post pod crate"

/obj/item/survivalcapsule/research
	name = "research post pod"
	desc = "A NanoTrasen research post stored within a pocket of bluespace."
	icon_state = "capsule"
	icon = 'icons/obj/mining.dmi'
	w_class = WEIGHT_CLASS_TINY
	template_id = "research"

/datum/map_template/shelter/research
	var/list/allowed_areas

/datum/map_template/shelter/research/New()
	. = ..()
	allowed_areas = typecacheof(/area/awaymission)

/datum/map_template/shelter/research/check_deploy(turf/deploy_location)
    if(!is_away_level(deploy_location.z))
        return SHELTER_DEPLOY_BAD_AREA
    return ..()

//corpses no ID

/datum/outfit/job/engineer/gloved/no_id
	ears = null
	l_pocket = null
	id = null

/obj/effect/mob_spawn/corpse/human/engineer/gateway
	outfit = /datum/outfit/job/engineer/gloved/no_id

//
/obj/structure/statue/gold/rd/indestructible
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

