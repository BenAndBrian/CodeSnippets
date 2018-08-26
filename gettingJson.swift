class gettingJson {

  func getJsonOfOneListing(){

          let urlString = URL_GET_LISTINGS + "test"
          guard let url = URL(string: urlString) else { return }

          URLSession.shared.dataTask(with: url) { (data, response, error) in
              if error != nil {
                  print(error!.localizedDescription)
              }

              guard let data = data else { return }
              //Implement JSON decoding and parsing
              do {
                  //Decode retrived data with JSONDecoder and assing type of Article object
                  let listingData = try JSONDecoder().decode([Listing].self, from: data)

                  //Get back to the main queue
                  DispatchQueue.main.async {
                      //print(articlesData)
                      self.listing = listingData
                  }

                  } catch let jsonError {
                      print(jsonError)
                  }
              }.resume()
          print(self.listing?.count)
      }

}
