import Foundation
import SpriteKit


class PanelTwentyfiveScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panelOne:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta25-1")
    var panelTwo:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta25-2")
    var heartOne:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta25cuori-1")
    var heartTwo:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta25cuori-2")
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panelOne.drawBorder(color: .black, width: 7)
        self.panelOne.zPosition = 1
        self.panelOne.xScale = 0.7
        self.panelOne.yScale = 0.7
        self.panelOne.position.x = 200
        self.panelOne.position.y = -100

        self.panelTwo.drawBorder(color: .black, width: 7)
        self.panelTwo.zPosition = 1
        self.panelTwo.xScale = 0.7
        self.panelTwo.yScale = 0.7
        self.panelTwo.position.x = -200
        self.panelTwo.position.y = 100
        
        self.addHeartOne()
        self.addHeartTwo()
        
        self.wrapper.addChild(self.panelOne)
        self.wrapper.addChild(self.panelTwo)
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panelOne.size.width/2)
        self.addChild(self.wrapper)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
    }
    
    func addHeartOne(){
        self.heartOne.position.x = self.panelOne.position.x
        self.heartOne.position.y = 150
        self.heartOne.alpha = 0
        self.wrapper.addChild(self.heartOne)
    }
    
    func addHeartTwo(){
        self.heartTwo.position.x = -90
        self.heartTwo.position.y = self.panelTwo.size.height + 80
        self.heartTwo.alpha = 0
        self.wrapper.addChild(self.heartTwo)
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let heartOneAction = SKAction.run {
            self.heartTwo.run(self.animation())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, heartOneAction]))
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panelOne.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 26
            self.removeFromParent()
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, removeAction]))
        let disappearAction = SKAction.fadeAlpha(to: 0, duration: 0.5)
        self.nextButton.run(disappearAction)
    }
    
    func animation() -> SKAction{
        
        let fadeinAction = SKAction.fadeIn(withDuration: 1)
        let waitAction = SKAction.wait(forDuration: 0.3)
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        let heartOneAction = SKAction.run {
            self.heartOne.run(SKAction.sequence([fadeinAction, waitAction, nextButtonAppearAction]))
        }
        
        let action = SKAction.sequence([waitAction, fadeinAction, waitAction, heartOneAction])
        
        return action
        
    }
    
    override func didMove(to view: SKView) {
        self.enterAnimation()
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
