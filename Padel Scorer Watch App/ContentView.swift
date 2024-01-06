//
//  ContentView.swift
//  Padel Scorer Watch App
//
//  Created by Ben Adrian Sarmiento on 18.05.23.
//

import SwiftUI

struct ContentView: View {
	@State private var leftGameScore: Int = 0
	@State private var rightGameScore: Int = 0
	@State private var leftSetScore: String = "💙"
	@State private var rightSetScore: String = "💙"
	@State private var deuceCount: Int = 1
	@State private var previousScores: [(Int, Int, String, String, Int)] = []

	
	var body: some View {
		VStack {
			HStack {
				Spacer()
				Text("\(leftGameScore)")
					.font(.largeTitle)
				Spacer()
				Text("\(rightGameScore)")
					.font(.largeTitle)
				Spacer()
			}
			HStack {
				Spacer()
				Button(action: {
					previousScores.append((leftGameScore, rightGameScore, leftSetScore, rightSetScore, deuceCount))
					incrementSetScore(
										playerScore: &leftSetScore,
										oppScore: &rightSetScore,
										gameScore: &leftGameScore,
										deuceCount: &deuceCount
									)
				}) {
					Text("\(leftSetScore)")
						.foregroundColor(.white)
						.font(.title)
				}
				Spacer()
				Button(action: {
					previousScores.append((leftGameScore, rightGameScore, leftSetScore, rightSetScore, deuceCount))
					incrementSetScore(
										playerScore: &rightSetScore,
										oppScore: &leftSetScore,
										gameScore: &rightGameScore,
										deuceCount: &deuceCount
									)
				}) {
					Text("\(rightSetScore)")
						.foregroundColor(.white)
						.font(.title)
				}
				Spacer()
			}
			HStack {
				Spacer()
				Button(action: {
					undo()
				}) {
					Text("UNDO")
						.padding()
						.foregroundColor(.white)
						.cornerRadius(8)
				}
				Spacer()
			}
			HStack {
						Spacer()
						Button(action: {
							previousScores.append((leftGameScore, rightGameScore, leftSetScore, rightSetScore, deuceCount))
							resetScore(
								playerGameScore: &leftSetScore,
								oppGameScore: &rightSetScore,
								playerSetScore: &leftGameScore,
								oppSetScore: &rightGameScore,
								deuceCount: &deuceCount)
						}) {
							Text("RESET")
								.padding()
								.foregroundColor(.white)
								.cornerRadius(8)
						}
						Spacer()
					}
		}
		.padding()
	}
	
	func undo() {
		guard let lastScore = previousScores.popLast() else { return }
		leftGameScore = lastScore.0
		rightGameScore = lastScore.1
		leftSetScore = lastScore.2
		rightSetScore = lastScore.3
		deuceCount = lastScore.4
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
