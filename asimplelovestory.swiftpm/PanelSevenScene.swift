import Foundation
import SpriteKit


class PanelSevenScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta7")
    var coriandoliOne:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta7coriandoli1")
    var coriandoliTwo:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta7coriandoli2")
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 1
        
        self.addCoriandoliOne()
        self.addCoriandoliTwo()
        
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        self.wrapper.addChild(self.panel)
        self.addChild(self.wrapper)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
    }
    
    func addCoriandoliOne() {
        self.coriandoliOne.alpha = 0
        self.coriandoliOne.zPosition = 2
        self.coriandoliOne.position.x = CGFloat(-self.panel.size.width/2 + 65)
        self.wrapper.addChild(self.coriandoliOne)
    }
    
    func addCoriandoliTwo() {
        self.coriandoliTwo.alpha = 0
        self.coriandoliTwo.zPosition = 2
        self.coriandoliTwo.position.x = CGFloat(self.panel.size.width/2 - self.coriandoliTwo.size.width/2 - 20)
        self.coriandoliTwo.position.y = 60
        self.wrapper.addChild(self.coriandoliTwo)
    }
    
    func animation() -> SKAction{
        
        let fadeinAction = SKAction.fadeIn(withDuration: 1)
        let waitAction = SKAction.wait(forDuration: 0.3)
        
        let coriandoliTwoAction = SKAction.run {
            self.coriandoliTwo.run(fadeinAction)
        }
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        
        let action = SKAction.sequence([fadeinAction, waitAction, coriandoliTwoAction, waitAction, waitAction, waitAction, nextButtonAppearAction])
        
        return action
        
    }
    
    override func didMove(to view: SKView) {
        self.enterAnimation()
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let coriandoliAction = SKAction.run {
            self.coriandoliOne.run(self.animation())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, coriandoliAction]))
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 8
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
