//
//  ContentView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 06/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isLoading: Bool = true
    
    var body: some View{
        
        ZStack {
            
            HomeLoadingView(isShowing: isLoading)
                .zIndex(1)
                .task {
                    try? await Task.sleep(nanoseconds: 3_000_000_000)
                    isLoading.toggle()
                }
            
            VStack {
                HStack {
                    LogoView()
                    Spacer()
                    Text("Alimentado pela API IsThereAnyDeal.com")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.4))
                        .multilineTextAlignment(.center)
                        .padding(.trailing)
                }
                .frame(maxWidth: .infinity)
                .background(Color.indigo.opacity(0.9))
                
                TabView () {
                    DealsListView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Início")
                        }
                    
                    GiftsListView()
                        .tabItem {
                            Image(systemName: "gift.fill")
                            Text("É grátis!")
                        }
                    
                }
                .accentColor(Color.white)
                .offset(y: -10)
                .ignoresSafeArea()
                .onAppear() {
                    UITabBar.appearance().barTintColor = .systemIndigo
                    UITabBar.appearance().unselectedItemTintColor = UIColor.lightText
                    // needed to load the same color as barTintColor when recreating the view
                    UITabBar.appearance().backgroundColor = .systemIndigo
                    
                }
            }
            .zIndex(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}
