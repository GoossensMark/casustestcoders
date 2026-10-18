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

Run all tests:

```bash
robot -d results tests/
```

Run only API tests:

```bash
robot -d results tests/api/
```

Run only UI tests:

```bash
robot -d results tests/ui/
```

## 6. View Reports

Open:

```text
results/report.html
results/log.html
```

## Project Structure

```text
tests/          Robot test cases
libraries/      Python implementation
resources/      Shared Robot resources
data/           Test data
results/        Test reports
```

## Design Principle

- **Robot Framework** = test scenarios
- **Python** = business logic, API calls, page objects
- Keep `.robot` files simple and readable
- Implement reusable functionality in Python


## Possible improvements
 - make sure all .robot file runs with robotcode
 - verify build response matches json schema
 - further investigate if can set default selector strategy so that for browser KW's data-testid= isn't required, (set selector prefix?)
 - When running debugger for browser TC make headless=False for easier debugging
 

## Bugs
 - name doesn't have to be unique when creating new build through API?