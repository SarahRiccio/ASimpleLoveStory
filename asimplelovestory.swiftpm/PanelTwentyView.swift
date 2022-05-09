import Foundation
import SwiftUI
import SpriteKit


struct PanelTwentyView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelTwentyScene:PanelTwentyScene {
        let scene = PanelTwentyScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelTwentyScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 21 {
                    currentPanel = .twentyone
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
