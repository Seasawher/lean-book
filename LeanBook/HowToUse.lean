/- # How to Use

0. Install mdbook and Lean.

1. Clone this repository. **Do not fork** to use this repository. Fork only when you want to submit a PR. Don't select "Use this template" on GitHub UI if you want your repository to be indexed by Reservoir.

2. Change the package name `«Lean Book»` as you like. And run `lake update`.

3. Change the `site_url` in `book.toml` to your GitHub page's URL.

4. Edit `.lycheeignore` file. This controls which URL is ignored by the link checker.

5. After updating the Lean file, run `lake run build`. This will generate markdown with mdgen, HTML with mdbook and import statements with import-check.

6. Run `mdbook serve --open` to see the preview.

7. Push to GitHub. The workflow for deploy has already been set up, so you can publish it as a web page by enabling deploy to GitHub Pages via GitHub Action from the repository settings.
-/
