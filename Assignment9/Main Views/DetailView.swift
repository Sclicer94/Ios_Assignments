//
//  DetailView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-24.
//

import SwiftUI


struct DetailView: View {
    @ObservedObject var showStore: ShowStore
    
    var show: Show
    //MARK: - State properties
    @State private var isAlertShowing = false
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Color("detailBg")
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    ZStack(alignment: .topLeading){
                        VStack(alignment: .leading){
                            ZStack {
                                Color("detailIBG")
                                AsyncImage(url: URL(string: show.artworkUrl100))
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                                    .scaledToFill()
                            }
                            
                            HStack {
                                Text(show.trackName)
                                    .bold()
                                    .font(.title)
                            }
                            if (show.contentAdvisoryRating == "TV-MA") {
                                Image(systemName: "18.circle")
                            } else  {
                                Image(systemName: "figure.and.child.holdinghands")
                            }
                            
                            Text(show.longDescription)
                                .font(.caption)
                                .fontWeight(.black)
                            
                        }.padding()
                    }
                    
                   
                    Divider()
                    
                    NavigationLink(destination: WebView(webText: show.collectionViewUrl)){
                        Label("More Information", systemImage: "tv")
                    }
                    .toolbar{
                        ToolbarItem{
                            Button("Add to Watch List", systemImage: showStore.isInCollection(show: show) ? "star.fill" : "star"){
                                isAlertShowing.toggle()
                            }
                        }
                    }
                    .alert("Add \(show.trackName) to Watchlist", isPresented: $isAlertShowing){
                        Button("Add"){
                            showStore.addToWatchlist(show: show)
                        }
                        Button("Cancel", role: .cancel){}
                    }
                }.padding()

                Spacer()
            }
        }
       
    }
}

#Preview {
    DetailView(showStore: ShowStore.exampleShow, show: Show.show)
}
