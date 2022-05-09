import Foundation
import SwiftUI
import SpriteKit

struct PanelTwentyoneView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelTwentyoneScene:PanelTwentyoneScene {
        let scene = PanelTwentyoneScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
            
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.panelTwentyoneScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 22 {
                    currentPanel = .twentytwo
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
