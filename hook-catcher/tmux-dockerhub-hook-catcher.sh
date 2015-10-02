#!/usr/bin/env bash
tmux new-session -d -s dockerhub-hook-catcher
tmux send-keys -t dockerhub-hook-catcher:0 "sleep 2m" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "cd ~/RubymineProjects/SharedFunctional/" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "ruby services/docker-hub/hook-catcher/dockerhub_hook_catcher.rb -o 0.0.0.0 -p 8080" C-m