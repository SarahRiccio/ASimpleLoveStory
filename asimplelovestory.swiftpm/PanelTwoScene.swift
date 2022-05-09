import Foundation
import SpriteKit

class PanelTwoScene:SKScene {
    
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta2base")
    var balloonOne = SKSpriteNode(imageNamed: "vignetta2balloon1")
    var balloonOneFull:SKTexture = SKTexture(imageNamed: "vignetta2balloon1full")
    var balloonTwo = SKSpriteNode(imageNamed: "vignetta2balloon2")
    var balloonTwoFull:SKTexture = SKTexture(imageNamed: "vignetta2balloon2full")
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = .white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 1
        
        self.addBallonOne()
        self.addBalloonTwo()
        
        self.wrapper.addChild(self.panel)
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        self.addChild(self.wrapper)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
    }
    
    func addBallonOne(){
        self.balloonOne.zPosition = 2
        self.balloonOne.alpha = 0
        self.balloonOne.position = CGPoint(x: 0, y: CGFloat(self.panel.size.height/2))
        self.wrapper.addChild(self.balloonOne)
    }
    
    func addBalloonTwo(){
        self.balloonTwo.zPosition = 2
        self.balloonTwo.alpha = 0
        self.balloonTwo.position = CGPoint(x: CGFloat(self.panel.size.width/2-200), y: 60)
        self.wrapper.addChild(self.balloonTwo)
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let balloonAction = SKAction.run {
            self.balloonOne.run(self.balloonsAnim())
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, balloonAction]))
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 3
            self.removeFromParent()
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, removeAction]))
        let disappearAction = SKAction.fadeAlpha(to: 0, duration: 0.5)
        self.nextButton.run(disappearAction)
    }
    
    func balloonsAnim() -> SKAction{
        
        let balloonOneAction = SKAction.fadeIn(withDuration: 1)
        let waitAction = SKAction.wait(forDuration: 1)
        let changeTextureOne = SKAction.setTexture(self.balloonOneFull)
        let changeTextureTwo = SKAction.setTexture(self.balloonTwoFull)
        
        let balloonTwoAction = SKAction.run {
            let balloonTwoAction = SKAction.sequence([balloonOneAction, waitAction, changeTextureTwo])
            self.balloonTwo.run(balloonTwoAction)
        }
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        
        let action = SKAction.sequence([balloonOneAction, waitAction, changeTextureOne, waitAction, balloonTwoAction, waitAction, waitAction, nextButtonAppearAction])
        
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
