# Flutter notes

Notes for flutter udemy course.

## const vs final

### const

`const` is to mark a variable a compile-time constant variable.

Constant variable, in Dart every variable is a pointer to the memory where the value is saved. So in this case the pointer is constant (cannot do a new assignemt to the variable).

```dart
const variableA = 'AAA'
```

In this case the value is constant, but new assignment are allowed. 

```dart
var variableA = const 'AAA'

// The address to which the variable points it's changed
variableA = 'B'
```

### final

`final` is to mark a variable a runtime constant variable.