import Foundation
import SpriteKit


class PanelSixScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode()
    var giftBox:SKTexture = SKTexture(imageNamed: "vignetta6")
    var giftBoxSprite:SKSpriteNode = SKSpriteNode()
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panel = SKSpriteNode(color: .clear, size: self.giftBox.size())
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 2
        
        let shield:SKSpriteNode = SKSpriteNode(color: .white, size: giftBox.size())
        shield.position.x = self.panel.size.width
        shield.zPosition = 1
        self.wrapper.addChild(shield)
        
        self.giftBoxSprite = SKSpriteNode(texture: giftBox)
        self.giftBoxSprite.zPosition = 0
        self.giftBoxSprite.position.x = self.panel.size.width
        self.wrapper.addChild(self.giftBoxSprite)
        
        self.wrapper.addChild(self.panel)
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        self.addChild(self.wrapper)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
    }
    
    override func didMove(to view: SKView) {
        self.enterAnimation()
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let panelAction = SKAction.run {
            self.giftBoxSprite.run(self.animation())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, panelAction]))
        
    }
    
    func animation() -> SKAction {
        
        let waitAction = SKAction.wait(forDuration: 1)
        let moveIn = SKAction.moveTo(x: 0, duration: 1.5)
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        let sequence = SKAction.sequence([waitAction, moveIn, nextButtonAppearAction])
        
        return sequence
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 7
            self.removeFromParent()
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, removeAction]))
        let disappearAction = SKAction.fadeAlpha(to: 0, duration: 0.5)
        self.nextButton.run(disappearAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let node = atPoint(touch.location(in: self))
            
            // change panel
            if node.name == self.nextButton.name {
                self.exitAnimation()
            }
            
        }
        
    }
    
    
}
