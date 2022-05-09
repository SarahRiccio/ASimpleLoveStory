import Foundation
import SwiftUI
import SpriteKit


struct PanelTwentyfiveView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelTwentyfiveScene:PanelTwentyfiveScene {
        let scene = PanelTwentyfiveScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelTwentyfiveScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 26 {
                    currentPanel = .beginning
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
