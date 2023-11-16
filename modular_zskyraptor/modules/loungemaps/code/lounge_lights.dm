/obj/structure/streetlamp
	icon = 'modular_zskyraptor/modules/loungemaps/icons/lights.dmi'
	icon_state = "streetlamp_on"
	base_icon_state = "streetlamp"
	name = "Street Lamp"
	desc = "Lights up the night and makes towns look cozy."

	///Overlay icon file
	var/overlay_icon = 'modular_zskyraptor/modules/loungemaps/icons/lights.dmi'
	///Base light stats
	var/base_range = 10
	var/base_color = "#FFEEDD"
	var/base_power = 1

	///Is the light on?
	var/on = TRUE

/obj/structure/streetlamp/update_icon_state()
	var/state = "off"
	if(on)
		state = "on"
	icon_state = "[base_icon_state]_[state]"
	update_lighting()

/obj/structure/streetlamp/update_overlays()
	. = ..()
	if(!on)
		return

	. += emissive_appearance(overlay_icon, "[base_icon_state]_overlay", src, alpha = src.alpha, color = light_color)

/obj/structure/streetlamp/proc/update_lighting()
	if(on)
		light_range = base_range
	else
		light_range = 0
	light_color = base_color
	light_power = base_power
