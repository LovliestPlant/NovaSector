/datum/design/hypovial
	name = "Hypovial"
	id = "hypovial"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(
		/datum/material/glass = SHEET_MATERIAL_AMOUNT,
		/datum/material/iron = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/reagent_containers/cup/vial
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL,
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/hypovial/large
	name = "Large Hypovial"
	id = "large_hypovial"
	materials = list(
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2,
	)
	build_path = /obj/item/reagent_containers/cup/vial/large

/datum/design/hypokit
	name = "Hypospray Kit"
	id = "hypokit"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT,
		/datum/material/iron = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/storage/hypospraykit/empty
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL,
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL



/// WHY THE FUCK-
/datum/design/pen
	name = "Pen"
	id = "pen"
	build_type = AUTOLATHE
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/pen
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MISC,
	)
