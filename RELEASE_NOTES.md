## 🚀 Release Notes

---

### 🎉 New GitHub Action

In this release, we've introduced a new GitHub action to streamline the syntax check for YAML files and GitHub Actions workflows. Here are the details:

#### **[Check Syntax Action]**

- **Description**: Lint and check YAML files and GitHub Actions syntax.
- **Inputs**:
  - `[ACTIONLINT_VERSION]`: Version of actionlint to use (Optional/Required).
  - `[YAMLLINT_VERSION]`: Version of yamllint to use (Optional/Required).
  
- **Main Features**:
  - Cache pip data and actionlint.
  - Install yamllint and actionlint.
  - Check for yamllint config and check YAML Syntax for All Files.
  - Check GitHub Actions Workflow Syntax.

---

### 🔧 Instructions

To utilize this action in your workflow:

1. Create a workflow file (e.g., `.github/workflows/syntax-check.yml`).
2. Configure the workflow to use the `Check Syntax Action`:

```yaml
on: [push]

jobs:
  syntax_check:
    runs-on: ubuntu-latest
    name: Check Syntax
    steps:
    - name: Checkout repository
      uses: actions/checkout@v2
    - name: Run Check Syntax Action
      uses: ./.github/actions/check-syntax-action  # Specify the path to your action
      env:
        ACTIONLINT_VERSION: "1.6.25"
        YAMLLINT_VERSION: "1.32.0"
