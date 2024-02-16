/obj/item/storage/hypospraykit
	name = "hypospray kit"
	desc = "A hypospray kit with foam insets for hypovials & a mounting point on the bottom."
	icon = 'modular_zskyraptor/modules/hyposprays/icons/hypokits.dmi'
	icon_state = "firstaid-mini"
	worn_icon_state = "healthanalyzer" // Get a better sprite later
	inhand_icon_state = "medkit"
	lefthand_file = 'modular_zskyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_l.dmi'
	righthand_file = 'modular_zskyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_r.dmi'
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	var/empty = FALSE
	var/current_case = "firstaid"
	var/static/list/case_designs
	var/static/list/case_designs_xl
	var/is_xl = FALSE

	var/obj/effect/abstract/hypoholder
	var/obj/item/hypospray/mkii/attached_hypo

//Code to give hypospray kits selectable paterns.
/obj/item/storage/hypospraykit/examine(mob/living/user)
	. = ..()
	. += span_notice("Ctrl-Shift-Click to reskin this")
	if(attached_hypo)
		. += span_notice("[attached_hypo] is mounted on the bottom.  Right-click to take it off.")
	else
		. += span_notice("Right-click with a hypospray to mount it.")

/obj/item/storage/hypospraykit/Initialize(mapload)
	. = ..()
	hypoholder = new()
	if(!length(case_designs))
		populate_case_designs()
	atom_storage.max_slots = 7
	atom_storage.can_hold = typecacheof(list(
		/obj/item/hypospray/mkii,
		/obj/item/reagent_containers/cup/vial
	))
	update_icon_state()
	update_icon()


/obj/item/storage/hypospraykit/Destroy()
	for(var/obj/item in contents)
		if(QDELING(loc))
			if(item.resistance_flags & INDESTRUCTIBLE) // Because we're not supposed to delete stuff that are indestructible, but I'm too lazy to do something more complex upstream now. Later, maybe.
				item.forceMove(get_turf(src))
	. = ..()


/obj/item/storage/hypospraykit/proc/populate_case_designs()
	case_designs = list(
		"firstaid" = image(icon = src.icon, icon_state = "firstaid-mini"),
		"brute" = image(icon = src.icon, icon_state = "brute-mini"),
		"burn" = image(icon = src.icon, icon_state = "burn-mini"),
		"toxin" = image(icon = src.icon, icon_state = "toxin-mini"),
		"oxy" = image(icon = src.icon, icon_state = "oxy-mini"),
		"advanced" = image(icon = src.icon, icon_state = "advanced-mini"),
		"buffs" = image(icon = src.icon, icon_state = "buffs-mini"))
	case_designs_xl = list(
		"cmo" = image(icon = src.icon, icon_state = "cmo-mini"),
		"tactical" = image(icon = src.icon, icon_state = "tactical-mini"),
		"naakako" = image(icon = src.icon, icon_state = "naakako-mini"),
		"haki" = image(icon = src.icon, icon_state = "haki-mini"),
		"emt" = image(icon = src.icon, icon_state = "emt-mini"))

/obj/item/storage/hypospraykit/update_overlays()
	. = ..()
	if(attached_hypo)
		var/mutable_appearance/hypo_overlay = mutable_appearance(icon, attached_hypo.icon_state)
		. += hypo_overlay

/obj/item/storage/hypospraykit/attackby_secondary(obj/item/weapon, mob/user, params)
	if(istype(weapon, /obj/item/hypospray/mkii))
		if(attached_hypo != null)
			balloon_alert(user, "Mount point full!  Remove [attached_hypo] first!")
		else
			if(user.transferItemToLoc(weapon, hypoholder))
				attached_hypo = weapon
				balloon_alert(user, "Attached [attached_hypo].")
				update_appearance()
				return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	return ..()

/obj/item/storage/hypospraykit/attack_hand_secondary(mob/user, list/modifiers)
	if(attached_hypo != null)
		if(user.put_in_hands(attached_hypo))
			balloon_alert(user, "Removed [attached_hypo].")
			attached_hypo = null
			update_appearance()
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
		else
			balloon_alert(user, "Couldn't pull the hypo!")
	return ..()

/obj/item/storage/hypospraykit/update_icon_state()
	. = ..()
	icon_state = "[current_case]-mini"

/obj/item/storage/hypospraykit/proc/case_menu(mob/user)
	if(.)
		return
	var/list/designs = case_designs
	if(is_xl)
		designs = case_designs_xl
	var/choice = show_radial_menu(user, src, designs, custom_check = CALLBACK(src, PROC_REF(check_menu), user), radius = 42, require_near = TRUE)
	if(!choice)
		return FALSE
	current_case = choice
	update_icon()

/obj/item/storage/hypospraykit/proc/check_menu(mob/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated() || !user.is_holding(src))
		return FALSE
	return TRUE


/obj/item/storage/hypospraykit/CtrlShiftClick(mob/user, obj/item/I)
	case_menu(user)

//END OF HYPOSPRAY CASE MENU CODE

/obj/item/storage/hypospraykit/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii(src)

/obj/item/storage/hypospraykit/empty
	empty = TRUE


/// CMO hypokit
/obj/item/storage/hypospraykit/cmo
	name = "deluxe hypospray kit"
	desc = "An extended hypospray kit with foam insets for hypovials & a mounting point on the bottom."
	icon_state = "cmo-mini"
	current_case = "cmo"
	is_xl = TRUE
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/hypospraykit/cmo/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 14

/obj/item/storage/hypospraykit/cmo/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/cmo(src)

/obj/item/storage/hypospraykit/cmo/empty
	desc = "An extended hypospray kit with foam insets for hypovials & a mounting point on the bottom."
	empty = TRUE

/obj/item/storage/hypospraykit/cmo/preloaded
	name = "CMO's deluxe hypospray kit"
	desc = "The CMO's precious extended hypospray kit, preloaded with a deluxe hypospray & a handful of vials.  Retains the usual insets and mounting point of smaller hypokits."

/obj/item/storage/hypospraykit/cmo/preloaded/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/cmo(src)
	new /obj/item/reagent_containers/cup/vial/large/deluxe(src)
	new /obj/item/reagent_containers/cup/vial/large/multiver(src)
	new /obj/item/reagent_containers/cup/vial/large/salglu(src)
	new /obj/item/reagent_containers/cup/vial/large/synthflesh(src)



/// Combat hypokit
/obj/item/storage/hypospraykit/cmo/combat
	name = "combat hypospray kit"
	desc = "A larger tactical hypospray kit containing a combat-focused deluxe hypospray and vials."
	icon_state = "emt-mini"
	current_case = "emt"

/obj/item/storage/hypospraykit/cmo/combat/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/cmo/combat(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/numbing(src)



/// Bespoke subtypes for Naaka's Lounge - the Biodome, specifically
/obj/item/storage/hypospraykit/cmo/combat/naaka
	name = "the ko's hypospray kit"
	desc = "A larger tactical hypospray kit containing a customized deluxe hypospray and vials of potent healing mixes."
	icon_state = "naakako-mini"
	current_case = "naakako"

/obj/item/storage/hypospraykit/cmo/combat/naaka/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/cmo/combat/naaka(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/numbing(src)

/obj/item/storage/hypospraykit/cmo/combat/naaka/haki
	name = "hakitchaya's hypospray kit"
	desc = "A larger tactical hypospray kit containing a customized deluxe hypospray and vials of potent healing mixes..and meth."
	icon_state = "haki-mini"
	current_case = "haki"

/obj/item/storage/hypospraykit/cmo/combat/naaka/haki/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/cmo/combat/naaka/haki(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/meth(src)



/// Boxes of empty hypovials
/obj/item/storage/box/vials
	name = "box of hypovials"

/obj/item/storage/box/vials/PopulateContents()
	for(var/vialpath in subtypesof(/obj/item/reagent_containers/cup/vial/small/style))
		new vialpath(src)

/obj/item/storage/box/vials/deluxe
	name = "box of deluxe hypovials"

/obj/item/storage/box/vials/deluxe/PopulateContents()
	for(var/vialpath in subtypesof(/obj/item/reagent_containers/cup/vial/large/style))
		new vialpath(src)

/obj/item/storage/box/hypospray
	name = "box of hypospray kits"

/obj/item/storage/box/hypospray/PopulateContents()
	var/list/case_designs = list("firstaid-mini", "brute-mini", "burn-mini", "toxin-mini", "oxy-mini", "advanced-mini", "buffs-mini")
	for(var/label in case_designs)
		var/obj/item/storage/hypospraykit/newkit = new /obj/item/storage/hypospraykit(src)
		newkit.current_case = label
		newkit.update_icon_state()
