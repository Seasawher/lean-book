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

/-- Execute the given string in a shell -/
def runCmd (input : String) : IO Unit := do
  let cmdList := input.splitOn " "
  let cmd := cmdList.head!
  let args := cmdList.tail |>.toArray
  let out ← IO.Process.output {
    cmd := cmd
    args := args
  }
  if out.exitCode != 0 then
    IO.eprintln out.stderr
    throw <| IO.userError s!"Failed to execute: {input}"
  else if !out.stdout.isEmpty then
    IO.println out.stdout

script build do
  runCmd "lake exe mdgen LeanBook booksrc --count"
  runCmd "mdbook build"
  return 0
