//
//  ContentView.swift
//  Aula4-Desafio1
//
//  Created by Turma01-23 on 24/03/25.
//

import SwiftUI

struct Song: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa : String
}

var arrayMusicas = [
    Song(id: 1, name: "crybaby", artist: "Lil Peep", capa: "https://www.vagalume.com.br/lil-peep/discografia/crybaby.webp"),
    Song(id: 2, name: "Save That Shit", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/df0b3f059ae2b537b1b2655aab719de9.jpg#df0b3f059ae2b537b1b2655aab719de9"),
    Song(id: 3, name: "girls", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/19befd0125f3129e2331998cd3d39052.jpg#19befd0125f3129e2331998cd3d39052"),
    Song(id: 4, name: "nineteen", artist: "Lil Peep", capa: "https://www.vagalume.com.br/lil-peep/discografia/crybaby.webp"),
    Song(id: 5, name: "Awful Things", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/df0b3f059ae2b537b1b2655aab719de9.jpg#df0b3f059ae2b537b1b2655aab719de9"),
    Song(id: 6, name: "we think too much", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/19befd0125f3129e2331998cd3d39052.jpg#19befd0125f3129e2331998cd3d39052"),
    Song(id: 7, name: "lil jeep", artist: "Lil Peep", capa: "https://www.vagalume.com.br/lil-peep/discografia/crybaby.webp"),
    Song(id: 8, name: "The Brightside", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/df0b3f059ae2b537b1b2655aab719de9.jpg#df0b3f059ae2b537b1b2655aab719de9"),
    Song(id: 9, name: "hellboy", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/19befd0125f3129e2331998cd3d39052.jpg#19befd0125f3129e2331998cd3d39052"),
    Song(id: 10, name: "Fallind Down", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/0f6c7e1323f12f50659c072eda4749bd.jpg#0f6c7e1323f12f50659c072eda4749bd"),
    Song(id: 11, name: "Star Shopping", artist: "Lil Peep", capa: "https://lastfm.freetls.fastly.net/i/u/770x0/262f8b7d976e084cec735dc2f5259811.jpg#262f8b7d976e084cec735dc2f5259811")
]

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
                ScrollView{
                    VStack {
                        VStack{
                            Spacer()
                            AsyncImage(url: URL(string: "https://wallpapers.com/images/high/lil-peep-pictures-x78i5c76fwzjr4zl.webp")) {
                                phase in switch phase {
                                case .empty:
                                    ProgressView()
                                case . success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                case .failure(_):
                                    Image(systemName: "photo")
                                @unknown default:
                                    EmptyView()
                                }
                            }.frame(width:20 ,height: 200)
                                .padding(.top, 70)
                            Text("This is Lil Peep")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                        }
                        
                            VStack{
                                    ForEach(arrayMusicas){ i in
                                        HStack{
                                            NavigationLink(destination: SwiftUIView(musica: i)){
                                            AsyncImage(url: URL(string: i.capa)) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 50, height: 50)
                                            
                                            
                                            
                                            VStack(alignment: .leading){
                                                Text(i.name)
                                                    .font(.headline)
                                                Text(i.artist)
                                                    .font(.subheadline)
                                                
                                            }.foregroundStyle(.white)
                                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            Spacer()
                                            HStack(spacing: 3){
                                                Ellipse()
                                                    .frame(width: 5,height: 5)
                                                Ellipse()
                                                    .frame(width: 5,height: 5)
                                                Ellipse()
                                                    .frame(width: 5,height: 5)
                                            }
                                            .foregroundStyle(.white)
                                        }
                                        }
                                        .frame(width: 350, height: 50,alignment: .leading)
                                    }
                            }
                            VStack{
                                Text("Sugeridos")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.white)
                                ScrollView(.horizontal){
                                    HStack(spacing: 50){
                                        VStack{
                                            AsyncImage(url: URL(string: "https://cdn-images.dzcdn.net/images/artist/df0446e79b9b85b8bb5d5c87211deeb6/500x500-000000-80-0-0.jpg")) {
                                                phase in switch phase {
                                                case .empty:
                                                    ProgressView()
                                                case . success(let image):
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                case .failure(_):
                                                    Image(systemName: "photo")
                                                @unknown default:
                                                    EmptyView()
                                                }
                                            }.frame(width: 200, height: 200)
                                            Text("XXXTENTACION")
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                                .padding(.top)
                                        }
                                        
                                        VStack{
                                            AsyncImage(url: URL(string: "https://s2-g1.glbimg.com/fBaFlbNUrY2v_n5VmLeq9W4-1qs=/0x0:1080x1350/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2019/D/8/IkEjPUTy6idiKIEf0Mfw/juicewrld.jpg")) {
                                                phase in switch phase {
                                                case .empty:
                                                    ProgressView()
                                                case . success(let image):
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                case .failure(_):
                                                    Image(systemName: "photo")
                                                @unknown default:
                                                    EmptyView()
                                                }
                                            }.frame(width: 200, height: 200)
                                            Text("JUICE WRLD")
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                                .padding(.top)
                                        }
                                        
                                        VStack{
                                            AsyncImage(url: URL(string: "https://s2-g1.glbimg.com/edM1HJtDGbHdDXZvhIJfUGiyWrA=/0x0:1080x1350/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/9/G/qfvEJ5Qdiq18A4BKQGJQ/matue4.jpg")) {
                                                phase in switch phase {
                                                case .empty:
                                                    ProgressView()
                                                case . success(let image):
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                case .failure(_):
                                                    Image(systemName: "photo")
                                                @unknown default:
                                                    EmptyView()
                                                }
                                            }.frame(width: 200, height: 200)
                                            Text("MATUE")
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                                .padding(.top)
                                        }
                                    }
                                }
                            }
                    }
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
