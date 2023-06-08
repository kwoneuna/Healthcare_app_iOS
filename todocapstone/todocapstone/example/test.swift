import SwiftUI
@MainActor class Dataexample : ObservableObject {
    @Published var text = "Counter"
    @Published var counter = 0
}
struct test: View{
    @StateObject var data = Dataexample()
    var body: some View{
        VStack{
            textblockview()
            test2()
            
        }
        //data라고 부를거임
        .environmentObject(data)
    }
}
struct testview_preview: PreviewProvider{
    static var previews: some View{
        test()
    }
}
