import Foundation
import SpriteKit

extension SKSpriteNode {
    
    func drawBorder(color: UIColor, width: CGFloat) {
        let shapeNode = SKShapeNode(rect: frame)
        shapeNode.fillColor = .clear
        shapeNode.strokeColor = color
        shapeNode.lineWidth = width
        addChild(shapeNode)
    }
    
}

class PanelOneScene:SKScene {
    var panelsLogic: PanelsLogic = PanelsLogic.shared
    
    var wrapper:SKNode = SKNode()
    var panel:SKSpriteNode = SKSpriteNode(imageNamed: "vignetta1base")
    var dogTail:SKSpriteNode = SKSpriteNode(imageNamed: "vigntta1coda")
    var nextButton:SKSpriteNode = SKSpriteNode(imageNamed: "tap")
    
    override func sceneDidLoad() {
        self.backgroundColor = SKColor.white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.wrapper.position.x = CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2)
        
        self.panel.drawBorder(color: .black, width: 7)
        self.panel.zPosition = 1
        self.wrapper.addChild(self.panel)
        
        self.dogTail.zPosition = 2
        self.dogTail.position = CGPoint( x: CGFloat(self.panel.size.width/2 - self.dogTail.size.width/2 - 80), y: CGFloat(-self.panel.size.height/2 + self.dogTail.size.height/2) )
        
        self.runDogTailAnimation()
        
        self.wrapper.addChild(self.dogTail)
        
        self.nextButton.name = "nextButton"
        self.nextButton.alpha = 0
        self.nextButton.zPosition = 3
        self.nextButton.position = CGPoint(x: CGFloat(UIScreen.main.bounds.size.width/2 - self.nextButton.size.width), y: CGFloat(-UIScreen.main.bounds.size.height/2 + 100))
        self.addChild(self.nextButton)
        
        self.addChild(self.wrapper)
        
    }
    
    override func didMove(to view: SKView) {
        self.enterAnimation()
    }
    
    func runDogTailAnimation(){
        
        let rotationActionPositive = SKAction.moveBy(x: 10, y: 0, duration: 0.5)
        let rotationActionNegative = SKAction.moveBy(x: -10, y: 0, duration: 0.5)
        let happyTailAction = SKAction.sequence([rotationActionNegative, rotationActionPositive])
        let repeatForever = SKAction.repeatForever(happyTailAction)
        
        self.dogTail.run(repeatForever)
        
    }
    
    func enterAnimation() {
        let slideAction = SKAction.move(to: .zero, duration: 1.2)
        
        let nextButtonAppearAction = SKAction.run {
            let appearAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
            self.nextButton.run(appearAction)
        }
        
        self.wrapper.run(SKAction.sequence([slideAction, nextButtonAppearAction]))
        
    }
    
    func exitAnimation() {
        let slideAction = SKAction.moveTo(x: -CGFloat(UIScreen.main.bounds.width + self.panel.size.width/2), duration: 1.2)
        
        let removeAction = SKAction.run {
            self.panel.removeFromParent()
            self.panelsLogic.isPanelChanged = true
            self.panelsLogic.currentPanel = 2
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

