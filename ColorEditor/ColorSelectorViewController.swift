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
    
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPrimaryGUI()
    }
    
   
    @IBAction func valueChanged(_ sender: UISlider) {
        print("Starting value changed")
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
    
    private func setPrimaryGUI() {
        redSlider.value = Float(color.components.red)
        redTextField.text = String(redSlider.value)
        redLabel.text = redTextField.text
        
        greenSlider.value = Float(color.components.green)
        greenTextField.text = String(greenSlider.value)
        greenLabel.text = greenTextField.text
        
        blueSlider.value = Float(color.components.blue)
        blueTextField.text = String(blueSlider.value)
        blueLabel.text = blueTextField.text
        updateColor()
    }
        
    private func updateColor() {
        color = UIColor(red: CGFloat(redSlider.value),
                           green: CGFloat(greenSlider.value),
                           blue: CGFloat(blueSlider.value), alpha: 1)
        colorView.backgroundColor = color
        
    }
}
