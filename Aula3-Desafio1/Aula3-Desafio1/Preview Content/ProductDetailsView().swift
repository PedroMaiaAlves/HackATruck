//
//  ProductDetailsView().swift
//  Aula3-Desafio1
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct ProductDetailsView: View {
    var telas: String
    var body: some View {
        Text(telas)
            .navigationTitle(telas)
    }
}

#Preview {
    ProductDetailsView(telas: "Telas")
}
