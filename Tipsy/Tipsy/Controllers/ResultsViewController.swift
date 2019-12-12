

import UIKit

class ResultsViewController: UIViewController {
    
    var passedValue = ""
    var peoplePassed = 0
    var tipPassed = ""
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = passedValue
        settingsLabel.text = "Split between \(peoplePassed) people, with \(tipPassed) tip."

    }
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
