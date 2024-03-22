/mob/living/basic/frog/gateway
	faction = list("gateway")

/mob/living/basic/lizard/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)

/mob/living/basic/cockroach/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)

/mob/living/basic/mega_arachnid/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)

/mob/living/basic/spider/giant/tarantula/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)

/mob/living/basic/leaper/gateway
	faction = list("gateway")
	health = 2500
	maxHealth = 2500

/mob/living/basic/leaper/gateway/Initialize(mapload)
	. = ..()
	var/static/list/death_loot = list(/obj/item/clothing/neck/cloak/frog)

/mob/living/basic/butterfly/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)

/mob/living/basic/snake/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)

/mob/living/basic/seedling/meanie/gateway
	faction = list("gateway")

/mob/living/basic/seedling/gateway
	faction = list("gateway")

/mob/living/carbon/human/species/monkey/gateway
	faction = list("gateway")
	/var/mutantlungs = /obj/item/organ/internal/lungs/lavaland

/mob/living/basic/gorilla/gateway
	faction = list("gateway")
	habitable_atmos = list("min_oxy" = 3, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 15, "min_co2" = 0, "max_co2" = 15, "min_n2" = 0, "max_n2" = 0)



