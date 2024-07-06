//
//  ViewController.swift
//  TicketApp
//
//  Created by Melik Demiray on 20.04.2024.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var cityFromWhere: UILabel!
    @IBOutlet weak var cityWhereTo: UILabel!
    @IBOutlet weak var changeCitiesButton: UIButton!
    @IBOutlet weak var locationPickerView: UIView!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var tomorrovButton: UIButton!
    @IBOutlet weak var travelTimeLabel: UILabel!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!

    var ticket: Ticket = Ticket()
    static var whereTo = "İstanbul"
    static var fromWhere = "Ankara"

    override func viewDidLoad() {
        super.viewDidLoad()
        addCitiesLabelsGesture()
        configureLocationPickerView()
        configuredatePickerView()
        configureTodayButton()
        configureTomorrowButton()
        setTodayDate()
        addGestureToTravelTimeLabel()
        setTicketDate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityFromWhere.text = SearchVC.fromWhere
        cityWhereTo.text = SearchVC.whereTo
    }

    private func setTicket() {
        ticket.fromWhere = cityFromWhere.text!
        ticket.whereTo = cityWhereTo.text!
    }

    private func configureLocationPickerView() {
        locationPickerView.layer.shadowColor = UIColor.black.cgColor
        locationPickerView.layer.shadowOpacity = 0.3
        locationPickerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        locationPickerView.layer.shadowRadius = 5
        locationPickerView.layer.cornerRadius = 5
    }

    private func configuredatePickerView() {
        datePickerView.layer.shadowColor = UIColor.black.cgColor
        datePickerView.layer.shadowOpacity = 0.3
        datePickerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        datePickerView.layer.shadowRadius = 5
        datePickerView.layer.cornerRadius = 5
    }

    private func configureTodayButton() {
        todayButton.layer.cornerRadius = 5
        todayButton.tintColor = .systemRed
        todayButton.titleLabel?.textColor = .white
        todayButton.layer.borderWidth = 1
        todayButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        todayButton.isSelected = true
    }

    private func configureTomorrowButton() {
        tomorrovButton.layer.cornerRadius = 5
        tomorrovButton.tintColor = .systemRed
        tomorrovButton.titleLabel?.textColor = .white
        tomorrovButton.layer.borderWidth = 1
        tomorrovButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        tomorrovButton.isSelected = false
    }

    private func addCitiesLabelsGesture() {
        let tapGestureFrom = UITapGestureRecognizer(target: self, action: #selector(cityFromWhereClicked))
        cityFromWhere.addGestureRecognizer(tapGestureFrom)
        cityFromWhere.isUserInteractionEnabled = true

        let tapGestureTo = UITapGestureRecognizer(target: self, action: #selector(cityWhereToClicked))
        cityWhereTo.addGestureRecognizer(tapGestureTo)
        cityWhereTo.isUserInteractionEnabled = true
    }

    private func addGestureToTravelTimeLabel() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(travelTimeLabelClicked))
        travelTimeLabel.addGestureRecognizer(tapGesture)
        travelTimeLabel.isUserInteractionEnabled = true
    }

    @objc func travelTimeLabelClicked() {
        makeDatePickerHiddenAnimation()
    }

    @objc func cityFromWhereClicked() {
        performSegue(withIdentifier: "toPickCityVC", sender: "from")
    }

    @objc func cityWhereToClicked() {
        performSegue(withIdentifier: "toPickCityVC", sender: "to")
    }

    private func makeLabelsChangeAnimation() {
        UIView.transition(with: cityFromWhere, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cityWhereTo, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }

    private func makeButtonAnimation() {
        UIView.transition(with: changeCitiesButton, duration: 0.5, options: .transitionFlipFromBottom, animations: nil, completion: nil)
    }

    private func setTodayDate() {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        travelTimeLabel.text = formatter.string(from: today)
    }

    @IBAction func changeCitiesBtnClicked(_ sender: Any) {
        let temp = cityFromWhere.text
        cityFromWhere.text = cityWhereTo.text
        cityWhereTo.text = temp
        makeLabelsChangeAnimation()
        makeButtonAnimation()
    }

    @IBAction func todayButtonClicked(_ sender: Any) {
        setTodayDate()
        todayButton.layer.borderColor = UIColor.systemRed.cgColor
        todayButton.isSelected = true
        tomorrovButton.isSelected = false
        tomorrovButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func tomorrowButtonClicked(_ sender: Any) {
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        travelTimeLabel.text = formatter.string(from: tomorrow!)

        tomorrovButton.layer.borderColor = UIColor.systemRed.cgColor
        tomorrovButton.isSelected = true
        todayButton.isSelected = false
        todayButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func dateSelected(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        travelTimeLabel.text = formatter.string(from: datePicker.date)
        setTicketDate()
        makeDatePickerHiddenAnimation()
    }

    private func setTicketDate() {
        let date = travelTimeLabel.text
        let components = date?.components(separatedBy: "/")
        ticket.date.day = Int(components![0])!
        ticket.date.month = Int(components![1])!
        ticket.date.year = Int(components![2])!
    }

    private func makeDatePickerHiddenAnimation() {
        UIView.transition(with: datePicker, duration: 0.4, options: .transitionCurlDown, animations: {
            self.datePicker.isHidden = !self.datePicker.isHidden
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPickCityVC" {
            let vc = segue.destination as! CityPickerVC
            vc.whereToOrFrom = sender as! String
        }
        if segue.identifier == "toVoyagesVC" {
            let vc = segue.destination as! VoyagesVC
            vc.ticket = ticket
        }
    }

    @IBAction func searchTicketBtnClicked(_ sender: Any) {
        setTicket()
        performSegue(withIdentifier: "toVoyagesVC", sender: nil)
    }
}

