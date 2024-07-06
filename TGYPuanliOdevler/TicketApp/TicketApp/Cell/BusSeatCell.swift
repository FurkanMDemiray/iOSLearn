//
//  BusSeatCell.swift
//  TicketApp
//
//  Created by Melik Demiray on 25.04.2024.
//

import UIKit

class BusSeatCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftButtun: UIButton!
    @IBOutlet weak var rightButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizerToLabels()
        checkSeatsIsChosen()
    }
    
    private func addGestureRecognizerToLabels() {
        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(leftLabelTapped))
        leftLabel.addGestureRecognizer(leftTapGesture)
        leftLabel.isUserInteractionEnabled = true

        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(rightLabelTapped))
        rightLabel.addGestureRecognizer(rightTapGesture)
        rightLabel.isUserInteractionEnabled = true
    }

    @objc func leftLabelTapped() {
        if let leftSeat = leftLabel.text {
            if BusVC.chosenSeats.count < 5 && leftLabel.textColor != .systemGreen && leftLabel.textColor != .systemRed {
                BusVC.chosenSeats.append(leftSeat)
                leftLabel.textColor = .systemGreen
            }
            else if leftLabel.textColor == .systemRed {
                showAlert("Uyarı", "Bu koltuk satın alınmıştır.")
            }
            else {
                leftLabel.textColor = .black
                if let index = BusVC.chosenSeats.firstIndex(of: leftSeat) {
                    BusVC.chosenSeats.remove(at: index)
                }
                else {
                    showAlert("Uyarı", "En fazla 5 koltuk seçebilirsiniz.")
                }
            }
        }
    }

    @objc func rightLabelTapped() {
        if let rightSeat = rightLabel.text {
            if BusVC.chosenSeats.count < 5 && rightLabel.textColor != .systemGreen && rightLabel.textColor != .systemRed {
                BusVC.chosenSeats.append(rightSeat)
                rightLabel.textColor = .systemGreen
            }
            else if rightLabel.textColor == .systemRed {
                showAlert("Uyarı", "Bu koltuk satın alınmıştır.")
            }
            else {
                rightLabel.textColor = .black
                if let index = BusVC.chosenSeats.firstIndex(of: rightSeat) {
                    BusVC.chosenSeats.remove(at: index)
                }
                else {
                    showAlert("Uyarı", "En fazla 5 koltuk seçebilirsiniz.")
                }
            }
        }
    }

    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(action)
        if let vc = UIApplication.shared.windows.first?.rootViewController {
            vc.present(alert, animated: true, completion: nil)
        }
    }

    func configureCell(with leftSeat: String, with rightSeat: String, seats: [String: Bool]) {
        leftLabel.text = leftSeat
        rightLabel.text = rightSeat

        for seat in seats {
            if seat.key == leftSeat {
                if seat.value {
                    leftLabel.textColor = .systemRed
                }
            }
            if seat.key == rightSeat {
                if seat.value {
                    rightLabel.textColor = .systemRed
                }
            }
        }
    }

    private func checkSeatsIsChosen() {
        if BusVC.chosenSeats.contains(leftLabel.text!) {
            leftLabel.textColor = .systemGreen
        }
        else {
            leftLabel.textColor = .black
        }

        if BusVC.chosenSeats.contains(rightLabel.text!) {
            rightLabel.textColor = .systemGreen
        }
        else {
            rightLabel.textColor = .black
        }
    }
}
