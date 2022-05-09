import Foundation
import SwiftUI
import SpriteKit


struct PanelSixteenView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelSixteenScene:PanelSixteenScene {
        let scene = PanelSixteenScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelSixteenScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 17 {
                    currentPanel = .seventeen
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
