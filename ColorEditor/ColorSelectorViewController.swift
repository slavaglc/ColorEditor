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
    
   
    @IBAction func valueChanged(_ sender: UISlider) {
        if sender.tag == 0 {
            redLabel.text = String(format: "%.2f", sender.value)
            redTextField.text = redLabel.text
        } else if sender.tag == 1 {
            greenLabel.text = String(format: "%.2f", sender.value)
            greenTextField.text = greenLabel.text
        } else {
            blueLabel.text = String(format: "%.2f", sender.value)
            blueTextField.text = blueLabel.text
        }
        updateColor()
    }
    
    
    private func updateColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value), alpha: 1)
    }
}
