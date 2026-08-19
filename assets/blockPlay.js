Array.from(document.querySelectorAll(".language-lean")).forEach(function (codeBlock) {
  const preBlock = codeBlock.closest("pre");
  if (!preBlock) return;

  // create a link to lean4 web editor
  const escapedCode = encodeURIComponent(codeBlock.textContent);
  const url = `https://live.lean-lang.org/#code=${escapedCode}`;

  // create a button
  let buttons = preBlock.querySelector(".buttons");
  if (!buttons) {
    buttons = document.createElement("div");
    buttons.className = "buttons";
    preBlock.insertBefore(buttons, preBlock.firstChild);
  }

  const leanWebButton = document.createElement("button");
  leanWebButton.className = "lean-web-button";
  leanWebButton.title = "Run on Lean 4 playground";
  leanWebButton.setAttribute('aria-label', leanWebButton.title);
  leanWebButton.innerHTML = document.getElementById("fa-external-link").innerHTML;

  // insert the button
  buttons.insertBefore(leanWebButton, buttons.firstChild);

  // open the link when the button is clicked
  leanWebButton.addEventListener("click", function () {
    window.open(url, "_blank", "noopener");
  });
});
