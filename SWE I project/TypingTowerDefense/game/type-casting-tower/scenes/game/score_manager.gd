extends Node

const SCORE_FILE := "user://scores.cfg"


func save_score(best_streak: int) -> Error:
	var config := ConfigFile.new()
	var error := config.load(SCORE_FILE)

	if error != OK and error != ERR_FILE_NOT_FOUND:
		return error

	var scores: Array = config.get_value("highscores", "top_streaks", [])

	scores.append(best_streak)
	scores.sort()
	scores.reverse()

	if scores.size() > 10:
		scores.resize(10)

	config.set_value("highscores", "top_streaks", scores)
	return config.save(SCORE_FILE)


func load_scores() -> Array:
	var config := ConfigFile.new()
	if config.load(SCORE_FILE) != OK:
		return []
	return config.get_value("highscores", "top_streaks", [])
