import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView: View {
    let wordList = ["Life", "Love", "Nice", "Thought"]
    
    var body: some View {
        VStack {
            List{
                ForEach(wordList, id: \.self) { word in
                    ZStack {
                        NavigationLink(destination:
                            DetailView(word: word)
                        ) {
                            EmptyView()
                        }
                        
                        HStack {
                            Text(word)
                                .font(.body)
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text("Word List"), displayMode: .inline)
    }
}

struct DetailView: View {
    let word: String
    
    var body: some View {
        VStack {
            Text(word)
                .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
