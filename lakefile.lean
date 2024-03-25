import Lake
open Lake DSL

package «Src» where
  -- add package configuration options here
  leanOptions := #[
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩
  ]

@[default_target]
lean_lib «Src» where
  -- add library configuration options here

require «import-all» from git
  "https://github.com/Seasawher/import-all" @ "main"

require mdgen from git
  "https://github.com/Seasawher/mdgen" @ "main"

def runCmd (cmd : String) (args : Array String) : ScriptM Bool := do
  let out ← IO.Process.output {
    cmd := cmd
    args := args
  }
  let hasError := out.exitCode != 0
  if hasError then
    IO.eprint out.stderr
  return hasError

script build do
  if ← runCmd "lake" #["exe", "mdgen", "Src", "md"] then return 1
  if ← runCmd "lake" #["exe", "import_all", "Src"] then return 1
  if ← runCmd "mdbook" #["build"] then return 1
  return 0

script check do
  if ← runCmd "lake" #["exe", "import_check", "Src"] then return 1
  return 0
