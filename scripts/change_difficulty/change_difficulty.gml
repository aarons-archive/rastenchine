enum Difficulty {
	easy,
	medium,
	hard,
}

global.difficulty = Difficulty.easy

function change_difficulty(difficulty) {
	switch (difficulty) {
		case "EASY":
			global.difficulty = Difficulty.easy
			break
		case "MEDIUM":
			global.difficulty = Difficulty.medium
			break
		case "HARD":
			global.difficulty = Difficulty.hard
			break
	}
}