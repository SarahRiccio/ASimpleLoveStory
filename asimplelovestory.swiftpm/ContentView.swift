import SwiftUI
import AVKit

struct ContentView: View {
    
    @StateObject var panelLogic:PanelsLogic = PanelsLogic()
    @State var currentPanel:Panels = .title
    @State var audioPlayer: AVAudioPlayer!

    var body: some View {
        
        ZStack{
            switch currentPanel {
            case .title:
                PanelMainView(currentPanel:$currentPanel)
                    .environmentObject(panelLogic)
            case .one:
                PanelOneView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .two:
                PanelTwoView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .three:
                PanelThreeView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .four:
                PanelFourView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .five:
                PanelFiveView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .six:
                PanelSixView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .seven:
                PanelSevenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .eight:
                PanelEightView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .nine:
                PanelNineView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .ten:
                PanelTenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .eleven:
                PanelElevenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twelve:
                PanelTwelveView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .thirteen:
                PanelThirteenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .fourteen:
                PanelFourteenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .fifteen:
                PanelFifteenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .sixteen:
                PanelSixteenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .seventeen:
                PanelSeventeenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .eighteen:
                PanelEighteenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .nineteen:
                PanelNineteenView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twenty:
                PanelTwentyView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twentyone:
                PanelTwentyoneView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twentytwo:
                PanelTwentytwoView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twentythree:
                PanelTwentythreeView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twentyfour:
                PanelTwentyfourView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .twentyfive:
                PanelTwentyfiveView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            case .beginning:
                PanelBeginningView(currentPanel: $currentPanel)
                    .environmentObject(panelLogic)
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "the-cradle-of-your-soul", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
        
    }
}
