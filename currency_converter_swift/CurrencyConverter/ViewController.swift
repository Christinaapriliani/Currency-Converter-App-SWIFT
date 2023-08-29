import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var fromCurrencySegmentedControl: UISegmentedControl!
    @IBOutlet weak var toCurrencySegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        if let amount = Double(amountTextField.text ?? "0") {
            let fromCurrencyIndex = fromCurrencySegmentedControl.selectedSegmentIndex
            let toCurrencyIndex = toCurrencySegmentedControl.selectedSegmentIndex
            let exchangeRate: Double = getExchangeRate(from: fromCurrencyIndex, to: toCurrencyIndex)
            let convertedAmount = amount * exchangeRate
            resultLabel.text = String(format: "%.2f", convertedAmount)
        }
    }

    func getExchangeRate(from fromIndex: Int, to toIndex: Int) -> Double {
        // Implement your own logic to get exchange rates
        // This is just a placeholder
        let exchangeRates: [Double] = [1.0, 0.85, 0.75] // USD, EUR, GBP
        return exchangeRates[toIndex] / exchangeRates[fromIndex]
    }
}
