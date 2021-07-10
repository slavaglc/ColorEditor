import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor()
    }
    
    private func updateColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value), alpha: 1)
        redLabel.text = "Red: \(String(format: "%.3f", redSlider.value))"
        greenLabel.text = "Green: \(String(format: "%.3f", greenSlider.value))"
        blueLabel.text = "Blue: \(String(format: "%.3f", blueSlider.value))"
    }
    
    @IBAction func sliderChanged() {
        updateColor()
    }
}
