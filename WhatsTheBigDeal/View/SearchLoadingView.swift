//
//  SearchLoadingView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 12/06/22.
//

import SwiftUI

struct SearchLoadingView: View {
    
    var isShowing: Bool
    
    var body: some View {
        ZStack {
            ProgressView("Buscando jogo...")
            
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct SearchLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLoadingView(isShowing: true)
    }
}
