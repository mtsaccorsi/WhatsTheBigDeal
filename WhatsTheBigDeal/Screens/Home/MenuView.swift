//
//  InfoMenuView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 10/09/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("In progress...")
            }
            Spacer()
            Text("| Desenvolvido por Matheus Accorsi |" + "\n" + " Alimentado pela API IsThereAnyDeal.com")
//                .font(.system(size: 18))
                .foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background(Color.indigo)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
