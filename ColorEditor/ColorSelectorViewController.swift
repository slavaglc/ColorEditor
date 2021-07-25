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
    var delegate: ColorSelectorViewControllerDelegate!
    var selectedTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPrimaryGUI()
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
    
    private func setPrimaryGUI() {
        redSlider.value = Float(color.components.red)
        redTextField.text = String(format: "%.2f", redSlider.value)
        redLabel.text = redTextField.text
        redTextField.delegate = self
        
        greenSlider.value = Float(color.components.green)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        greenLabel.text = greenTextField.text
        greenTextField.delegate = self
        
        blueSlider.value = Float(color.components.blue)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        blueLabel.text = blueTextField.text
        blueTextField.delegate = self
        
        addDoneButtonOnKeyboard()
        updateColor()
    }
        
    private func updateColor() {
        color = UIColor(red: CGFloat(redSlider.value),
                           green: CGFloat(greenSlider.value),
                           blue: CGFloat(blueSlider.value), alpha: 1)
        colorView.backgroundColor = color
        delegate.setColor(color: color)
    }
    
  
}

extension ColorSelectorViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTF = textField
    }
    
    private func addDoneButtonOnKeyboard(){
             let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
             doneToolbar.barStyle = .default

             let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
             let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

             let items = [flexSpace, done]
             doneToolbar.items = items
             doneToolbar.sizeToFit()

         redTextField.inputAccessoryView = doneToolbar
         greenTextField.inputAccessoryView = doneToolbar
         blueTextField.inputAccessoryView = doneToolbar
         }
     
     @objc private func doneButtonAction() {
        let numberFormatter = NumberFormatter()
        guard let text = selectedTF.text else { return }
        let number = numberFormatter.number(from: text)
        selectedTF.resignFirstResponder()
        guard let float = number?.floatValue else { return }
        guard float <= 1.0 else { return selectedTF.text = "1.00"}
        
        if selectedTF.tag == 0 {
            redSlider.setValue(float, animated: true)
        } else if selectedTF.tag == 1 {
            greenSlider.setValue(float, animated: true)
        } else {
            blueSlider.setValue(float, animated: true)
        }
        updateColor()
     }
}
