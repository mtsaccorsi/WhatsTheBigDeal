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
            VStack {
                //                HStack {
                //                    Text("  Alguma") // EsperaCair
                //                        .font(.title)
                //                        .fontWeight(.heavy)
                //                        .foregroundColor(Color.white)
                //                    Text("Promo  ")
                //                        .font(.title)
                //                        .fontWeight(.heavy)
                //                        .foregroundColor(Color.black)
                //                }
                //                .padding(.horizontal)
                ////                .background(.white)
                //                .cornerRadius(10)
                //                .padding(.top)

                SearchBarView()
                    .padding()
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
