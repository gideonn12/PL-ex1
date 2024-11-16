# PL-ex1

## Question 2: Binary Tree
```comparator_tree``` function that takes a binary search tree, a value to insert, and a comparison function, and then returns a new BST with the inserted value.

### To Test run the following:
- Define a string comparator function:
```let str_comp s1 s2 = String.compare s1 s2;;```
This function compares two strings lexicographically.

- Insert values into the tree using the comparator_tree function:
```
let tree = comparator_tree Empty "zvi" str_comp;;
let tree = comparator_tree tree "yoni" str_comp;;
let tree = comparator_tree tree "student" str_comp;;
let tree = comparator_tree tree "ocaml" str_comp;;
```
The tree is built step-by-step by inserting values using the comparator function str_comp.

- Insert the string "ocaml" into the binary search tree, using the previously constructed tree and the str_comp comparator function.
  ```let tree = comparator_tree tree "ocaml" str_comp;;```
![image](https://github.com/user-attachments/assets/147130f0-b719-4ce6-a7f8-c5c0dda1b4ba)

