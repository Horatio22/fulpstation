
/obj/item/survivalcapsule/research
	name = "research post pod"
	desc = "A NanoTrasen research post stored within a pocket of bluespace."
	icon_state = "capsule"
	icon = 'icons/obj/mining.dmi'
	w_class = WEIGHT_CLASS_TINY
	template_id = "research"

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

/obj/item/clothing/neck/cloak/frog
	name = "frog cloak"
	desc = "frog"
	icon_state = "frog_cape"
	icon = 'fulp_modules/features/clothing/neck/neck.dmi'
	worn_icon = 'fulp_modules/features/clothing/neck/neck_worn.dmi'
	resistance_flags = FIRE_PROOF
	worn_icon_state = "frog_cape"
	armor_type = /datum/armor/squid_cloak
