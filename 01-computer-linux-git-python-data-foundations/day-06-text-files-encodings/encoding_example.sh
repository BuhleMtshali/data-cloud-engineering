#!/bin/bash

# ============================================================
# Day 6 – Text Files, Encoding & CSV Chaos Lab
# Task:
# Create CSV files with commas, quotes, Unicode names,
# and bad line endings; write notes on what breaks and why.
# ============================================================

echo "============================================================"
echo "📄 DAY 6 – TEXT FILES, ENCODING & CSV CHAOS LAB"
echo "============================================================"

# ------------------------------------------------------------
# Variables
# ------------------------------------------------------------

LAB_DIR="day6-text-encoding-lab"

GOOD_CSV="good_users.csv"
BAD_COMMAS_CSV="bad_commas.csv"
FIXED_COMMAS_CSV="fixed_commas.csv"
BAD_QUOTES_CSV="bad_quotes.csv"
FIXED_QUOTES_CSV="fixed_quotes.csv"
UNICODE_CSV="unicode_names_utf8.csv"
CRLF_CSV="bad_line_endings_crlf.csv"
MIXED_LINE_ENDINGS_CSV="mixed_line_endings.csv"
FIXED_LINE_ENDINGS_CSV="fixed_line_endings.csv"
FIXED_LINE_ENDINGS_TR_CSV="fixed_line_endings_tr.csv"

CHECKER_SCRIPT="check_csv.py"
NOTES_FILE="notes_what_breaks.md"
REPORT_FILE="csv_lab_report.txt"

# ------------------------------------------------------------
# Step 1: Create lab folder
# ------------------------------------------------------------

echo
echo "============================================================"
echo "📁 STEP 1: Creating lab folder"
echo "============================================================"

mkdir -p "$LAB_DIR"
cd "$LAB_DIR" || exit 1

echo "✅ Lab folder ready: $LAB_DIR"
echo "Current directory:"
pwd

# ------------------------------------------------------------
# Step 2: Create a clean CSV file
# ------------------------------------------------------------

echo
echo "============================================================"
echo "✅ STEP 2: Creating clean CSV file"
echo "============================================================"

cat > "$GOOD_CSV" << 'EOF'
id,name,role,status
1,Buhle,analyst,active
2,Amina,engineer,active
3,Neo,service,inactive
EOF

echo "✅ Created: $GOOD_CSV"

# ------------------------------------------------------------
# Step 3: Create CSV with broken comma handling
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🍝 STEP 3: Creating CSV with unescaped comma issue"
echo "============================================================"

cat > "$BAD_COMMAS_CSV" << 'EOF'
id,name,role,status
1,Mtshali, Buhle,analyst,active
2,Amina,engineer,active
3,Neo,service,inactive
EOF

echo "✅ Created: $BAD_COMMAS_CSV"
echo "⚠️ This file contains a name with a comma that is NOT quoted."

# ------------------------------------------------------------
# Step 4: Create fixed comma CSV
# ------------------------------------------------------------

echo
echo "============================================================"
echo "✅ STEP 4: Creating fixed comma CSV"
echo "============================================================"

cat > "$FIXED_COMMAS_CSV" << 'EOF'
id,name,role,status
1,"Mtshali, Buhle",analyst,active
2,Amina,engineer,active
3,Neo,service,inactive
EOF

echo "✅ Created: $FIXED_COMMAS_CSV"
echo "✅ The comma inside the name is protected with quotes."

# ------------------------------------------------------------
# Step 5: Create CSV with broken quote handling
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🎭 STEP 5: Creating CSV with broken quote issue"
echo "============================================================"

cat > "$BAD_QUOTES_CSV" << 'EOF'
id,name,comment
1,Buhle,"Learning "Linux permissions" today"
2,Amina,"CSV files are tricky"
EOF

echo "✅ Created: $BAD_QUOTES_CSV"
echo "⚠️ This file contains quotes inside a quoted field that are not escaped."

# ------------------------------------------------------------
# Step 6: Create fixed quotes CSV
# ------------------------------------------------------------

echo
echo "============================================================"
echo "✅ STEP 6: Creating fixed quotes CSV"
echo "============================================================"

cat > "$FIXED_QUOTES_CSV" << 'EOF'
id,name,comment
1,Buhle,"Learning ""Linux permissions"" today"
2,Amina,"CSV files are tricky"
EOF

echo "✅ Created: $FIXED_QUOTES_CSV"
echo "✅ Internal quotes are escaped by doubling them."

# ------------------------------------------------------------
# Step 7: Create UTF-8 CSV with Unicode names and emojis
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🌍 STEP 7: Creating UTF-8 CSV with Unicode names"
echo "============================================================"

cat > "$UNICODE_CSV" << 'EOF'
id,name,city,emoji
1,Zoë,Cape Town,🌍
2,José,São Paulo,🔐
3,Björk,Reykjavík,🎵
4,李雷,北京,📊
5,Chloé,Montréal,✨
EOF

echo "✅ Created: $UNICODE_CSV"
echo "✅ This file contains Unicode characters and emojis."

# ------------------------------------------------------------
# Step 8: Create CSV with Windows CRLF line endings
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🪟 STEP 8: Creating CSV with Windows CRLF line endings"
echo "============================================================"

printf 'id,name,role\r\n1,Buhle,analyst\r\n2,Amina,engineer\r\n3,Neo,service\r\n' > "$CRLF_CSV"

echo "✅ Created: $CRLF_CSV"
echo "⚠️ This file uses Windows CRLF line endings."

# ------------------------------------------------------------
# Step 9: Create CSV with mixed line endings
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🧨 STEP 9: Creating CSV with mixed line endings"
echo "============================================================"

printf 'id,name,status\n1,Buhle,active\r\n2,Amina,active\n3,Neo,inactive\r\n4,Zola,inactive\n' > "$MIXED_LINE_ENDINGS_CSV"

echo "✅ Created: $MIXED_LINE_ENDINGS_CSV"
echo "⚠️ This file mixes LF and CRLF line endings."

# ------------------------------------------------------------
# Step 10: Create Python CSV checker
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🐍 STEP 10: Creating Python CSV checker"
echo "============================================================"

cat > "$CHECKER_SCRIPT" << 'EOF'
import csv
from pathlib import Path

files = [
    "good_users.csv",
    "bad_commas.csv",
    "fixed_commas.csv",
    "bad_quotes.csv",
    "fixed_quotes.csv",
    "unicode_names_utf8.csv",
    "bad_line_endings_crlf.csv",
    "mixed_line_endings.csv",
]

print("============================================================")
print("🐍 CSV PARSING CHECKER")
print("============================================================")

for filename in files:
    print()
    print("=" * 60)
    print(f"Checking: {filename}")
    print("=" * 60)

    path = Path(filename)

    if not path.exists():
        print(f"ERROR: {filename} does not exist.")
        continue

    try:
        with path.open("r", encoding="utf-8", newline="") as f:
            reader = csv.reader(f)
            rows = list(reader)

        if not rows:
            print("File is empty.")
            continue

        expected_columns = len(rows[0])
        print(f"Expected columns from header: {expected_columns}")

        for line_number, row in enumerate(rows, start=1):
            column_count = len(row)
            status = "OK" if column_count == expected_columns else "BAD"

            print(
                f"Line {line_number}: "
                f"columns={column_count} "
                f"status={status} "
                f"row={row}"
            )

    except UnicodeDecodeError as error:
        print(f"ENCODING ERROR: {error}")

    except csv.Error as error:
        print(f"CSV ERROR: {error}")

    except Exception as error:
        print(f"OTHER ERROR: {error}")
EOF

echo "✅ Created: $CHECKER_SCRIPT"

# ------------------------------------------------------------
# Step 11: Create stricter Python CSV checker
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🧪 STEP 11: Creating stricter CSV checker"
echo "============================================================"

cat > "strict_check_csv.py" << 'EOF'
import csv
from pathlib import Path

files = [
    "good_users.csv",
    "bad_commas.csv",
    "fixed_commas.csv",
    "bad_quotes.csv",
    "fixed_quotes.csv",
    "unicode_names_utf8.csv",
    "bad_line_endings_crlf.csv",
    "mixed_line_endings.csv",
]

print("============================================================")
print("🧪 STRICT CSV CHECKER")
print("============================================================")

for filename in files:
    print()
    print("=" * 60)
    print(f"Strict checking: {filename}")
    print("=" * 60)

    path = Path(filename)

    try:
        with path.open("r", encoding="utf-8", newline="") as f:
            reader = csv.reader(f, strict=True)
            rows = list(reader)

        expected_columns = len(rows[0]) if rows else 0

        for line_number, row in enumerate(rows, start=1):
            if len(row) != expected_columns:
                print(
                    f"BAD ROW: line={line_number}, "
                    f"expected={expected_columns}, "
                    f"actual={len(row)}, "
                    f"row={row}"
                )

        print("Strict parse completed.")

    except UnicodeDecodeError as error:
        print(f"ENCODING ERROR: {error}")

    except csv.Error as error:
        print(f"CSV ERROR: {error}")

    except Exception as error:
        print(f"OTHER ERROR: {error}")
EOF

echo "✅ Created: strict_check_csv.py"

# ------------------------------------------------------------
# Step 12: Create notes file
# ------------------------------------------------------------

echo
echo "============================================================"
echo "📝 STEP 12: Creating notes file"
echo "============================================================"

cat > "$NOTES_FILE" << 'EOF'
# Day 6 Notes – What Breaks and Why

## 1. Commas inside fields

### Broken example

```csv
1,Mtshali, Buhle,analyst,active