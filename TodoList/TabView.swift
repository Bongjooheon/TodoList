import SwiftUI

struct TabbarView: View {
    
    @State private var selection = 1
    
    init(){
            //TabView 배경색 설정(파란색)
        UITabBar.appearance().backgroundColor
            = UIColor(Color(hex: 0x193B8A))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }
    
    var body: some View {
        TabView(selection: $selection){
            Group{
                myCalView()
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                    }
                    .accentColor(Color(hex: 0x193B8A))
                    .tag(1)
                TodoView()
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                    .tag(2)
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
                    .tag(3)
            }
        }
        .accentColor(.white)
        .navigationBarHidden(true)
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
