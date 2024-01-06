//
//  Score.swift
//  Padel Scorer Watch App
//
//  Created by Ben Adrian Sarmiento on 18.05.23.
//


public func incrementSetScore(
	playerScore: inout String,
	oppScore: inout String,
	gameScore: inout Int,
	deuceCount: inout Int
) {
	switch playerScore {
	case "💙":
		playerScore = "15"
	case "15":
		playerScore = "30"
	case "30":
		if oppScore == "40" {
			oppScore = "D"
			playerScore = "D"
		} else {
			playerScore = "40"
		}
	case "40":
		playerScore = "💙"
		oppScore = "💙"
		deuceCount = 1
		gameScore += 1
	case "A":
		playerScore = "💙"
		oppScore = "💙"
		deuceCount = 1
		gameScore += 1
	default:
		if oppScore == "A" {
			deuceCount += 1
			playerScore = "D\(deuceCount)"
			oppScore = "D\(deuceCount)"
		} else {
			playerScore = "A"
			oppScore = "D"
		}
	}
}

public func resetScore(
	playerGameScore: inout String,
	oppGameScore: inout String,
	playerSetScore: inout Int,
	oppSetScore: inout Int,
	deuceCount: inout Int
) {
	playerGameScore = "💙"
	oppGameScore = "💙"
	playerSetScore = 0
	oppSetScore = 0
	deuceCount = 1
}

