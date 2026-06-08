#!/bin/bash

# ============================================================
# Day 4 – Linux File Permissions Lab
# Task:
# Create analyst, engineer, and service users;
# make shared data folders with correct read/write permissions;
# document access tests.
# ============================================================

echo "============================================================"
echo "🔐 DAY 4 – LINUX USERS, GROUPS & SHARED DATA PERMISSIONS"
echo "============================================================"

# ------------------------------------------------------------
# Safety check: script must run with sudo/root
# ------------------------------------------------------------

if [ "$EUID" -ne 0 ]; then
    echo "❌ Please run this script with sudo:"
    echo "sudo ./day4_permissions_lab.sh"
    exit 1
fi

echo "✅ Running as root. Admin powers unlocked 🐧"

# ------------------------------------------------------------
# Variables
# ------------------------------------------------------------

USERS=("analyst" "engineer" "service")

DATA_TEAM_GROUP="data-team"
SERVICE_GROUP="pipeline-services"

BASE_DIR="/data-platform"
SHARED_DIR="$BASE_DIR/shared"

RAW_DIR="$SHARED_DIR/raw"
CURATED_DIR="$SHARED_DIR/curated"
SERVICE_DROP_DIR="$SHARED_DIR/service-drop"

TEST_REPORT="$BASE_DIR/access_tests.txt"

# ------------------------------------------------------------
# Step 1: Create groups
# ------------------------------------------------------------

echo
echo "============================================================"
echo "👥 STEP 1: Creating groups"
echo "============================================================"

if getent group "$DATA_TEAM_GROUP" > /dev/null; then
    echo "ℹ️ Group '$DATA_TEAM_GROUP' already exists"
else
    groupadd "$DATA_TEAM_GROUP"
    echo "✅ Created group: $DATA_TEAM_GROUP"
fi

if getent group "$SERVICE_GROUP" > /dev/null; then
    echo "ℹ️ Group '$SERVICE_GROUP' already exists"
else
    groupadd "$SERVICE_GROUP"
    echo "✅ Created group: $SERVICE_GROUP"
fi

# ------------------------------------------------------------
# Step 2: Create users
# ------------------------------------------------------------

echo
echo "============================================================"
echo "👤 STEP 2: Creating users"
echo "============================================================"

for USERNAME in "${USERS[@]}"; do
    if id "$USERNAME" &>/dev/null; then
        echo "ℹ️ User '$USERNAME' already exists"
    else
        useradd -m -s /bin/bash "$USERNAME"
        echo "✅ Created user: $USERNAME with home directory"
    fi
done

echo
echo "⚠️ Password note:"
echo "This script does NOT hardcode passwords because that is bad security practice."
echo "Set passwords manually if you want to test interactive login:"
echo "sudo passwd analyst"
echo "sudo passwd engineer"
echo "sudo passwd service"

# ------------------------------------------------------------
# Step 3: Add users to groups
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🪪 STEP 3: Adding users to groups"
echo "============================================================"

usermod -aG "$DATA_TEAM_GROUP" analyst
echo "✅ Added analyst to $DATA_TEAM_GROUP"

usermod -aG "$DATA_TEAM_GROUP" engineer
echo "✅ Added engineer to $DATA_TEAM_GROUP"

usermod -aG "$SERVICE_GROUP" service
echo "✅ Added service to $SERVICE_GROUP"

# ------------------------------------------------------------
# Step 4: Create shared folder structure
# ------------------------------------------------------------

echo
echo "============================================================"
echo "📁 STEP 4: Creating shared data folders"
echo "============================================================"

mkdir -p "$RAW_DIR"
mkdir -p "$CURATED_DIR"
mkdir -p "$SERVICE_DROP_DIR"

echo "✅ Created folder structure:"
echo "$BASE_DIR/"
echo "└── shared/"
echo "    ├── raw/"
echo "    ├── curated/"
echo "    └── service-drop/"

# ------------------------------------------------------------
# Step 5: Set ownership
# ------------------------------------------------------------

echo
echo "============================================================"
echo "👑 STEP 5: Setting ownership"
echo "============================================================"

chown -R engineer:"$DATA_TEAM_GROUP" "$RAW_DIR"
chown -R engineer:"$DATA_TEAM_GROUP" "$CURATED_DIR"
chown -R service:"$SERVICE_GROUP" "$SERVICE_DROP_DIR"

echo "✅ Ownership set:"
echo "$RAW_DIR          -> engineer:$DATA_TEAM_GROUP"
echo "$CURATED_DIR      -> engineer:$DATA_TEAM_GROUP"
echo "$SERVICE_DROP_DIR -> service:$SERVICE_GROUP"

# ------------------------------------------------------------
# Step 6: Set permissions
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🔐 STEP 6: Setting permissions"
echo "============================================================"

# raw:
# engineer and data-team can read/write/enter
# others blocked
chmod 770 "$RAW_DIR"

# curated:
# engineer can read/write/enter
# data-team can read/enter
# others blocked
chmod 750 "$CURATED_DIR"

# service-drop:
# service and pipeline-services can read/write/enter
# others blocked
chmod 770 "$SERVICE_DROP_DIR"

echo "✅ Permissions applied:"
echo "$RAW_DIR          -> 770"
echo "$CURATED_DIR      -> 750"
echo "$SERVICE_DROP_DIR -> 770"

# ------------------------------------------------------------
# Step 7: Apply setgid to shared group folders
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🧬 STEP 7: Applying setgid to shared folders"
echo "============================================================"

chmod g+s "$RAW_DIR"
chmod g+s "$CURATED_DIR"
chmod g+s "$SERVICE_DROP_DIR"

echo "✅ setgid applied"
echo "New files created inside these folders will inherit the folder group."

# ------------------------------------------------------------
# Step 8: Create sample files
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🧪 STEP 8: Creating sample data files"
echo "============================================================"

echo "timestamp,user,event,status" > "$RAW_DIR/auth_events.csv"
echo "2026-06-08,analyst,login,success" >> "$RAW_DIR/auth_events.csv"

echo "dataset,total_events,suspicious_events" > "$CURATED_DIR/security_summary.csv"
echo "auth_events,1,0" >> "$CURATED_DIR/security_summary.csv"

echo "service pipeline drop zone" > "$SERVICE_DROP_DIR/service_note.txt"

chown engineer:"$DATA_TEAM_GROUP" "$RAW_DIR/auth_events.csv"
chown engineer:"$DATA_TEAM_GROUP" "$CURATED_DIR/security_summary.csv"
chown service:"$SERVICE_GROUP" "$SERVICE_DROP_DIR/service_note.txt"

chmod 660 "$RAW_DIR/auth_events.csv"
chmod 640 "$CURATED_DIR/security_summary.csv"
chmod 660 "$SERVICE_DROP_DIR/service_note.txt"

echo "✅ Sample files created with secure permissions"

# ------------------------------------------------------------
# Step 9: Show current permissions
# ------------------------------------------------------------

echo
echo "============================================================"
echo "📋 STEP 9: Current folder permissions"
echo "============================================================"

ls -ld "$BASE_DIR"
ls -ld "$SHARED_DIR"
ls -ld "$RAW_DIR"
ls -ld "$CURATED_DIR"
ls -ld "$SERVICE_DROP_DIR"

echo
echo "📋 Current file permissions:"
ls -l "$RAW_DIR"
ls -l "$CURATED_DIR"
ls -l "$SERVICE_DROP_DIR"

# ------------------------------------------------------------
# Step 10: Access test helper
# ------------------------------------------------------------

echo
echo "============================================================"
echo "🧪 STEP 10: Running access tests"
echo "============================================================"

echo "Day 4 Linux Permissions Access Test Report" > "$TEST_REPORT"
echo "Generated on: $(date)" >> "$TEST_REPORT"
echo "============================================================" >> "$TEST_REPORT"
echo >> "$TEST_REPORT"

run_test() {
    TEST_NAME="$1"
    TEST_USER="$2"
    TEST_COMMAND="$3"
    EXPECTED="$4"

    echo "Running test: $TEST_NAME"

    if su - "$TEST_USER" -c "$TEST_COMMAND" &>/dev/null; then
        RESULT="SUCCESS"
    else
        RESULT="FAILED"
    fi

    echo "Test: $TEST_NAME" >> "$TEST_REPORT"
    echo "User: $TEST_USER" >> "$TEST_REPORT"
    echo "Command: $TEST_COMMAND" >> "$TEST_REPORT"
    echo "Expected: $EXPECTED" >> "$TEST_REPORT"
    echo "Actual: $RESULT" >> "$TEST_REPORT"

    if [ "$RESULT" = "$EXPECTED" ]; then
        echo "Status: PASS ✅" >> "$TEST_REPORT"
        echo "✅ PASS: $TEST_NAME"
    else
        echo "Status: REVIEW ⚠️" >> "$TEST_REPORT"
        echo "⚠️ REVIEW: $TEST_NAME"
    fi

    echo "------------------------------------------------------------" >> "$TEST_REPORT"
    echo >> "$TEST_REPORT"
}

# ------------------------------------------------------------
# Access Tests
# ------------------------------------------------------------

# Analyst tests
run_test \
"Analyst can enter raw folder" \
"analyst" \
"cd $RAW_DIR" \
"SUCCESS"

run_test \
"Analyst can write to raw folder" \
"analyst" \
"touch $RAW_DIR/analyst_raw_test.txt" \
"SUCCESS"

run_test \
"Analyst can read curated folder" \
"analyst" \
"ls $CURATED_DIR" \
"SUCCESS"

run_test \
"Analyst cannot write to curated folder" \
"analyst" \
"touch $CURATED_DIR/analyst_curated_test.txt" \
"FAILED"

run_test \
"Analyst cannot access service-drop folder" \
"analyst" \
"cd $SERVICE_DROP_DIR" \
"FAILED"

# Engineer tests
run_test \
"Engineer can write to raw folder" \
"engineer" \
"touch $RAW_DIR/engineer_raw_test.txt" \
"SUCCESS"

run_test \
"Engineer can write to curated folder" \
"engineer" \
"touch $CURATED_DIR/engineer_curated_test.txt" \
"SUCCESS"

run_test \
"Engineer cannot access service-drop folder" \
"engineer" \
"cd $SERVICE_DROP_DIR" \
"FAILED"

# Service tests
run_test \
"Service can write to service-drop folder" \
"service" \
"touch $SERVICE_DROP_DIR/service_test.txt" \
"SUCCESS"

run_test \
"Service cannot access raw folder" \
"service" \
"cd $RAW_DIR" \
"FAILED"

run_test \
"Service cannot access curated folder" \
"service" \
"cd $CURATED_DIR" \
"FAILED"

# ------------------------------------------------------------
# Step 11: Final permission view after tests
# ------------------------------------------------------------

echo
echo "============================================================"
echo "📋 STEP 11: Final folder contents after tests"
echo "============================================================"

echo
echo "Raw folder:"
ls -l "$RAW_DIR"

echo
echo "Curated folder:"
ls -l "$CURATED_DIR"

echo
echo "Service-drop folder:"
ls -l "$SERVICE_DROP_DIR"

# ------------------------------------------------------------
# Step 12: Access matrix
# ------------------------------------------------------------

echo
echo "============================================================"
echo "📊 ACCESS MATRIX"
echo "============================================================"

cat << MATRIX

Folder                              Analyst       Engineer      Service       Others
-------------------------------------------------------------------------------------
$RAW_DIR                            Read/Write    Read/Write    No Access     No Access
$CURATED_DIR                        Read Only     Read/Write    No Access     No Access
$SERVICE_DROP_DIR                   No Access     No Access     Read/Write    No Access

MATRIX

cat << MATRIX >> "$TEST_REPORT"

ACCESS MATRIX

Folder: $RAW_DIR
Analyst: Read/Write
Engineer: Read/Write
Service: No Access
Others: No Access

Folder: $CURATED_DIR
Analyst: Read Only
Engineer: Read/Write
Service: No Access
Others: No Access

Folder: $SERVICE_DROP_DIR
Analyst: No Access
Engineer: No Access
Service: Read/Write
Others: No Access

MATRIX

# ------------------------------------------------------------
# Complete
# ------------------------------------------------------------

echo
echo "============================================================"
echo "✅ DAY 4 PERMISSIONS LAB COMPLETE"
echo "============================================================"

echo "Access test report saved to:"
echo "$TEST_REPORT"

echo
echo "View it with:"
echo "cat $TEST_REPORT"

echo
echo "Security Data Engineer Zanobuhle loading... ███████░░░ 72% 🚀🔐"