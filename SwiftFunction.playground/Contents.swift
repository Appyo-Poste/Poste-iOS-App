import UIKit

// function parameters must be explisitly refrenced in each call?
sayHello(m: "I can code ")

// functions need to be explicitly declared with "func" that rest is normal
func sayHello(m:String) {
    print(m)
}

sayHello(m: "functions!")

//Parameters can be labeled, so you can have diffrent variable names inside and outside
func doAdd(x a:Int, y b:Int) {
    var sum = a + b
    print(sum)
}

doAdd(x: 3, y: 2)

// return syntax is very different
func doAdd2 (a:Int, b:Int)->Int {
    var sum = a + b
    return sum
}

print(doAdd2(a: 4, b: 4))

let result = doAdd2(a: 5, b: 5)
print(result)

//parameter names can be removed from call bu adding "_" as a label
func doAdd3(_ a:Int, _ b:Int) {
    var sum = a + b
    print(sum)
}

doAdd3(1, 2)

