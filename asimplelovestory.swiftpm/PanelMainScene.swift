import Foundation
import SpriteKit


class PanelMainScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var title:SKSpriteNode = SKSpriteNode(imageNamed: "title")
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.title.zPosition = 1
        self.title.xScale = 0.6
        self.title.yScale = 0.6
        self.wrapper.addChild(self.title)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 1
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
        self.addChild(self.wrapper)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let node = self.atPoint(touch.location(in: self))
            
            if node.name == self.nextButton.name {
                self.exitAnimation()
                
            }
            
        }
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.title.size.width/2), duration: 1.2)
        let removeAction = SKAction.run {
            self.title.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 1
            self.removeFromParent()
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, removeAction]))
        let disappearAction = SKAction.fadeAlpha(to: 0, duration: 0.5)
        self.nextButton.run(disappearAction)
    }
    
}
