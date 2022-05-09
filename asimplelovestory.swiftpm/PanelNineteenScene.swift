import Foundation
import SpriteKit

class PanelNineteenScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta19")
    var sun:SKTexture = SKTexture(imageNamed: "sole")
    var moon:SKTexture = SKTexture(imageNamed: "luna")
    var days:SKSpriteNode = SKSpriteNode()
    var shield:SKSpriteNode = SKSpriteNode()
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 2
        
        self.addDay()
        
        self.wrapper.addChild(self.panel)
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        self.addChild(self.wrapper)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
    }
    
    func addDay() {
        let shieldSize = CGSize(width: self.sun.size().width, height: self.sun.size().height)
        self.shield = SKSpriteNode(color: .white, size: shieldSize)
        self.shield.zPosition = 1
        self.shield.position.x = 230
        self.shield.position.y = -CGFloat(self.panel.size.height/2 + self.sun.size().height/2)
        self.wrapper.addChild(self.shield)
        
        self.days = SKSpriteNode(texture: self.sun)
        self.days.zPosition = 0
        self.days.position.x = 230
        self.days.position.y = 30
        self.wrapper.addChild(self.days)
    }
    
    override func didMove(to view: SKView) {
        self.enterAnimation()
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let panelAction = SKAction.run {
            self.days.run(self.animation())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, panelAction]))
        
    }
    
    func animation() -> SKAction {
        
        let waitAction = SKAction.wait(forDuration: 1)
        let moveDown = SKAction.moveTo(y: -300, duration: 0.5)
        let moveUp = SKAction.moveTo(y: 30, duration: 0.5)
        let changeTextureOne = SKAction.setTexture(self.moon)
        let changeTextureTwo = SKAction.setTexture(self.sun)
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        let action = SKAction.sequence([moveDown, changeTextureOne, waitAction, moveUp, waitAction, moveDown, changeTextureTwo, waitAction, moveUp, waitAction])
        
        let upDownAction = SKAction.repeat(action, count: 1)
        
        let sequence = SKAction.sequence([waitAction, upDownAction, nextButtonAppearAction])
        
        return sequence
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 20
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
