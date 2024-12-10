/- # How to Use

## Basic Setup

Install git, Lean and mdbook. The installation of git and Lean is not described here.

I recommend using mdbook version `0.4.35`. Otherwise, the table of contents layout may be broken.

```bash
# install mdbook
cargo install mdbook --version 0.4.35
```

## clone this repository

Clone this repository and remove it from `origin`. To do so, run the following command in your terminal.

```bash
mkdir your-book-dir
cd your-book-dir
git clone https://github.com/Seasawher/lean-book.git .
git remote rename origin upstream
```

**Do not fork** to use this repository. Fork only when you want to submit a PR.

Don't select "Use this template" on GitHub UI if you want your repository to be indexed by Reservoir.

## Customize as you need

Please modify the following items to suit your project:

* Change the package name `«Lean Book»` as you like. And run `lake update`.
* The libname `LeanBook` and the directory name `LeanBook` should not be changed. If you change it, do not forget to change `assets/filePlay.js` as well.
* Edit `book.toml` as you need. There are many things to edit, but the following are especially important.
  * Change the `site_url` in `book.toml` to your GitHub page's URL. This is required to display 404 page correctly.
  * Change the `edit-url-template` in `book.toml` to reflect the URL of your GitHub repository. This is required to use the "jump to Lean 4 Web" feature.
* Edit `.lycheeignore` file. This controls which URL is ignored by the link checker in CI.

## How to write

Writing a book can be done in the same way as writing in mdbook.

1. After updating the Lean file, don't forget to run `lake run build`. This will generate markdown files with `mdgen`, HTML files with mdbook.
1. Run `mdbook serve --open` to see the preview.

## Publish

Push to GitHub. The workflow for deploy has already been set up, so you can publish it as a web page by enabling deploy to GitHub Pages via GitHub Action from the repository settings.
-/
