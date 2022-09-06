//
//  ContentView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 06/06/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View{
        
        VStack {
            HStack {
                LogoView()

                Text("Alimentado pela API IsThereAnyDeal.com")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.4))
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
            }
            .background(Color.indigo.opacity(0.9))
            
            
            TabView () {
                DealsListView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Início")
                    }
                
                GiftsView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}