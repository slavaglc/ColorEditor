import UIKit

class MainViewController: UIViewController {
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        color = view.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSelectorVC = segue.destination as? ColorSelectorViewController else { return }
        colorSelectorVC.color = color
    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
