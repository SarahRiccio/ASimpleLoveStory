import Foundation
import SwiftUI
import SpriteKit

struct PanelTwentytwoView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelTwentytwoScene:PanelTwentytwoScene {
        let scene = PanelTwentytwoScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelTwentytwoScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 23 {
                    currentPanel = .twentythree
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}

