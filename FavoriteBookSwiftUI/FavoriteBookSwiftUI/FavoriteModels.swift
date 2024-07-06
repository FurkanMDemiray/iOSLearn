//
//  FavoriteModels.swift
//  FavoriteBookSwiftUI
//
//  Created by Melik Demiray on 8.12.2023.
//

import Foundation



struct FavoriteModel: Identifiable {
    var id = UUID()
    var title: String
    var elements: [FavoriteElements]
}

struct FavoriteElements: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
}


let metallica = FavoriteElements(name: "Metallica", imageName: "metallica", description: "Metallica is an American heavy metal band. The band was formed in 1981 in Los Angeles by vocalist/guitarist James Hetfield and drummer Lars Ulrich, and has been based in San Francisco for most of its career.")

let megaDeth = FavoriteElements(name: "Megadeth", imageName: "megadeth", description: "Megadeth is an American heavy metal band formed in 1983 by guitarist Dave Mustaine and bassist David Ellefson in Los Angeles, California. Along with Metallica, Anthrax, and Slayer, Megadeth is one of the big four of American thrash metal, responsible for its development and popularization.")

let ironMaiden = FavoriteElements(name: "Iron Maiden", imageName: "ironmaiden", description: "Iron Maiden are an English heavy metal band formed in Leyton, East London, in 1975 by bassist and primary songwriter Steve Harris. The band's discography has grown to 40 albums, including 16 studio albums, 13 live albums, four EPs, and seven compilations.")

let bands = FavoriteModel(title: "Heavy Metal", elements: [metallica, megaDeth, ironMaiden])

// movies

let pulpFiction = FavoriteElements(name: "Pulp Fiction", imageName: "pulpfiction", description: "Pulp Fiction is a 1994 American neo-noir black comedy crime film written and directed by Quentin Tarantino, who conceived it with Roger Avary. Starring John Travolta, Samuel L. Jackson, Bruce Willis, Tim Roth, Ving Rhames, and Uma Thurman, it tells several stories of criminal Los Angeles.")

let fightClub = FavoriteElements(name: "Fight Club", imageName: "fightclub", description: "Fight Club is a 1999 American film directed by David Fincher and starring Brad Pitt, Edward Norton, and Helena Bonham Carter. It is based on the 1996 novel of the same name by Chuck Palahniuk. Norton plays the unnamed narrator, who is discontented with his white-collar job.")

let theGodfather = FavoriteElements(name: "The Godfather", imageName: "thegodfather", description: "The Godfather is a 1972 American crime film directed by Francis Ford Coppola, who co-wrote the screenplay with Mario Puzo, based on Puzo's best-selling 1969 novel of the same name. The film stars Marlon Brando, Al Pacino, James Caan, Richard Castellano, Robert Duvall, Sterling Hayden, John Marley, Richard Conte, and Diane Keaton.")

let movies = FavoriteModel(title: "Movies", elements: [pulpFiction, fightClub, theGodfather])

let favoriteModels = [bands, movies]
