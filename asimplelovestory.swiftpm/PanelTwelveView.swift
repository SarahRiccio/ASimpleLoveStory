import Foundation
import SwiftUI
import SpriteKit


struct PanelTwelveView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelTwelveScene:PanelTwelveScene {
        let scene = PanelTwelveScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelTwelveScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 13 {
                    currentPanel = .thirteen
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
