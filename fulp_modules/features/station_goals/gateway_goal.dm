

//Station Shield
// A chain of satellites encircles the station
// Satellites be actived to generate a shield that will block unorganic matter from passing it.
/datum/station_goal/gateway
	name = "Gateway Research Post"
	requires_space = FALSE

/datum/station_goal/gateway/get_report()
	return list(
		"<blockquote>NanoTrasen is interested in expanding our research to a nearby asteroid.",
		"The Gateway is set to the location's coordinates. Clear the area and deploy a research post pod.",
		"",
		"You can order the research post pods at cargo.</blockquote>",
	).Join("\n")


/datum/station_goal/gateway/on_report()
	//Unlock
	var/datum/supply_pack/P = SSshuttle.supply_packs[/datum/supply_pack/science/research_pod]
	P.special_enabled = TRUE

	P = SSshuttle.supply_packs[/datum/supply_pack/science/research_pod]
	P.special_enabled = TRUE

/datum/station_goal/gateway/check_completion()
	if(..())
		return TRUE
	return FALSE

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


