import Lake
open Lake DSL

package «Lean Book» where
  -- add package configuration options here
  leanOptions := #[
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩
  ]

@[default_target]
lean_lib «LeanBook» where
  globs := #[.submodules `LeanBook] -- Build all files in the `LeanBook` directory.

require mdgen from git
  "https://github.com/Seasawher/mdgen" @ "main"

abbrev Environment := Array (String × Option String)

def runCmd (input : String) (env : Environment := #[]) : IO Unit := do
  let cmdList := input.splitOn " "
  let cmd := cmdList.head!
  let args := cmdList.tail |>.toArray
  let out ← IO.Process.output {
    cmd := cmd
    args := args
    env := env
  }
  if out.exitCode != 0 then
    IO.eprintln out.stderr
    throw <| IO.userError s!"Failed to execute: {input}"
  else if !out.stdout.isEmpty then
    IO.println out.stdout.trimAscii.copy

script build_html do
  runCmd "lake exe mdgen LeanBook booksrc --count --exercise"
  runCmd "mdbook build"
  return 0

script build_pdf do
  runCmd "lake exe mdgen LeanBook booksrc --count --exercise"
  let outputConfig ← IO.FS.readFile "typst/pdf-output.json"
  runCmd s!"mdbook build" #[("MDBOOK_OUTPUT", some outputConfig)]
  return 0
