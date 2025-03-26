//
//  ContentView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-18.
//




import SwiftUI

struct ContentView: View {
    @State private var shows: [Show] = []
    
    //MARK: - State properties
    @State private var isSheetingShowing = false
    @State private var searchText = "Rick and Morty"
    
    
    //    let shows = Bundle.main.decode("rickAndMorty.json")
    var body: some View {
        NavigationStack{
            List{
                ForEach(shows) { show in
                    NavigationLink(value: show) {
                        RowView(show: show)
                    }
                }
            }
            .navigationTitle("TV Shows")
            .navigationDestination(for: Show.self) { show in
                DetailView(showStore: ShowStore.exampleShow, show: show)
            }
            .onAppear() {
                loadData(forShowTitle: searchText)
            }
            .searchable(text: $searchText, prompt: "Please enter the show title")
            .keyboardType(.default)
            .textInputAutocapitalization(.words)
            .onSubmit(of: .search) {
                loadData(forShowTitle: searchText)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Info", systemImage: "info.circle") {
                        isSheetingShowing.toggle()
                    }
                }
            }
            .sheet(isPresented: $isSheetingShowing) {
                VStack {
                    Text("TV Show Search Information")
                        .bold()
                        .font(.title)
                    Divider()
                    Text("This app allows you to search for TV shows and view details about each episode. Use the search bar to find shows, and tap on a show to view more information.")
                }.padding()
            }
        }
    }
    
    
    func loadData(forShowTitle showTitle: String) {
        Task {
            guard let cleanTitle = showTitle.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return }
            let urlString = "https://itunes.apple.com/search?term=\(cleanTitle)&media=tvShow"
            
            print(urlString)
            
            guard let url = URL(string: urlString) else { return }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(Shows.self, from: data)
                
                shows = results.results
                
            } catch DecodingError.valueNotFound(let error, let message) {
                print("Value is missing: \(error) - \(message.debugDescription)")
            } catch DecodingError.typeMismatch(let error, let message) {
                print("Types do not match: \(error) - \(message.debugDescription)")
            } catch DecodingError.keyNotFound(let error, let message) {
                print("Incorrect property name: \(error) - \(message.debugDescription)")
            } catch {
                print("Unknown error has occurred - \(error.localizedDescription)")
            }
        }
    }
    }
    


#Preview {
    ContentView()
}
