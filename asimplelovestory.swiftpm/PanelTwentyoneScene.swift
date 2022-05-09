import Foundation
import SpriteKit


class PanelTwentyoneScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta21-1")
    var frameOnePanelAnim:SKTexture = SKTexture(imageNamed: "vignetta21-2")
    var frameTwoPanelAnim:SKTexture = SKTexture(imageNamed: "vignetta21-3")
    
    var clock:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta21orologio-1")
    var frameOneClockAnim:SKTexture = SKTexture(imageNamed: "vignetta21orologio-2")
    var frameTwoClockAnim:SKTexture = SKTexture(imageNamed: "vignetta21orologio-3")
    var frameThreeClockAnim:SKTexture = SKTexture(imageNamed: "vignetta21orologio-4")
    
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 1
        
        self.addClock()
        
        self.wrapper.addChild(self.panel)
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        self.addChild(self.wrapper)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
    }
    
    func addClock() {
        self.clock.zPosition = 2
        self.clock.alpha = 0
        self.clock.position.x = -CGFloat(self.panel.size.width/2)
        self.clock.position.y = CGFloat(self.panel.size.height/2)
        self.wrapper.addChild(self.clock)
    }
    
    override func didMove(to view: SKView) {
        self.enterAnimation()
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let panelAction = SKAction.run {
            self.clock.run(self.animation())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, panelAction]))
        
    }
    
    func animation() -> SKAction {
        
        let waitAction = SKAction.wait(forDuration: 0.5)
        let longWaitAction = SKAction.wait(forDuration: 1.5)
        let fadeinAction = SKAction.fadeIn(withDuration: 1)
        let changeTextClockOne = SKAction.setTexture(self.frameOneClockAnim)
        let changeTextClockTwo = SKAction.setTexture(self.frameTwoClockAnim)
        let changeTextClockThree = SKAction.setTexture(self.frameThreeClockAnim)
        
        let changeTextPanelOne = SKAction.setTexture(self.frameOnePanelAnim)
        let changeTexPanelTwo = SKAction.setTexture(self.frameTwoPanelAnim)
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        let clockAnim = SKAction.sequence([fadeinAction, waitAction, changeTextClockOne, longWaitAction, changeTextClockTwo, longWaitAction, changeTextClockThree, nextButtonAppearAction])
        
        let clockAction = SKAction.run {
            self.clock.run(clockAnim)
        }
        
        let panelAnim = SKAction.sequence([longWaitAction, waitAction, changeTextPanelOne, longWaitAction, changeTexPanelTwo])
        
        let panelAction = SKAction.run {
            self.panel.run(panelAnim)
        }
        
        let group = SKAction.group([clockAction, panelAction])
        
        let sequence = SKAction.sequence([waitAction, group])
        
        return sequence
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 22
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
