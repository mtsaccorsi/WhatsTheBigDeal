//
//  LoadingView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 08/06/22.
//

import SwiftUI

struct LoadingView: View {
    
    var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ProgressView("Carregando descontos...")
//                .tint(.blue)
//                .foregroundColor(.blue)
//                .scaleEffect(1.5)
            
        }.opacity(isShowing ? 1 : 0)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: true)
    }
}
