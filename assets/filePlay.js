/**
 * Modifying the "Suggest an edit" button in mdbook
 * to link to the lean4 web editor
 */
function filePlay() {
  const playButtonIcon = document.querySelector("#lean-play-button");
  const playButtonLink = playButtonIcon.parentElement;
  playButtonLink.href = playButtonLink.href.replace(/\.md$/, ".lean");
  playButtonLink.href = playButtonLink.href.replace(
    "/md/",
    "/Src/",
  );
  fetch(playButtonLink.href)
    .then((response) => response.text())
    .then((body) => {
      const escaped_code = encodeURIComponent(body);
      const url = `https://live.lean-lang.org/#code=${escaped_code}`;
      playButtonLink.href = url;
    });
}

filePlay();