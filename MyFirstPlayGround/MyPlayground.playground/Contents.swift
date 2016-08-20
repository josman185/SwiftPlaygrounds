//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var hello = "hello world"
//----------------class without initializers -----------
class Shape {
    var numberOfSides = 0
    
    func simpleDesc() ->String{
        return "A shape With \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 1
var shapDescrip = shape.simpleDesc()
print (shapDescrip)
//----------------parent class or super class---------------------------------
class NamedShape {
    var numberOfSides = 0 //this is a property
    var name: String
    
    init(name: String){
        self.name = name
    }
    func simpleDescription() -> String{
        return "A shape called \(name) with \(numberOfSides) sides."
    }
}
var obj = NamedShape(name: "another_name")
obj.numberOfSides = 3
var desc = obj.simpleDescription()
// --------- Using Subclasses---------
class Square : NamedShape{
    var sideLength : Double
    
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A Shape:\(name) with: \(numberOfSides) sides and \(sideLength) length side."
    }
}
var squareObj = Square(sideLength: 2.2, name: "cuadrado")
squareObj.simpleDescription() + "and area of: \(squareObj.area())"
//-------------- making Initializer Failable -------------
class Circle: NamedShape{
    var radius : Double
    
    init? (radius: Double, name: String){
        self.radius = radius
        super.init(name: name)
        if radius <= 0{
            return nil
        }
    }
    override func simpleDescription() -> String {
        return "\(name) with a radius of: \(radius)"
    }
}
let succesfulCircle = Circle(radius: 2.3, name: "MyCircle")
let failedCircle = Circle(radius: -6, name: "Failed Circle")
succesfulCircle?.simpleDescription()
//-----------managing the optiional cast operator----------
class Triangle: NamedShape{
    init(name: String, sideLength: Double) {
        super.init(name: name)
        numberOfSides = 3
    }
}

let shapesArray = [Triangle(name: "triangle1", sideLength: 1.1), Triangle(name: "triangle2", sideLength: 2.2), Square(sideLength: 2.2, name: "Square1"), Square(sideLength: 3.2, name: "Square2")]

var squares = 0
var triangles = 0

for shapes in shapesArray {
    if let square = shapes as? Square {
        squares++
    }
    else if let triangle = shapes as? Triangle{
        triangles++
    }
}
print("Total Squares: \(squares) and Triangles: \(triangles)")

//-------------ENUMERATIONS AND STRUCTURES-------------

enum Rank:Int {
    case Ace = 1
    case Two, Three, Four, Five, six
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self{
        case .Ace:
            return "ACE"
        case .Jack:
            return "JACK"
        case .Queen:
            return "QUENN"
        case .Five:
            return "KING"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Queen
let aceRawValue = ace.rawValue
// If we wanna return the Description
if let convertedRank = Rank(rawValue: 5){
    let threeDescription = convertedRank.simpleDescription()
}
//---in cases where there isn’t a meaningful raw value, you don’t have to provide one.
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() ->String {
        switch self{
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
// and we access to the content in this way
let hearts = Suit.Hearts
let heratDescription = hearts.simpleDescription()

// ------------creating a STRUCTURE... -------------------
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//----------------PROTOCOLS--------------------
protocol ExampleProtocol {
    var simpleDescription: String { get }
    func adjust()
}
// Adopting and conforming the protocol
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

class SimpleClass2: ExampleProtocol {
    var simpleDescription = "Another simple class."
    func adjust() {
        simpleDescription += " Adjusted."
    }
}

