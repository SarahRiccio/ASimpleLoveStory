import Foundation
import SwiftUI
import SpriteKit


struct PanelOneView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelOneScene: PanelOneScene {
        let scene = PanelOneScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {

        SpriteView(scene: self.panelOneScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 2 {
                    currentPanel = .two
                    panelLogic.isPanelChanged = false
                }
            }

    }
    
}
