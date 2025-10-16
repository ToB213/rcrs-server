#!/bin/bash
# Script to kill specific Java processes related to rcrs-server
# Usage: ./kill.sh

TARGETS=(
  "kernel.StartKernel"
  "misc.MiscSimulator"
  "traffic3.simulator.TrafficSimulator"
  # "firesimulator.FireSimulatorWrapper"
  # "ignition.IgnitionSimulator"
  "collapse.CollapseSimulator"
  "clear.ClearSimulator"
  "sample.SampleCivilian"
  "sample.SampleViewer"
)

for TARGET in "${TARGETS[@]}"; do
  PIDS=$(ps -ef | grep java | grep "$TARGET" | grep -v grep | awk '{print $2}' | xargs)
  if [[ -n "$PIDS" ]]; then
    echo "Stopping $TARGET (PID: $PIDS)"
    kill $PIDS 2>/dev/null
  else
    echo "$TARGET is not running."
  fi
done