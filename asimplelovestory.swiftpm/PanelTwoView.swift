import Foundation
import SwiftUI
import SpriteKit


struct PanelTwoView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelTwoScene: PanelTwoScene {
        let scene = PanelTwoScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View{
        SpriteView(scene: self.panelTwoScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 3 {
                    currentPanel = .three
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
