//
//  SearchBarView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 10/09/22.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject private var searchVM = SearchViewModel()

    var body: some View {
        // MARK: - SEARCH BAR
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Procure um jogo", text: $searchVM.query)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
            .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
