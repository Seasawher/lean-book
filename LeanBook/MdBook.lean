open IO System

def mdbookPath : FilePath := ⟨".cargo/mdbook/bin/mdbook"⟩

def main (args : List String) : IO Unit := do
  let out ← IO.Process.output {
    cmd := mdbookPath.toString
    args := args.toArray
  }
  if out.exitCode != 0 then
    IO.eprintln out.stderr
    throw <| IO.userError s!"Failed to execute: mdbook {args}"
  else if !out.stdout.isEmpty then
    IO.println out.stdout.trimAsciiEnd
