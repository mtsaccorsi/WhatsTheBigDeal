//
//  RecentsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import SwiftUI

struct RecentsView: View {
    
    @StateObject private var dealsVM = DealsViewModel()
    @State private var isLoading = true
    
    var body: some View {
        
        List {
            // MARK: - DEALS LIST
            if let results = dealsVM.games {
                
                ForEach(results, id: \.plain) { deal in
                    DealsView(games: deal)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .padding(.horizontal, 9)
                .padding(.top, 10)
                
                // Infinity Scroll setting a Geometry Reader
                if dealsVM.offset == dealsVM.games.count {
                    HStack {
                        Spacer()
                        DealsLoadingView(isShowing: isLoading)
                            .task { await dealsVM.fetchDeals()}
                        Spacer()
                    }
                    .listRowSeparator(.hidden)                    
                    
                } else {
                    GeometryReader { reader -> Color in
                        let minY = reader.frame(in: .global).minY
                        let height = UIScreen.main.bounds.height / 1.3
                        
                        // Setting offset to current fetched deals count, increasing the list
                        if !dealsVM.games.isEmpty && minY < height {
                            isLoading.toggle()
                            DispatchQueue.main.async {
                                dealsVM.offset = dealsVM.games.count
                            }
                        }
                        return Color.clear
                    }
                    .listRowSeparator(.hidden)
                }
                
            }
            else {
                HStack {
                    Spacer()
                    DealsLoadingView(isShowing: isLoading)
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
        }
        // MARK: - LIST ENDED
        .listStyle(PlainListStyle())
        .refreshable {
            isLoading.toggle()
            await dealsVM.refreshDeals()
        }
    }
}

struct RecentsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentsView()
    }
}
