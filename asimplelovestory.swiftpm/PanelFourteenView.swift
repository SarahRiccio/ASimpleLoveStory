import Foundation
import SwiftUI
import SpriteKit


struct PanelFourteenView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelFourteenScene:PanelFourteenScene {
        let scene = PanelFourteenScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelFourteenScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 15 {
                    currentPanel = .fifteen
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
