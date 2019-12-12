
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctbutton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var valueToPass = "0"
    

    
    @IBAction func tipChanged(_ sender: UIButton) {
        //Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctbutton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipAmount = buttonTitleAsANumber / 100
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //Get the text the user typed in the billTextField
        
        let bill = billTextField.text!
        
        if bill != "" {
            
            billTotal = Double(bill)!
            
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = (billTotal * (1 + tipAmount)) / Double(numberOfPeople)
            
            //Round the result to 2 decimal places and turn it into a String.
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            
            //Prepare value for passing to segue
            valueToPass = resultTo2DecimalPlaces
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.passedValue = valueToPass
            destinationVC.peoplePassed = numberOfPeople
            destinationVC.tipPassed = String(format: "%.0f", tipAmount*100)+"%"
            
        }
    }

}

