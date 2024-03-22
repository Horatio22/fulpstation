/datum/station_goal/gateway
	name = "Gateway Research Post"
	requires_space = FALSE

/datum/station_goal/gateway/get_report()
	return list(
		"<blockquote>NanoTrasen is interested in expanding our research to a nearby asteroid.",
		"The Gateway is set to the location's coordinates. Clear the area and deploy a research post pod. </blockquote>",
	).Join("\n")


/datum/station_goal/gateway/on_report()
	createRandomZlevel(TRUE)

/datum/station_goal/gateway/check_completion()
	return !isnull(/obj/structure/statue/gold/rd/indestructible)

