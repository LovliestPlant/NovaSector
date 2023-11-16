/obj/structure/streetlamp
	icon = 'modular_zskyraptor/modules/loungemaps/icons/lights.dmi'
	icon_state = "streetlamp_on"
	base_icon_state = "streetlamp"
	name = "street lamp"
	desc = "Lights up the night and makes towns look cozy."

	///Overlay icon file
	var/overlay_icon = 'modular_zskyraptor/modules/loungemaps/icons/lights.dmi'
	///Base light stats
	var/base_range = 7
	var/base_color = "#FFFAF7"
	var/base_power = 1

	///Is the light on?
	var/on = TRUE
	///Because colored lighting is complicated :(
	var/mutable_appearance/light_overlay

/obj/structure/streetlamp/Initialize(mapload)
	. = ..()
	update_icon_state()

/obj/structure/streetlamp/update_icon_state()
	cut_overlays()
	var/state = "off"
	if(on)
		state = "on"
	icon_state = "[base_icon_state]_[state]"
	update_lighting()
	if(on == TRUE)
		if(light_overlay == null)
			light_overlay = new()
		light_overlay.icon_state = "[base_icon_state]_overlay"
		light_overlay.color = light_color
		SET_PLANE_EXPLICIT(light_overlay, ABOVE_LIGHTING_PLANE, src) //gloooooooow
		add_overlay(light_overlay)

/obj/structure/streetlamp/proc/update_lighting()
	if(on == TRUE)
		set_light(l_range = base_range, l_power = base_power, l_color = base_color, l_angle = 360, l_dir = dir)
	else
		set_light(l_range = 0, l_power = base_power, l_color = base_color, l_angle = 360, l_dir = dir)
