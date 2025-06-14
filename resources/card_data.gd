extends Resource
class_name CardData

@export var card_name: String
@export var description: String
@export var cost: int
@export var damage: int
@export var heal: int
@export var corruption: float
@export var card_type: String # "attack", "defense", "spell"
@export var rarity: String # "common", "rare", "corrupted"
@export var outer_border_image_path: String
@export var inner_border_image_path: String
@export var background_image_path: String
@export var text_background_image_path: String
@export var effect_id: String # Used for gameplay effect logic
var damage_target:Entity_component
var heal_target:Entity_component
