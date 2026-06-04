# Fake Data Platform Directory Tree

# Step 1: Create the main project folder
mkdir data-platform
cd data-platform

mkdir raw staged curated logs scripts configs docs

touch raw/auth_logs.json raw/firewall_logs.csv
touch staged/cleaned_auth_logs.csv
touch curated/security_summary.csv
touch logs/pipeline.log
touch scripts/ingest.py scripts/transform.py
touch configs/pipeline_config.yaml
touch docs/README.md docs/data_dictionary.md

echo '{"user":"buhle","event":"login","status":"success"}' > raw/auth_logs.json

echo "timestamp,src_ip,dst_ip,action" > raw/firewall_logs.csv
echo "2026-06-04,10.0.0.5,8.8.8.8,ALLOW" >> raw/firewall_logs.csv

echo "source: raw" > configs/pipeline_config.yaml
echo "destination: curated" >> configs/pipeline_config.yaml
echo "log_level: INFO" >> configs/pipeline_config.yaml

echo 'print("Ingesting raw security logs...")' > scripts/ingest.py
python3 scripts/ingest.py

echo "Pipeline started successfully" > logs/pipeline.log
echo "Raw logs loaded" >> logs/pipeline.log
echo "Pipeline finished successfully" >> logs/pipeline.log

echo "# Data Platform Project" > docs/README.md
echo "This project simulates a basic data engineering platform." >> docs/README.md

find . -type f