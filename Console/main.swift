//
//  main.swift
//  Console
//
//  Created by Metehan Günday on 3.09.2023.
//

import Foundation
let teknoloji = ["saat", "telefon", "mönitor", "priz", "bilgisayar", "klavye", "maus", "ampul", "tripod"]
let esya = ["masa", "koltuk", "sandalye", "çekmece", "gözlük", "perde", "cam", "çanta", "kalorifer"]
var gamePoint = 5


func getCorrectLetters(prediction:String, goalWord:String) -> [Character] {
    var correctLetters: [Character] = []
    let predictedCharacters = Set(prediction)
    let goalWordCharacters = Set(goalWord)
    
    // ["a", "b", "c", "d", "e"]
    for letter in predictedCharacters {
        if goalWordCharacters.contains(letter) {
            correctLetters.append(letter)
        }
    }
    
    return correctLetters
}

func getCategoryAndPickRdandomWord() -> String {
    print("Lütfen Kategori seçiniz")
    let category = readLine()?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    if category == "teknoloji"{
        return teknoloji.randomElement() ?? "yazıcı"
    }else if category == "eşya"{
        return esya.randomElement() ?? "çerçeve"
    }
    else{
        return getCategoryAndPickRdandomWord()
    }
}


while  gamePoint>0 && gamePoint<30{
    let goalWord = getCategoryAndPickRdandomWord()
    var goalFound = false
    while !goalFound{
        print("Bir tahminde bulunuz")
        let prediction = readLine()
        if prediction == goalWord{
            print("Doğru bildiniz")
            gamePoint += 5
            goalFound = true
            print(gamePoint)
            
        } else{
            print("Yanlış bildiniz")
            gamePoint -= 1
            guard let prediction = prediction else { continue }
            print(getCorrectLetters(prediction: prediction, goalWord: goalWord))
            print(gamePoint)
        }
    }
}


