import Foundation
import SwiftUI
import SpriteKit


struct PanelFourView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelFourScene:PanelFourScene {
        let scene = PanelFourScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelFourScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 5 {
                    currentPanel = .five
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
