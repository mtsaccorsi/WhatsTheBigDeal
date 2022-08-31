//
//  GiftsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 30/07/22.
//

import SwiftUI

struct GiftsView: View {
    @StateObject private var giftsVM = GiftsViewModel()
    @State private var isLoading = true
    
    var body: some View {

            List {
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
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.horizontal, 9)
                    .padding(.top, 10)
                    
                    // Infinity Scroll setting a Geometry Reader
                    if giftsVM.giftsOffset == giftsVM.gifts.count {
                        HStack {
                            Spacer()
                            DealsLoadingView(isShowing: isLoading)
                                .task { await giftsVM.fetchGifts()
                                    
                                }
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                    } else {
                        GeometryReader { reader -> Color in
                            let minY = reader.frame(in: .global).minY
                            let height = UIScreen.main.bounds.height / 1.3
                            
                            // Setting offset to current fetched deals count, increasing the list
                            if !giftsVM.gifts.isEmpty && minY < height {
                                isLoading = true
                                DispatchQueue.main.async {
                                    giftsVM.giftsOffset = giftsVM.gifts.count
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
                isLoading = false
                await giftsVM.refreshGifts()
        }
    }
}

struct GiftsView_Previews: PreviewProvider {
    static var previews: some View {
        GiftsView()
    }
}
