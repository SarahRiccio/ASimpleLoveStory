import Foundation
import SwiftUI
import SpriteKit


struct PanelBeginningView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelBeginningScene:PanelBeginningScene {
        let scene = PanelBeginningScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        ZStack{
            SpriteView(scene: self.panelBeginningScene)
            
            Text("In loving memory of Suamy\n2006-2022")
                .offset(x: 0, y: 200)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
        }
    }
    
}
