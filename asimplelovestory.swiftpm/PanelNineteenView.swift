import Foundation
import SwiftUI
import SpriteKit

struct PanelNineteenView:View {
    
    @Binding var currentPanel:Panels
    @StateObject var panelLogic:PanelsLogic = PanelsLogic.shared
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var panelNineteenScene:PanelNineteenScene {
        let scene = PanelNineteenScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {

        SpriteView(scene: self.panelNineteenScene)
            .onChange(of: panelLogic.isPanelChanged) { _ in
                if panelLogic.currentPanel == 20 {
                    currentPanel = .twenty
                    panelLogic.isPanelChanged = false
                }
            }
    }
    
}
