//
//  MainView.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodView: View {
    
    @Environment(MoodListViewModel.self) private var moodListViewModel
    @State private var isAddingMood: Bool = false
    
    var body: some View {
        @Bindable var viewModel = moodListViewModel
        
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView("Загрузка...")
                        .scaleEffect(1.5)
                case .success:
                    mainContent
                case .error(let message):
                    VStack(spacing: 16) {
                        Text("Ошибка: \(message)")
                            .foregroundColor(.red)
                        Button("Повторить") {
                            Task { await viewModel.loadMoods() }
                        }
                    }
                }
            }
            .navigationTitle("Привет, \(viewModel.user?.username ?? "")!")
            .searchable(text: $viewModel.searchText, prompt: "Поиск по настроению")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { isAddingMood = true }) {
                        Label("Добавить запись", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingMood) {
                AddNewMoodView()
                    .environment(moodListViewModel)
            }
            .task {
                await viewModel.loadMoods()
            }
            .navigationDestination(for: Mood.self) { mood in
                MoodDetailView(mood: mood)
            }
        }
    }
    
    private var mainContent: some View {
        List {
            ForEach(moodListViewModel.filteredMoods, id: \.id) { mood in
                NavigationLink(value: mood) {
                    MoodListRow(mood: mood)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        moodListViewModel.deleteMood(by: mood.id)
                    } label: {
                        Label("Удалить", systemImage: "trash")
                    }
                }
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, -8)
    }
}
