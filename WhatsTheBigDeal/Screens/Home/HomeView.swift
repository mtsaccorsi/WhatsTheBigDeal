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
            
//            SplashScreenView(isShowing: isLoading)
//                .zIndex(1)
//                .task {
//                    try? await Task.sleep(nanoseconds: 3_000_000_000)
//                    isLoading.toggle()
//                }
            
            VStack {
                HStack {
                    LogoView()
                    Spacer()
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                        .foregroundColor(.white.opacity(0.4))
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
                
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
                    
                    AboutView()
                        .tabItem {
                            Image(systemName: "info.circle.fill")
                            Text("Info")
                        }
                }
                .accentColor(Color.white)
                .offset(y: -10)
                .onAppear() {
                    UITabBar.appearance().backgroundColor = .systemIndigo
                    UITabBar.appearance().unselectedItemTintColor = UIColor.lightText
                    // needed to load the same color as backgroundColor when recreating the view
                    UITabBar.appearance().barTintColor = .systemIndigo
                    UITabBar.appearance().isTranslucent = false // needed to be false to match the background color
                }
            }
            .background(Color.indigo)
            .zIndex(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
