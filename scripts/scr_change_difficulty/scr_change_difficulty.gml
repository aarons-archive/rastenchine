enum Difficulty {
	EASY,
	MEDIUM,
	HARD,
}

function change_difficulty(difficulty) {
	switch (difficulty) {
		case "EASY":
			global.difficulty = Difficulty.EASY
			break
		case "MEDIUM":
			global.difficulty = Difficulty.MEDIUM
			break
		case "HARD":
			global.difficulty = Difficulty.HARD
			break
	}
}

global.difficulty = Difficulty.EASY
