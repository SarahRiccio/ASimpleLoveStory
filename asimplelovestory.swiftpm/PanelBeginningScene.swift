import Foundation
import SpriteKit


class PanelBeginningScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var title:SKSpriteNode = SKSpriteNode(imageNamed: "theBeginning")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.title.zPosition = 1
        self.wrapper.addChild(self.title)
        
        self.addChild(self.wrapper)
        
    }
    
}
