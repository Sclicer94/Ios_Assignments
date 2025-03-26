//
//  ShowStore.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-26.
//
import Foundation

class ShowStore:ObservableObject{
    @Published var favouriteShows: [Show]
    
    static var exampleShow = ShowStore(favouriteShows: [Show.show])
    
    init(favouriteShows: [Show]) {
        self.favouriteShows = favouriteShows
    }
    
    var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    // adding new Campsite
    func isInCollection(show: Show)-> Bool{
        favouriteShows.contains(show)
    }
    
    func addToWatchlist(show: Show){
        if isInCollection(show: show){
            return
        }
        favouriteShows.append(show)
        saveWatchlist()
    }
    
    func removeFromWatchlist(show : Show){
        if let index = favouriteShows.firstIndex(of: show){
            favouriteShows.remove(at: index)
        }
        saveWatchlist()
    }
    
    func removeFromWatchlist(forIndexSet indexSet: IndexSet){
        favouriteShows.remove(atOffsets: indexSet)
        saveWatchlist()
    }
    
    //Save
    func saveWatchlist(){
        let saveLocation = documentDirectory.appendingPathComponent("watchlist.json")
        do{
            let jsonEncoder = JSONEncoder()
            let saveData = try jsonEncoder.encode(favouriteShows)
            jsonEncoder.outputFormatting = .prettyPrinted
            try saveData.write(to: saveLocation)
        }catch{
            print("Can't save - \(error.localizedDescription)")
        }
    }
    
    func retrieveWatchlist(){
        let location = documentDirectory.appendingPathComponent("watchlist.json")
        do{
            let fetchData = try Data(contentsOf: location)
            let jsonDecoder = JSONDecoder()
            favouriteShows = try jsonDecoder.decode([Show].self, from: fetchData)
        } catch {
            print("Can't decode - \(error.localizedDescription)")
        }
    }
    
    
}
