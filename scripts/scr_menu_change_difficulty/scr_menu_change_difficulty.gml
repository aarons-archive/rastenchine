enum difficulty {
	easy,
	medium,
	hard,
}

global.difficulty = difficulty.easy

function change_difficulty(_difficulty) {
	switch (_difficulty) {
		case "EASY":
			global.difficulty = difficulty.easy
			break
		case "MEDIUM":
			global.difficulty = difficulty.medium
			break
		case "HARD":
			global.difficulty = difficulty.hard
			break
	}
}