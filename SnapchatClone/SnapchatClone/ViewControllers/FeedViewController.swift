//
//  FeedViewController.swift
//  SnapchatClone
//
//  Created by Melik Demiray on 8.12.2023.
//

import UIKit
import Firebase
import SDWebImage
import ImageSlideshowKingfisher

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let db = Firestore.firestore()
    let makeAlert = MakeAlert()

    var snapArray = [SnapModel]()
    var choosenSnap: SnapModel?
    var timeLeft: Int?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        getUserInfo()

    }
    override func viewWillAppear(_ animated: Bool) {
        getSnapsFromFirebase()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snapArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell

        cell.userNameLbl.text = snapArray[indexPath.row].username
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        cell.imageView?.sd_setImage(with: URL(string: snapArray[indexPath.row].imageUrlArray[0]))
        //cell.imageView?.kf.setImage(with: URL(string: snapArray[indexPath.row].imageUrlArray[0]))

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        choosenSnap = self.snapArray[indexPath.row]

        performSegue(withIdentifier: "toSnapVc", sender: nil)
    }

    func getUserInfo() {

        db.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { snapshot, error in

            if let error = error {
                let alert = self.makeAlert.makeAlert(titleInput: "Error", messageInput: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
            } else {

                if snapshot?.isEmpty == false && snapshot != nil {

                    for document in snapshot!.documents {

                        if let userName = document.get("username") as? String {

                            UserSingleton.sharedUserInfo.username = userName
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                        }

                    }

                }

            }
        }

    }
    func getSnapsFromFirebase() {

        db.collection("Snaps").getDocuments { snapshot, error in
            if let error = error {
                let alert = self.makeAlert.makeAlert(titleInput: "Error", messageInput: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
            } else {

                if let snapshot = snapshot {
                    self.snapArray.removeAll(keepingCapacity: false)
                    for document in snapshot.documents {
                        let imageUrlArray = document.get("imageUrlArray") as! [String]
                        let userName = document.get("snapOwner") as! String
                        let date = document.get("date") as! Timestamp

                        if let difference = Calendar.current.dateComponents([.hour], from: date.dateValue(), to: Date()).hour {
                            if difference >= 24 {
                                // remov snap
                                self.db.collection("Snaps").document(document.documentID).delete { error in
                                    if let error = error {
                                        let alert = self.makeAlert.makeAlert(titleInput: "Error", messageInput: error.localizedDescription)
                                        self.present(alert, animated: true, completion: nil)
                                    }
                                }
                            } else {
                                let snap = SnapModel(username: userName, imageUrlArray: imageUrlArray, date: date.dateValue(), timeLeft: 24 - difference)
                                self.snapArray.append(snap)
                            }
                        }
                    }
                    self.tableView.reloadData()
                }

            }

        }


    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSnapVc" {
            let destinationVC = segue.destination as! SnapViewController
            destinationVC.selectedSnap = choosenSnap
        }
    }

}
