import UIKit


protocol ColorSelectorViewControllerDelegate {
    func setColor(color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSelectorVC = segue.destination as? ColorSelectorViewController else { return }
        colorSelectorVC.color = view.backgroundColor
        colorSelectorVC.delegate = self
    }
}

extension MainViewController: ColorSelectorViewControllerDelegate {
    func setColor(color: UIColor) {
        view.backgroundColor = color
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
