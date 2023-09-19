#!/bin/bash

terraform init
terraform plan -out=plan.tfout
terraform show -json "plan.tfout">"plan.json"

POLICY_DIR="./whitelist.rego"

INPUT_FILE="./plan.json"

# Run conftest and specify the policies directory and input file


conftest test -p $POLICY_DIR $INPUT_FILE
CONFTST_EXIT_CODE=$?
echo $CONFTST_EXIT_CODE
exit $CONFTST_EXIT_CODE

rm -rf plan_output.txt plan.tfout plan.json .terraform*