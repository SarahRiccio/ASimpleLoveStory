import Foundation
import SpriteKit


class PanelEightScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta8-1")
    var frameOne:SKTexture = SKTexture(imageNamed: "vignetta8-2")
    var frameTwo:SKTexture = SKTexture(imageNamed: "vignetta8-3")
    var frameThree:SKTexture = SKTexture(imageNamed: "vignetta8-4")
    var frameFour:SKTexture = SKTexture(imageNamed: "vignetta8-5")
    var frameFive:SKTexture = SKTexture(imageNamed: "vignetta8-6")
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 1
        
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        self.wrapper.addChild(self.panel)
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
            self.panel.run(self.animation())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, panelAction]))
        
    }
    
    func animation() -> SKAction {
        
        let longWaitAction = SKAction.wait(forDuration: 1)
        let waitAction = SKAction.wait(forDuration: 0.08)
        let changeTextureOne = SKAction.setTexture(frameOne)
        let changeTextureTwo = SKAction.setTexture(frameTwo)
        let changeTextureThree = SKAction.setTexture(frameThree)
        let changeTextureFour = SKAction.setTexture(frameFour)
        let changeTextureFive = SKAction.setTexture(frameFive)
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        let sequence = SKAction.sequence([longWaitAction, changeTextureOne, waitAction, changeTextureTwo, waitAction, changeTextureThree, waitAction, changeTextureFour, waitAction, changeTextureFive,  waitAction, waitAction, nextButtonAppearAction])
        
        return sequence
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 9
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
