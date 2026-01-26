# 1️⃣ Basics

Variables: var, let, const ✅

Data types: Number, String, Boolean, Null, Undefined, Object, Array ✅

Operators: arithmetic, comparison, logical, ternary ✅

Type conversion: Number(), String(), Boolean() ✅

## 1️⃣ Variables: var, let, const ✅
Explanation

var → old way of declaring variables, function-scoped, can be re-declared and updated.

let → block-scoped, can be updated but cannot be re-declared in the same scope.

const → block-scoped, cannot be updated or re-declared. Value must be assigned immediately.

Example
'''var name = "Alice";  // old way
name = "Bob";         // updated
var name = "Carol";   // re-declared → works

let age = 25;        // new way
age = 26;             // updated → works
// let age = 30;      // Error! cannot re-declare

const pi = 3.14;      // constant
// pi = 3.1415;       // Error! cannot update
'''

---------------------------------------------------------------------------------------------------------

## JavaScript Debugging Cheat Sheet
### 1️⃣ console.log()

Prints anything to the console.

Used for general debugging / checking values.
'''
let name = "Alice";
console.log(name);                // Alice
console.log("Score:", 50);        // Score: 50
console.log("Sum:", 5 + 3);       // Sum: 8
'''
### 2️⃣ console.error()

Prints errors in red in the console.
Used to highlight problems or exceptions.
'''
console.error("Something went wrong!"); 
// Red text in console
'''
### 3️⃣ console.warn()

Prints warnings in yellow/orange.
Useful to alert about potential issues.
'''
console.warn("This is a warning!");
'''
### 4️⃣ console.table()

Prints arrays or objects in a table format.
Very useful for visualizing structured data.
'''
let users = [
    {name: "Alice", age: 25},
    {name: "Bob", age: 30}
];

console.table(users);
// Shows table with columns: name | age
'''
------------------------------------------------------------------------------------

## 2️⃣ Data Types ✅
Explanation

Primitive types: Number, String, Boolean, Null, Undefined

Non-primitive: Object, Array

Example
'''
let num = 10;             // Number
let name = "Alice";       // String
let isActive = true;      // Boolean
let empty = null;         // Null
let notDefined;           // Undefined
let person = {name: "Bob", age: 25};  // Object
let numbers = [1, 2, 3, 4];           // Array
'''
## 3️⃣ Operators ✅
Explanation

Arithmetic: + - * / %

Comparison: ==, ===, !=, !==, >, <

Logical: &&, ||, !

Ternary: condition ? value_if_true : value_if_false

Example
'''
// Arithmetic
let sum = 5 + 3;    // 8
let rem = 10 % 3;   // 1

// Comparison
console.log(5 == "5");  // true (value only)
console.log(5 === "5"); // false (value + type)
console.log(5 != "5");  // false → because 5 and "5" are equal in value
console.log(5 != 10);   // true → values are different
console.log(5 !== "5");  // true → value same, type different
console.log(5 !== 5);    // false → value and type same
console.log(5 !== 10);   // true → values different

// Logical
let a = true, b = false;
console.log(a && b);  // false
console.log(a || b);  // true
console.log(!a);      // false

// Ternary
let age = 20;
let canVote = (age >= 18) ? "Yes" : "No";
console.log(canVote); // Yes
'''

## 4️⃣ Type Conversion ✅
Explanation

Convert strings → numbers → Number()

Convert numbers → strings → String()

Convert truthy/falsy → Boolean → Boolean()

Example
'''
let str = "123";
let num = Number(str);   // 123 (string → number)

let val = 456;
let strVal = String(val); // "456" (number → string)

console.log(Boolean(0));   // false
console.log(Boolean(1));   // true
console.log(Boolean(""));  // false
console.log(Boolean("Hello")); // true
'''
-----------------------------------------------------------------------------------------

# 2️⃣ Functions

Function declaration & expression ✅

Arrow functions ()=> ✅

Parameters & return values ✅

Scope: local vs global ✅

## 1️⃣ Function Declaration
Explanation
Standard way to create a function.
Can be called before or after the function declaration (hoisting).

Syntax
'''
function functionName(parameters) {
    // code
    return value; // optional
}
'''
Example
'''
function add(a, b) {
    return a + b;
}

console.log(add(5, 3)); // 8
'''
💡 Tip: return sends a value back. Without return, function gives undefined.

## 2️⃣ Function Expression
Explanation
Function is stored in a variable.
Cannot be called before definition (no hoisting).
Syntax
'''
const add = function(a, b) {
    return a + b;
};
console.log(add(10, 5)); // 15
'''

## 3️⃣ Arrow Functions ()=>
Explanation
Shorter syntax introduced in ES6.
Automatically returns value if single expression.

Syntax
'''
const add = (a, b) => a + b;  // single-line return
console.log(add(2, 3)); // 5
Multi-line arrow function
const multiply = (a, b) => {
    let result = a * b;
    return result;
};
console.log(multiply(4, 5)); // 20
'''
💡 Tip: Arrow functions do not have their own this, mainly used in small functions or callbacks.

## 4️⃣ Parameters & Return Values
Explanation
Parameters: inputs to the function.
Return value: output from the function.
Example
'''
function greet(name) {
    return "Hello " + name;
}
console.log(greet("Alice")); // Hello Alice
'''
<-------------------------------------------------------------------------------------------------------------------------->

# 3️⃣ DOM Manipulation (HIGH PRIORITY)

document.getElementById() ✅
document.querySelector() & querySelectorAll() ✅
.innerText, .textContent, .value ✅
.style to change CSS ✅
.classList.add() / remove() / toggle() ✅
.addEventListener("event", callback) ✅

## 1️⃣ document.getElementById()
Explanation
Selects an element by its ID.
Returns a single element.

Example
'''
<p id="demo">Hello</p>
<script>
let p = document.getElementById("demo");
console.log(p.innerText); // Hello
p.innerText = "Hi there!"; // changes text in page
</script>
'''

## 2️⃣ document.querySelector() & querySelectorAll()
Explanation
querySelector() → selects first element matching a CSS selector.
querySelectorAll() → selects all elements matching a selector (returns NodeList).

Example
'''
<p class="text">First</p>
<p class="text">Second</p>
<script>
let first = document.querySelector(".text");
console.log(first.innerText); // First

let all = document.querySelectorAll(".text");
all.forEach(p => console.log(p.innerText)); // First, Second
</script>
'''

## 3️⃣ .innerText, .textContent, .value
Explanation
.innerText → gets visible text, respects styling.
.textContent → gets all text inside element.
.value → gets value of input fields.

Example
'''
<input type="text" id="name" value="Alice">
<p id="para">Hello</p>

<script>
console.log(document.getElementById("para").innerText); // Hello
console.log(document.getElementById("name").value);     // Alice
</script>
'''

## 4️⃣ .style to change CSS
Explanation
Modify inline CSS styles using JS.
Example
'''
<p id="para">Hello</p>
<script>
let p = document.getElementById("para");
p.style.color = "red";
p.style.fontSize = "20px";
</script>
'''

## 5️⃣ .classList.add() / remove() / toggle()
Explanation
Add or remove CSS classes dynamically.
Example
'''
<p id="para">Hello</p>
<style>
.red { color: red; }
</style>

<script>
let p = document.getElementById("para");
p.classList.add("red");   // adds red color
p.classList.remove("red"); // removes red color
p.classList.toggle("red"); // adds if not present, removes if present
</script>
'''

## 6️⃣ .addEventListener("event", callback)
Explanation
Used to react to user actions (click, input, mouseover, etc).
Example
'''
<button id="btn">Click me</button>
<p id="demo">0</p>

<script>
let btn = document.getElementById("btn");
let p = document.getElementById("demo");

btn.addEventListener("click", function() {
    p.innerText = parseInt(p.innerText) + 1;
});
</script>
'''