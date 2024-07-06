//
//  ViewController.swift
//  Pokemon
//
//  Created by Melik Demiray on 4.04.2024.
//

import UIKit

class ViewController: UIViewController {

    var pokemons = [Pokemon]()

    let pokemonService = PokemonsServices.shared

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        getPokemons()
        print(pokemons)
    }
    private func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        pokemonService.fetchPokemons(url: url) { [weak self] result in
            guard let self = self else { return }
            print(result)
            switch result {
            case .success(let pokemons):
                //self?.pokemons = pokemons
                self.pokemons.append(contentsOf: pokemons)
                print(pokemons)

            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "deneme"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

