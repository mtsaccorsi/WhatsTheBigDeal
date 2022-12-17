//
//  RecentsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import SwiftUI

struct DealsListView: View {
    
    @StateObject private var dealsVM = DealsViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                // MARK: - DEALS LIST
                if let results = dealsVM.games {
                    
                    ForEach(results, id: \.plain) { deal in
                        DealsDetailView(games: deal)
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                    .padding(.bottom, -8)
                    
                    // Infinity Scroll setting a Geometry Reader
                    if dealsVM.dealsOffset == dealsVM.games.count {
                        HStack {
                            Spacer()
                            ListLoadingView(isShowing: dealsVM.isLoading)
                                .task { await dealsVM.fetchDeals()}
                            Spacer()
                        }
                        
                    } else {
                        GeometryReader { reader -> Color in
                            let minY = reader.frame(in: .global).minY
                            let height = UIScreen.main.bounds.height / 1.3
                            
                            // Setting offset to current fetched deals count, increasing the list
                            if !dealsVM.games.isEmpty && minY < height {
                                dealsVM.isLoading.toggle()
                                DispatchQueue.main.async {
                                    dealsVM.dealsOffset = dealsVM.games.count
                                }
                            }
                            return Color.clear
                        }
                    }
                }
                else {
                    HStack {
                        Spacer()
                        ListLoadingView(isShowing: dealsVM.isLoading)
                        Spacer()
                    }
                }
            }
            // MARK: - LIST ENDED
        }
        .refreshable {
            dealsVM.isLoading = true
            dealsVM.dealsOffset = 0
            dealsVM.games = []
            await dealsVM.fetchDeals()
            try? await Task.sleep(nanoseconds: 2_000_000_000)
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = UIColor.systemIndigo
        }
    }
}

struct DealsListView_Previews: PreviewProvider {
    static var previews: some View {
        DealsListView()
    }
}
