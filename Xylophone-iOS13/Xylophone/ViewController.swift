import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        //Immediately reduces pressed button (Sender) alpha to half
        sender.alpha = 0.5
        
        //Function to delay code within (returning opacity to full)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Return sender's opacity back to full after delay
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
