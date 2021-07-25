import UIKit

class ColorSelectorViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor()
    }
    
    @IBAction func sliderChanged() {
        updateColor()
    }
    
    
    private func updateColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value), alpha: 1)
        redLabel.text = String(format: "%.2f", redSlider.value)
        redTextField.text = redLabel.text
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = greenLabel.text
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = blueLabel.text
    }
}
