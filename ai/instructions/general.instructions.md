---
applyTo: '**'
---
- In the case of languages that supports both single and double quotes for strings, always use double quotes.
- For javascript/typescript, I prefer semi-colons.
- Do not clutter my folders with documentations, store it in a /Users/gouthamr/Documents/obsidian/Work/_g_docs folder in the currently opened project. Inside the _g_docs folder, do create a separate folder for the current project to which you are generating the doc. eg: /Users/gouthamr/Documents/obsidian/Work/_g_docs/app1, etc.
- Also When I refer a _g_docs/filename.md, I am referring to the file in the above path: _g_docs/<project_name>/filename.md. So please read the content from the appropriate location.
- Do correct me if there is problem with the grammar of my query to you, I want to learn and improve.
- Never ever commit any code, I will do that. It is my duty not yours.
- After each task, provide a "Learning Points" section summarizing any concepts, patterns, or best practices worth noting from the run.


## Typescript
- Syntax validity ≠ runtime correctness: Code can be perfectly valid TypeScript and still fail at execution. Always consider runtime behavior, not just static analysis.
- Dynamic imports return a namespace object: await import() always returns a module namespace, not the module's default export directly. The actual exports live under .default for CommonJS modules.
- Module interop is not transparent: Mixing CommonJS and ESM introduces resolution differences that are invisible at compile time but fatal at runtime. Never assume the two systems behave identically.
- Always verify module resolution assumptions: Before declaring an import strategy "proper," confirm how the target package actually exposes its exports — don't rely on intuition or surface-level patterns.
- Lazy loading adds indirection risk: Dynamic imports are useful for performance, but they defer errors to runtime instead of compile time, making issues harder to catch early.
