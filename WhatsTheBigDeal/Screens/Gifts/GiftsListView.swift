//
//  GiftsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 30/07/22.
//

import SwiftUI

struct GiftsListView: View {
    @StateObject private var giftsVM = GiftsViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                // MARK: - DEALS LIST
                if let results = giftsVM.gifts {
                    
                    ForEach(results, id: \.plain) { gift in
                        ZStack {
                            if gift.price_cut == 100 {
                                DealsDetailView(games: gift)
                            } else {
                                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                            }
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                    .padding(.bottom, -8)
                    
                    // Infinity Scroll setting a Geometry Reader
                    if giftsVM.giftsOffset == giftsVM.gifts.count {
                        HStack {
                            Spacer()
                            ListLoadingView(isShowing: giftsVM.isLoading)
                                .task { await giftsVM.fetchGifts()}
                            Spacer()
                        }
                    } else {
                        GeometryReader { reader -> Color in
                            let minY = reader.frame(in: .global).minY
                            let height = UIScreen.main.bounds.height / 1.3
                            
                            // Setting offset to current fetched deals count, increasing the list
                            if !giftsVM.gifts.isEmpty && minY < height {
                                giftsVM.isLoading = true
                                DispatchQueue.main.async {
                                    giftsVM.giftsOffset = giftsVM.gifts.count
                                }
                            }
                            return Color.clear
                        }
                    }
                    
                }
                else {
                    HStack {
                        Spacer()
                        ListLoadingView(isShowing: giftsVM.isLoading)
                        Spacer()
                    }
                }
            }
            // MARK: - LIST ENDED
        }
        .refreshable {
            giftsVM.isLoading = true
            giftsVM.gifts = []
            giftsVM.giftsOffset = 0
            await giftsVM.fetchGifts()
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = UIColor.systemIndigo
        }
    }
}

struct GiftsListView_Previews: PreviewProvider {
    static var previews: some View {
        GiftsListView()
    }
}
