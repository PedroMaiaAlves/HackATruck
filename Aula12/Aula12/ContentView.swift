import SwiftUI

struct ContentView: View {
    // A ViewModel é observada pela ContentView para manter os dados atualizados
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            // Título
            Text("Dados dos Sensores")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Se os dados ainda não foram carregados, exibe uma mensagem
            if viewModel.sensor.isEmpty {
                Text("Nenhum dado disponível")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                // Exibe os dados dos sensores
                List(viewModel.sensor, id: \.self) { sensor in
                    VStack(alignment: .leading) {
                        Text("Umidade: \(sensor.umidade ?? "Indisponível")")
                            .font(.body)
                            .padding()
                    }
                }
            }
        }
        .padding()
        .onAppear {
            // Chama o método fetch para buscar os dados quando a view aparecer
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
