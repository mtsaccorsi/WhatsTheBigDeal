//
//  HomeLoadingView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 09/09/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    var isShowing: Bool
    
    var body: some View {
        
        VStack {
            IconView()
        }
        .zIndex(1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo.opacity(1))
        .animation(.easeInOut(duration: 1.5), value: true)
        .opacity(isShowing ? 1 : 0)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(isShowing: true)
    }
}
