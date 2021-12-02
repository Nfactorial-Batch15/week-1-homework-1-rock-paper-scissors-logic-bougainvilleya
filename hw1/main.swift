//
//  main.swift
//  hw1
//
//  Created by Leyla Nyssanbayeva on 02.12.2021.
//

import Foundation

enum Gestures{
    case rock
    case paper
    case scissors
}

func Play(person: Gestures, bot: Gestures){
    var result = ""
    print("Your choise: ", person)
    print("Bot's choise: ", bot)
    switch person{
    case Gestures.rock:
        if bot == Gestures.rock{
            result = "Friendship won!"
        }
        else if bot == Gestures.paper{
            result = "You lose:("
        }
        else{
            result = "You won!"
        }
    case Gestures.paper:
        if bot == Gestures.rock{
            result = "You won!"
        }
        else if bot == Gestures.paper{
            result = "Friendship won!"
        }
        else{
            result = "You lose:("
        }
    case Gestures.scissors:
        if bot == Gestures.rock{
            result = "You lose:("
        }
        else if bot == Gestures.paper{
            result = "You won!"
        }
        else{
            result = "Friendship won!"
        }
    }
    print(result)
}

func GenerateGesture() -> Gestures{
    let randomInt = Int.random(in: 1...3)
    var result = Gestures.rock
    
    switch randomInt{
    case 1:
        result = Gestures.rock
    case 2:
        result = Gestures.paper
    case 3:
        result = Gestures.scissors
    default:
        print("Error in func GenerateGesture().")
    }
    return result
}

func ConvertToGesture(choice: String) -> Gestures?{
    var choosedGesture: Gestures?
    
    switch choice{
    case "1":
        choosedGesture = Gestures.rock
    case "2":
        choosedGesture = Gestures.paper
    case "3":
        choosedGesture = Gestures.scissors
    default:
        print("Wrong choice!")
    }
    return choosedGesture
}

var flag = "yes"
while(flag.lowercased() == "yes"){
    print("Choose a gesture: 1 - rock, 2 - paper, 3 - scissors")
    let choice: String? = readLine()

    if let unwrappedChoice = choice{
        let choosedGesture = ConvertToGesture(choice: unwrappedChoice)
    
        if let unwrappedChoosedGesture = choosedGesture{
            Play(person: unwrappedChoosedGesture, bot: GenerateGesture())
        }
    }
    print("Do you want to try again? yes/no")
    if let unwrappedChoice = readLine(){
        flag = unwrappedChoice
    }
}
print("Goodbye!")
