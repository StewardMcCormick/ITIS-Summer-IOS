//
//  MoodListViewModel.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import SwiftUI

enum MoodListState {
    case loading
    case success([Mood])
    case error(String)
}

@Observable
class MoodListViewModel {
    private var lastId: Int = 0
    var user: User? = nil
    var searchText: String = ""
    var state: MoodListState = .loading
    
    let service = MoodService()
    
    var filteredMoods: [Mood] {
        let sorted = service.moods.sorted { $0.timestamp > $1.timestamp }
        guard !searchText.isEmpty else { return sorted }
        return sorted.filter { mood in
            mood.description.localizedCaseInsensitiveContains(searchText) ||
            mood.comment.localizedCaseInsensitiveContains(searchText) ||
            mood.stringTimestamp().localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func name(_ name: String) {
        guard !name.isEmpty else { return }
        user = User(username: name)
    }
    
    func loadMoods() async {
        state = .loading
        do {
            let moods = try await service.fetchMoods()
            lastId = moods.map(\.id).max() ?? 0
            state = .success(moods)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func addMood(mood: Mood) {
        lastId += 1
        mood.id = lastId
        service.addMood(mood)
        state = .success(service.moods)
    }
    
    func deleteMood(by id: Int) {
        service.deleteMood(withId: id)
        state = .success(service.moods)
    }
    
    static func getTestList() -> MoodListViewModel {
        let model = MoodListViewModel()
        model.user = User(username: "Тестер")
        model.service.moods = [
            Mood(type: .Happy, comment: "happy"),
            Mood(type: .Normal),
            Mood(type: .Sad),
            Mood(type: .Sad, comment: "Sad")
        ]
        model.state = .success(model.service.moods)
        return model
    }
}
