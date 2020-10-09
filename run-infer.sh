#!/bin/bash

RULES=(Rule_01 Rule_02 Rule_03 Rule_04 Rule_05 Rule_06 Rule_07 Rule_08 Rule_09 Rule_10 Rule_11 Rule_12 Rule_14 Rule_50)
OPTS="-P --fail-on-issue --annotation-reachability --bufferoverrun --nullsafe --quandary --racerd"

SAMPLES_HIGH=0
SAMPLES_MED=0
SAMPLES_LOW=0
SCORE_HIGH=0
SCORE_MED=0
SCORE_LOW=0

for i in ${RULES[@]}; do
    RULE_HIGH=0
    RULE_MED=0
    RULE_LOW=0
    RULE_SAMPLES_HIGH=0
    RULE_SAMPLES_MED=0
    RULE_SAMPLES_LOW=0

    for j in $i*/*high*.c; do
	if [ -f $j ]; then
	    infer run $OPTS -- clang -Wall -c $j || let RULE_HIGH++
	    let RULE_SAMPLES_HIGH++
	fi
    done

    for j in $i*/*medium*.c; do
	if [ -f $j ]; then
	    infer run $OPTS -- clang -Wall -c $j || let RULE_MED++
	    let RULE_SAMPLES_MED++
	fi
    done

    for j in $i*/*low*.c; do
	if [ -f $j ]; then
	    infer run $OPTS -- clang -Wall -c $j || let RULE_LOW++
	    let RULE_SAMPLES_LOW++
	fi
    done

    echo "$i score High: $RULE_HIGH/$RULE_SAMPLES_HIGH Medium: $RULE_MED/$RULE_SAMPLES_MED Low: $RULE_LOW/$RULE_SAMPLES_LOW"

    let SCORE_HIGH+=$RULE_HIGH
    let SCORE_MED+=$RULE_MED
    let SCORE_LOW+=$RULE_LOW
    let SAMPLES_HIGH+=$RULE_SAMPLES_HIGH
    let SAMPLES_MED+=$RULE_SAMPLES_MED
    let SAMPLES_LOW+=$RULE_SAMPLES_LOW
done

echo "Combined score High: $SCORE_HIGH/$SAMPLES_HIGH Medium: $SCORE_MED/$SAMPLES_MED Low: $SCORE_LOW/$SAMPLES_LOW"
