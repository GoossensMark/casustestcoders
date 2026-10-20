# Robot Framework Project - Quick Start

## 1. Clone the Repository

```bash
git clone <repository-url>
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

## 5. Run Tests

With the virtual environment activated, run all Robot Framework tests from the repository root:

```text
robot tests
```

To save the generated reports and logs in `results/` instead of the repository root, run:

```text
robot -d results tests
```

## 6. View Reports

Open:

```text
results/report.html
results/log.html
```

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
 - make sure all .robot file runs with robotcode
 - verify build response matches json schema
 - further investigate if can set default selector strategy so that for browser KW's data-testid= isn't required, (set selector prefix?)
 - When running debugger for browser TC make headless=False for easier debugging
 

## Bugs
 - name doesn't have to be unique when creating new build through API?
 - The POST is not case sensitive but the GET is?