
# Minishell

Minishell is a mini version of a Unix shell, created as a school project with Bash as the reference shell. The goal of this project is to implement essential features of a shell environment from scratch, deepening our understanding of process creation, signal handling, and command execution.

This project was a collaborative effort, with each contributor responsible for different aspects of the shell.

### Parts Handled by me:

- Parsing and Tokenization (Fully Implemented): Efficiently parses and tokenizes user input for command processing.
- Command Execution (Fully Implemented): Executes system commands, handling both relative and absolute paths.
- Pipes (Fully Implemented): Implements piping (|), enabling the chaining of commands.
- Redirection (Fully Implemented): Handles input (<), output (>), and append (>>) redirection.
- Environment Variables (Fully Implemented): Manages environment variables like $HOME and $USER.
- Heredoc (Collaboration): Includes partial functionality for heredoc (<<).
- Signal Handling (Collaboration): Basic signal handling (e.g., Ctrl+C and Ctrl+\).
- Error Handling (Partially Implemented): Provides error management for invalid commands and syntax, with some areas still under development.
- Built-ins (Improved): Fixed edge cases for built-in commands (echo, cd, pwd, export, unset, env, exit).

### Parts Handled by partner:
- Initial Pipex Implementation: Provided the foundational code for pipe handling.
- Prompt (Fully Implemented): Displays a customizable shell prompt.
- Built-in Commands: echo, cd, pwd, export, unset, env, exit
- Signals: Implements signal handling (e.g., Ctrl+C, Ctrl+\) to manage shell behavior.
- Error Handling: Provides appropriate error messages for invalid commands or incorrect usage.


## Compilation
1. Clone the repository:
```
git clone git@github.com:k2matu/minishell.git
````
2. Navigate into the directory:
```
cd minishell
```
3. Compile the library using make:
```
make
```
4. Run the shell:
```
./minishell
```

## Usage
Once the shell is running, you can execute commands similarly to Bash!
