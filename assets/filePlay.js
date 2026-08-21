/**
 * Modifying the "Suggest an edit" button in mdbook
 * to link to the lean4 web editor
 */
function filePlay() {
  const editButtonIcon = document.querySelector("#git-edit-button");
  const playIconTemplate = document.querySelector("#fa-play");
  if (!editButtonIcon || !playIconTemplate) return;

  const playButtonLink = editButtonIcon.closest("a");
  if (!playButtonLink) return;

  editButtonIcon.replaceWith(playIconTemplate.content.cloneNode(true));
  playButtonLink.title = "Run on Lean 4 playground";
  playButtonLink.ariaLabel = playButtonLink.title;
  playButtonLink.target = "_blank";
  playButtonLink.rel = "noopener";

  playButtonLink.href = playButtonLink.href.replace(/\.md$/, ".lean");
  playButtonLink.href = playButtonLink.href.replace(
    "/booksrc/",
    "/LeanBook/",
  );
  console.info(`Referenced file: ${playButtonLink.href}`);

  fetch(playButtonLink.href)
    .then((response) => response.text())
    .then((body) => {
      const escaped_code = encodeURIComponent(body);
      const url = `https://live.lean-lang.org/#code=${escaped_code}`;
      playButtonLink.href = url;
    });
}

filePlay();
