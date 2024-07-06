//
//  ViewController.swift
//  CurrencyApi
//
//  Created by Melik Demiray on 4.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLbl: UILabel!

    @IBOutlet weak var chfLbl: UILabel!

    @IBOutlet weak var gbpLvl: UILabel!

    @IBOutlet weak var jpyLBl: UILabel!

    @IBOutlet weak var usdLbl: UILabel!

    @IBOutlet weak var tryLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        getAPIData()
    }


    func getAPIData() {

        let url = URL(string: "http://data.fixer.io/api/latest?access_key=9d2ab3f08745cdf769ff4229878dce74&format=1")

        let session = URLSession.shared

        let task = session.dataTask(with: url!) { data, response, error in

            if error != nil {
                let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)

            }
            else {

                if data != nil {

                    do {

                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>

                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? Dictionary<String , Any> {

                                if let cad = rates["CAD"] as? Double {
                                    self.cadLbl.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLbl.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLvl.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLBl.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLbl.text = "USD: \(usd)"
                                }
                                if let trl = rates["TRY"] as? Double {
                                    self.tryLbl.text = "TRY: \(trl)"
                                }

                            }

                        }
                    }
                    catch {
                        print("error")
                    }

                }

            }

        }
        task.resume()

    }


}

