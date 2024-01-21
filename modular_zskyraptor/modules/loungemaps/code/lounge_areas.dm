/// =============
/// BIODOME AREAS
/// =============
/area/centcom/biodome
	icon = 'modular_zskyraptor/modules/loungemaps/icons/areas.dmi'
	icon_state = "biodome"
	name = "Talon IV-a Biodome"
	static_lighting = TRUE
	requires_power = FALSE
	ambience_index = AMBIENCE_GENERIC
	sound_environment = SOUND_AREA_STANDARD_STATION
	has_gravity = STANDARD_GRAVITY

/area/centcom/biodome/interior
	icon_state = "biodome_interior"
	name = "The Biodome"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/centcom/biodome/exterior
	icon_state = "biodome_exterior"
	name = "Talon IV-a"
	sound_environment = SOUND_AREA_LAVALAND
	ambience_index = AMBIENCE_ICEMOON
	ambient_buzz = 'sound/ambience/magma.ogg'

/area/centcom/biodome/arrivals
	icon_state = "biodome_arrivals"
	name = "Biodome Arrivals"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/arrivals/pad1
	icon_state = "biodome_pad1"
	name = "Biodome Pad 1"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/arrivals/pad2
	icon_state = "biodome_pad2"
	name = "Biodome Pad 2"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/// MEDBAY
/area/centcom/biodome/medical
	icon_state = "biodome_medbay"
	name = "Biodome Hospital"
	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS

/area/centcom/biodome/medical/lobby
	icon_state = "biodome_medbay_lobby"
	name = "Biodome Hospital Lobby"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/centcom/biodome/medical/chemistry
	icon_state = "biodome_medbay_chemistry"
	name = "Biodome Hospital Chemlab"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/centcom/biodome/medical/pharmacy
	icon_state = "biodome_medbay_pharmacy"
	name = "Biodome Hospital Pharmacy"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/medical/offices
	icon_state = "biodome_medbay_offices"
	name = "Biodome Hospital Offices"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/medical/surgery
	icon_state = "biodome_medbay_surgery"
	name = "Biodome Hospital Treatment Centre"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/medical/icu
	icon_state = "biodome_medbay_icu"
	name = "Biodome Hospital ICU"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/// ENGINEERING
/area/centcom/biodome/engineering
	icon_state = "biodome_engineering"
	name = "Biodome Engineering"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/centcom/biodome/engineering/engine
	icon_state = "biodome_engineering"
	name = "Biodome Engine Room"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/centcom/biodome/engineering/atmos
	icon_state = "biodome_engineering"
	name = "Biodome Engine Room"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/// CARGO
/area/centcom/biodome/cargo
	icon_state = "biodome_cargo"
	name = "Biodome Cargo"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/centcom/biodome/cargo/pad
	icon_state = "biodome_cargo_pad"
	name = "Biodome Cargo Pad"

/// APARTMENTS
/area/centcom/biodome/apartments
	icon_state = "biodome_apartments"
	name = "Biodome Apartments"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/centcom/biodome/apartments/apartment1
	icon_state = "biodome_apartment1"
	name = "Biodome Apartment 1"

/area/centcom/biodome/apartments/apartment2
	icon_state = "biodome_apartment1"
	name = "Biodome Apartment 2"

/area/centcom/biodome/apartments/apartment3
	icon_state = "biodome_apartment1"
	name = "Biodome Apartment 3"

/area/centcom/biodome/apartments/apartment4
	icon_state = "biodome_apartment1"
	name = "Biodome Apartment 4"

/area/centcom/biodome/apartments/bigapartment1
	icon_state = "biodome_bigapartment1"
	name = "Biodome Deluxe Apartment 1"

/area/centcom/biodome/apartments/bigapartment2
	icon_state = "biodome_bigapartment2"
	name = "Biodome Deluxe Apartment 2"

/// APARTMENTS
/area/centcom/biodome/townhall
	icon_state = "biodome_townhall"
	name = "Biodome Town Hall"
	ambientsounds = list(
		'sound/ambience/signal.ogg',
		)
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/centcom/biodome/townhall/meeting
	icon_state = "biodome_townhall_meeting"
	name = "Biodome Town Meeting Room"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/// SERVICE
/area/centcom/biodome/service
	icon_state = "biodome_service"
	name = "Biodome Service Hall"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/centcom/biodome/service/botany
	icon_state = "biodome_service_botany"
	name = "Biodome Botany"

/area/centcom/biodome/service/diner
	icon_state = "biodome_service_diner"
	name = "Biodome Diner"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/service/bar
	icon_state = "biodome_service_bar"
	name = "Biodome Bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/service/lounge
	icon_state = "biodome_service_lounge"
	name = "Biodome Lounge"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/service/theatre
	icon_state = "biodome_service_theatre"
	name = "Biodome Theatre"

/area/centcom/biodome/service/library
	icon_state = "biodome_service_library"
	name = "Biodome Library"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/// THE VOX BOX
/area/centcom/biodome/voxbox
	icon_state = "biodome_voxbox"
	name = "Biodome Voxbox"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/centcom/biodome/voxbox/atmos
	icon_state = "biodome_voxbox_atmos"
	name = "Biodome Voxbox Atmospherics"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/centcom/biodome/voxbox/atmos/overseer
	icon_state = "biodome_voxbox_atmosapt"
	name = "Biodome Voxbox Overseer Quarters"
	ambience_index = AMBIENCE_GENERIC
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/centcom/biodome/voxbox/apartment1
	icon_state = "biodome_voxbox_apartment1"
	name = "Biodome Voxbox 1"

/area/centcom/biodome/voxbox/apartment2
	icon_state = "biodome_voxbox_apartment2"
	name = "Biodome Voxbox 2"

/area/centcom/biodome/voxbox/apartment3
	icon_state = "biodome_voxbox_apartment3"
	name = "Biodome Voxbox 3"

/area/centcom/biodome/voxbox/apartment4
	icon_state = "biodome_voxbox_apartment4"
	name = "Biodome Voxbox 4"

/// SCIENCE
/area/centcom/biodome/science
	icon_state = "biodome_science"
	name = "Biodome R&D"
	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS

/area/centcom/biodome/science/genetics
	icon_state = "biodome_science_genetics"
	name = "Biodome Genetics"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/science/robotics
	icon_state = "biodome_science_robotics"
	name = "Biodome Robotics"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/// SECURITY
/area/centcom/biodome/security
	icon_state = "biodome_security"
	name = "Biodome Security"
	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/security/cell1
	icon_state = "biodome_security_cell1"
	name = "Biodome Holding Cell 1"

/area/centcom/biodome/security/cell2
	icon_state = "biodome_security_cell2"
	name = "Biodome Holding Cell 2"

/area/centcom/biodome/security/syndicat
	icon_state = "biodome_security_syndicat"
	name = "Syndi-Cat's Hideout"



/// =============
/// BIODOME HOME AREAS
/// =============
/area/centcom/biodome/homes
	icon_state = "biohome"
	name = "Biodome Home"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/// NAAKA & RANYA KO'S HOME
/area/centcom/biodome/homes/casa_de_ko
	icon_state = "biohome_naaka"
	name = "Casa de Ko"
	ambience_index = AMBIENCE_MEDICAL
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS

/area/centcom/biodome/homes/casa_de_ko/bed1
	icon_state = "biohome_naaka_bed1"
	name = "Casa de Ko: Master Bedroom"

/area/centcom/biodome/homes/casa_de_ko/bed2
	icon_state = "biohome_naaka_bed2"
	name = "Casa de Ko: Bedroom 1"

/area/centcom/biodome/homes/casa_de_ko/bed3
	icon_state = "biohome_naaka_bed3"
	name = "Casa de Ko: Bedroom 2"

/area/centcom/biodome/homes/casa_de_ko/medbay
	icon_state = "biohome_naaka_medbay"
	name = "Casa de Ko: Private Medbay"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/homes/casa_de_ko/lounge
	icon_state = "biohome_naaka_lounge"
	name = "Casa de Ko: Lounge"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/// NIKSHTA KO-KORNA & OTTO RENGO'S HOME
/area/centcom/biodome/homes/casa_de_korna
	icon_state = "biohome_nikshta"
	name = "Casa de Korna"
	ambience_index = AMBIENCE_MEDICAL
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/homes/casa_de_korna/bed1
	icon_state = "biohome_nikshta_bed1"
	name = "Casa de Korna: Master Bedroom"

/area/centcom/biodome/homes/casa_de_korna/bed2
	icon_state = "biohome_nikshta_bed1"
	name = "Casa de Korna: Secondary Bedroom"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/centcom/biodome/homes/casa_de_korna/lounge
	icon_state = "biohome_nikshta"
	name = "Casa de Korna: Lounge"

/area/centcom/biodome/homes/casa_de_korna/bar
	icon_state = "biohome_nikshta_bar"
	name = "Casa de Korna: Kitchen"

/area/centcom/biodome/homes/casa_de_korna/bath
	icon_state = "biohome_nikshta_bath"
	name = "Casa de Korna: Bath"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/// STRIGI & ALARA FORMES' HOME
/area/centcom/biodome/homes/casa_de_formes
	icon_state = "biohome_strigi"
	name = "Casa de Formes"
	ambience_index = AMBIENCE_MEDICAL
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/homes/casa_de_formes/bed1
	icon_state = "biohome_strigi_bed1"
	name = "Casa de Formes: Bedroom"

/area/centcom/biodome/homes/casa_de_formes/lounge
	icon_state = "biohome_strigi_lounge"
	name = "Casa de Formes: Lounge"

/area/centcom/biodome/homes/casa_de_formes/bar
	icon_state = "biohome_strigi_bar"
	name = "Casa de Formes: Bar"

/area/centcom/biodome/homes/casa_de_formes/toolcloset
	icon_state = "biohome_strigi"
	name = "Casa de Formes: Tool Closet"

/// Mystral Garner & FELLA's home
/area/centcom/biodome/homes/casa_de_garner
	icon_state = "biohome_mystral"
	name = "Casa de Garner"
	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_AREA_WOODFLOOR

/area/centcom/biodome/homes/casa_de_garner/bed1
	icon_state = "biohome_mystral_bed1"
	name = "Casa de Garner: Master Bedroom"

/area/centcom/biodome/homes/casa_de_garner/bed2
	icon_state = "biohome_mystral_bed2"
	name = "Casa de Garner: Kids' Bedroom"

/area/centcom/biodome/homes/casa_de_garner/bed3
	icon_state = "biohome_mystral_bed3"
	name = "Casa de Garner: Guest Bedroom"

/area/centcom/biodome/homes/casa_de_garner/bath
	icon_state = "biohome_mystral_bath"
	name = "Casa de Garner: Bathroom"

/area/centcom/biodome/homes/casa_de_garner/bar
	icon_state = "biohome_mystral_bar"
	name = "Casa de Garner: Bar"
