#!/bin/bash

# Review and display critical log entries
analyze_logs() {
    echo "Reviewing recent critical log entries:"
    sudo journalctl --priority=crit
}
