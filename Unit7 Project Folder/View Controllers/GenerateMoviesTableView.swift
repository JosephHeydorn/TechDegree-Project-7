//
//  GenerateMoviesTableView.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/7/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

class GenerateMoviesTableView: UITableViewController {
    
    private var movies: [MovieData]?
    private var selectedMovie: MovieData?
    
    let mainVC = ViewController()
    var arrayOfMovies: [String] = []

    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadMovieNames()

    }

    // MARK: - Data Downloading
    private func downloadMovieNames() {
        MovieAPI.downloadMovies { [weak self] result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presentAlert(with: "Error", message: error.localizedDescription)
                }
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.fillArray()
                }
            }
            
        }
    }
    
    // MARK: - Fill Array full of movies
    func fillArray() {
        guard let fillMovies = movies else { return }
        for listOfTitles in fillMovies {
            print(listOfTitles.title)
            arrayOfMovies.append(listOfTitles.title)
            self.tableView.reloadData()
            print(arrayOfMovies)
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTitles", for: indexPath)
        
        cell.textLabel!.text = arrayOfMovies[indexPath.row]

        return cell
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
