import Foundation
import SwiftUI
import SpriteKit


struct PanelFifteenView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelFifteenScene:PanelFifteenScene {
        let scene = PanelFifteenScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelFifteenScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 16 {
                    currentPanel = .sixteen
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
