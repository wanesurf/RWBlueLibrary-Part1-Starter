//
//  LibrairyAPI.swift
//  RWBlueLibrary
//
//  Created by Helwan Mandé on 2020-08-10.
//
//
//This class is the Facade
import Foundation

final class LibrairyAPI {
  
  static let shared = LibrairyAPI()
  
  private let persistencyManager = PersistencyManager()
  private let httpClient = HTTPClient()
  //The HTTP client doesn’t actually work with a real server and is only here to demonstrate the usage of the facade pattern, so isOnline will always be false.
  
//TODO - Can make the code cleaner using the Command Pattern
  
  func getAlbums() -> [Album] {
    return persistencyManager.getAlbums()
  }
  
  func addAlbum(_ album: Album, at index: Int) {
    persistencyManager.addAlbum(album, at: index)
    if isOnline {
      httpClient.postRequest("/api/addAlbum", body: album.description)
    }
  }
  
  func deleteAlbum(at index: Int) {
    persistencyManager.deleteAlbum(at: index)
    if isOnline {
      httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
    }
  }

  private let isOnline = false
  
  private init() {}
  
  
}

