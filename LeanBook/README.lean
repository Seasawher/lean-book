/- # Lean Book
Lean Book is the mdbook template configured for the Lean Project. Intended for use in writing textbooks and documentation in Lean.

Lean Book has a variety of features.
-/

/- ## Syntax Highlighting for Lean Code
Lean syntax highlighting works in this book. Here is an example of Lean code block.-/

variable {P Q : Prop}

example : P → (P ∨ Q) := by
  intro hP
  apply Or.inl
  exact hP

/- ## Run Lean4 Code Block
All Lean code blocks in this book have a button that jumps to the Lean Playground.

## Jump to Lean Playground from any page
Jump to the Lean4 Playground by clicking on the play button in the top right corner of a page.

## Table of Contents

Automatically add a table of contents to each page.

## Easy Code Management
The markdown files in this book are generated from Lean code using [mdgen](https://github.com/Seasawher/mdgen). There is no need to maintain separately the code examples and the text.

## Automatically update Lean version

The [lean-update](https://github.com/oliver-butterley/lean-update) action is configured in this repository, which periodically attempts to update the version of Lean and its libraries.

## Improved Search
The mdbook does not support searches in languages other than English, but this book does support searches in other languages (e.g. Japanese)!

## MathJax
You can use MathJax in this book. For example, $a^2 + b^2 = c^2$.

$$
ζ (s) = \sum_{n=1}^{\infty} \frac{1}{n^s}
$$

## Mdbook Admonish

```admonish info
mdbook-admonish is preinstalled!
```
-/
