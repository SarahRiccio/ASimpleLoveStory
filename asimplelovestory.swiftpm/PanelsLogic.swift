import Foundation


class PanelsLogic:ObservableObject {
    
    static let shared:PanelsLogic = PanelsLogic()
    
    @Published var isPanelChanged: Bool = false
    @Published var currentPanel:Int = 0
    
}
