extends PanelContainer

@onready
var labels: Array = $VBoxContainer.get_children().filter(func(node): return node is Label)
@onready
var base_texts: Array = labels.map(func(label): return label.text)

func _process(_delta: float) -> void:
	var stats = Stats.as_array()
	if len(stats) != len(labels):
		error_string(ERR_INVALID_DATA)
	
	for i in len(labels):
		labels[i].text = base_texts[i] % stats[i]
