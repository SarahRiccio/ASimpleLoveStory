import Foundation
import SwiftUI
import SpriteKit


struct PanelMainView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelMainScene:PanelMainScene {
        let scene = PanelMainScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {

        SpriteView(scene: self.panelMainScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 1 {
                    currentPanel = .one
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
