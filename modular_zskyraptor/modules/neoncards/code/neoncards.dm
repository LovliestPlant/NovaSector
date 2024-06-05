#define CHIP_MAX_STACK 15

// MODULAR ADDITIONS
/obj/item/toy/cards/deck
	// Causes child singlecards to be granted the item_scaling element.
	var/bigsprites = FALSE

/obj/item/toy/singlecard/Initialize(mapload, cardname, obj/item/toy/cards/deck/parent_deck)
	. = ..()
	if(istype(parent_deck))
		icon = parent_deck.icon
		greyscale_config = parent_deck.greyscale_config
		greyscale_colors = parent_deck.greyscale_colors
		if(parent_deck.bigsprites == TRUE)
			AddElement(/datum/element/item_scaling, 0.66, 1)

// GAGS LAYOUT: Backs & Joker Suit, Clubs, Spades, Hearts, Diamonds
/obj/item/toy/cards/deck/neon
	name = "neon deck of cards"
	desc = "A deck of space-grade playing cards. These ones are jumbo-sized for readability and have fun, high-contrast designs."
	icon_state = "deck_neon_full"
	deckstyle = "neon"
	greyscale_config = /datum/greyscale_config/playing_cards_neon
	greyscale_colors = "#FFFF00#AAFF00#FFAA00#AA00FF#00AAFF"
	bigsprites = TRUE
	flags_1 = IS_PLAYER_COLORABLE_1

/datum/greyscale_config/playing_cards_neon
	name = "Neon Playing Cards"
	icon_file = 'modular_zskyraptor/modules/neoncards/icons/neoncards.dmi'
	json_config = 'modular_zskyraptor/modules/neoncards/greyscale/neoncards.json'


// == CHIPS BREAKER ==
/datum/greyscale_config/game_chip
	name = "Striped Game Chip"
	icon_file = 'modular_zskyraptor/modules/neoncards/icons/neoncards.dmi'
	json_config = 'modular_zskyraptor/modules/neoncards/greyscale/chips.json'


/obj/item/toy/game_chip
	name = "game chip"
	desc = "A generic chip usable for something like poker. Click with a chip to add it to the stack, click with an empty hand to pick up the whole stack, right-click to remove the top."
	icon_state = "chip_stripe"
	icon = 'modular_zskyraptor/modules/neoncards/icons/neoncards.dmi'
	greyscale_config = /datum/greyscale_config/game_chip
	greyscale_colors = "#FFFFFF"
	flags_1 = IS_PLAYER_COLORABLE_1
	w_class = WEIGHT_CLASS_TINY
	var/stacked_chips = list()

/obj/item/toy/game_chip/attackby(obj/item/item, mob/living/user, params)
	if(istype(item, /obj/item/toy/game_chip))
		var/obj/item/toy/game_chip/chip = item
		if((contents.len >= CHIP_MAX_STACK) || ((chip.contents.len + contents.len) > CHIP_MAX_STACK))
			balloon_alert(user, "Too many chips in the stack!")
		else
			if(!user.transferItemToLoc(chip, src))
				return
			balloon_alert(user, "You add the chip to the stack.")
			contents += chip
			update_chip_overlays(chip)
			if (chip.contents.len)
				for(var/chip_content in chip.contents)
					chip = chip_content
					contents += chip
					update_chip_overlays(chip)
			chip = item
			chip.contents.Cut()
		return
	else if(contents.len)
		var/obj/O = contents[contents.len]
		return O.attackby(item, user, params)
	..()

/obj/item/toy/game_chip/proc/update_chip_overlays(obj/item/toy/game_chip/chip)
	var/mutable_appearance/chip_visual = mutable_appearance(chip.icon, chip.icon_state)
	chip_visual.pixel_x = 0
	chip_visual.pixel_y = 2 * contents.len
	chip_visual.layer = layer + (contents.len * 0.01) + 0.01
	add_overlay(chip_visual)
	update_appearance()

/obj/item/toy/game_chip/attack(mob/target, mob/living/user, params, stacked = TRUE)
	if(user.combat_mode || !contents.len || !stacked)
		return ..()
	var/obj/item/item = contents[contents.len]
	. = item.attack(target, user, params, FALSE)
	update_appearance()

/obj/item/toy/game_chip/attack_hand_secondary(mob/user, list/modifiers)
	if(contents.len <= 0)
		return ..()
	var/obj/item/item = contents[contents.len]
	if(item)
		if(user.put_in_hands(item))
			balloon_alert(user, "You remove the chip from the stack.")
			contents -= item
			update_appearance()
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	return ..()


/obj/item/toy/game_chip/update_icon(updates = ALL)
	if(!(updates & UPDATE_OVERLAYS))
		return ..()

	updates &= ~UPDATE_OVERLAYS
	. = ..() // Don't update overlays. We're doing that here

	if(contents.len < LAZYLEN(overlays))
		overlays -= overlays[overlays.len]
	. |= UPDATE_OVERLAYS



/obj/item/toy/game_chip/stack
	name = "stack of chips"

/obj/item/toy/game_chip/stack/Initialize(mapload)
	. = ..()

	for(var/i in 0 to CHIP_MAX_STACK-1)
		var/obj/item/toy/game_chip/chip = new /obj/item/toy/game_chip(src)
		name = chip.name
		chip.greyscale_colors = greyscale_colors
		contents += chip
		update_chip_overlays(chip)

	update_appearance()

#undef CHIP_MAX_STACK
