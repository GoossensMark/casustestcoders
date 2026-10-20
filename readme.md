# Robot Framework Project - Quick Start

## 1. Clone the Repository

```bash
git clone https://github.com/GoossensMark/casustestcoders.git
cd robot-project
```

## 2. Create & Activate Virtual Environment

### Windows

```powershell
python -m venv .venv
.venv\Scripts\activate
```

### Linux/macOS

```bash
python3 -m venv .venv
source .venv/bin/activate
```

## 3. Install Dependencies

```bash
python -m pip install --upgrade pip
pip install -r requirements.txt
```

## 4. Install Browser Library Dependencies

```bash
rfbrowser init
```

## 5. Configure the Cat API Key

The cat-picture API test uses a TheCatAPI key. Create an account at [TheCatAPI](https://thecatapi.com/), then get an API key from your account. Keep the key private; do not put it in source files or commit it.

Set `CAT_API_KEY` in the terminal where you will run the tests.

### Windows PowerShell

```powershell
$env:CAT_API_KEY = "your-cat-api-key"
```

This sets the key for the current terminal session. Set it again in a new terminal.

### Linux/macOS

```bash
export CAT_API_KEY="your-cat-api-key"
```

## 6. Run Tests

With the virtual environment activated, run all Robot Framework tests from the repository root:

```text
robot tests
```

To save the generated reports and logs in `results/` instead of the repository root, run:

```text
robot -d results tests
```

## 7. Configure GitHub Actions

The workflow uses the GitHub Environment named `test` and reads `CAT_API_KEY` from its secrets.

1. In the repository on GitHub, open **Settings → Environments** and create an environment named `test` if it does not already exist.
2. Open that environment, add an environment secret named `CAT_API_KEY`, and paste the key as its value.
3. The `robot-tests.yml` workflow associates its job with the `test` environment and passes the secret to the Robot test step.

Keep the key in GitHub Secrets; do not add its value to the workflow file or repository.

## 8. View Reports

Open `results/report.html` and `results/log.html`.

## Project Structure

```text
tests/
  api/                 API test suites and their DataDriver CSV files
  gui/                 GUI test suites
libraries/
  api/                 Reusable Robot keywords for API interactions
  gui/                 Reusable Robot keywords for GUI interactions
  helpers/             Shared Robot resources and helper keywords
  environment.py       Shared environment variables and URLs
testdata/
  realtime/            Files generated or downloaded while tests run
results/               Robot Framework output, log, and report files
browser/               Browser Library artifacts, such as screenshots
requirements.txt        Python dependencies for the project
robot.toml              RobotCode project configuration
```

## Design Principle

- **Robot Framework** = test scenarios and reusable keywords
- **Resource files** = reusable API, GUI, and helper workflows
- **Python** = shared environment configuration and values
- Keep test suites focused on readable scenarios and reuse keywords from `libraries/`


## Possible improvements
 - Verify build response matches json schema
 - Further investigate if can set default selector strategy so that for browser KW's data-testid= isn't required, (set selector prefix?)
 - When running debugger for browser TC make headless=False for easier debugging
 - Fix discrepency rule's between Robotidy and robocop
 

## Bugs
 - name doesn't have to be unique when creating new build through API?
 - The POST is not case sensitive but the GET is?
