# Skill — git-foundations

## Use when
- configuring Git on Windows;
- cloning repositories;
- creating/switching branches;
- staging;
- committing;
- pushing;
- fetching/pulling;
- understanding repository state;
- recovering from common Git mistakes.

## Goal
Teach Git as a state machine, not as a list of commands.

## Core Model

```text
WORKING TREE
↓ git add
STAGING AREA
↓ git commit
LOCAL REPOSITORY
↓ git push
REMOTE REPOSITORY
```

## Mandatory Teaching Sequence
1. Explain ELI5.
2. Show technical meaning.
3. Inspect current state.
4. Execute smallest safe command.
5. Validate result.
6. Explain rollback/recovery.
7. Connect to PR workflow when relevant.

## Safe Inspection First

```powershell
git status
git branch
git remote -v
git log --oneline --decorate --graph -20
```

## Rules
- Never recommend destructive commands without explaining consequences.
- Never use real tokens or secrets.
- Prefer `git switch` for branch workflows when supported.
- Explain difference between `fetch`, `pull`, `merge`, `rebase`, and `push`.
- Before `git add .`, instruct user to inspect `git status`.
- Before changing history, inspect current branch and log.

## Outputs
- explanation;
- commands;
- expected output;
- validation;
- risks;
- recovery;
- short exercise.

## Completion Criteria
The learner can explain where a change currently exists:
working tree, staging, local commit, or remote.
