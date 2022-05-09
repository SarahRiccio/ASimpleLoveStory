import Foundation
import SwiftUI
import SpriteKit


struct PanelThirteenView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelThirteenScene:PanelThirteenScene {
        let scene = PanelThirteenScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelThirteenScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 14 {
                    currentPanel = .fourteen
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
