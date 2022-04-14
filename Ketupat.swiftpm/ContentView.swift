import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            HomeView()
                .navigationBarTitle(Text(""), displayMode: .inline)
        }
        .navigationViewStyle(.stack)
    }
}
