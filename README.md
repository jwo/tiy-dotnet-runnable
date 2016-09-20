* Latest version: jwolgamott/tiy-dotnet-runnable:0.4-beta
* Command to run the dotnet

```
docker run jwolgamott/tiy-dotnet-runnable:0.4-beta /app/build.sh
```

Options to run:

1. Either put a single C# file in `/tmp/code`
2. Put a set of C# files in `/tmp`, with one of them `Program.cs`

The `build.sh` handles moving the files into the dotnet project directory, and sed's the output to remove the compilation output, leaving only the `System.Console.WriteLine` and any compilation error messages.

TODO:

1. Ability to specify changes to the project.json to install dependencies (currently it's in the docker image itself)
