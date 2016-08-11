#!/usr/bin/env bash
# crontab entry:
# @reboot bash ~/RubymineProjects/docker-hub-hook-catcher/tmux-dockerhub-hook-catcher.sh
tmux new-session -d -s dockerhub-hook-catcher
tmux send-keys -t dockerhub-hook-catcher:0 "sleep 2m" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "cd ~/RubymineProjects/docker-hub-hook-catcher/" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "git pull" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "source ~/.rvm/scripts/rvm" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "bundle install" C-m
tmux send-keys -t dockerhub-hook-catcher:0 "ruby dockerhub_hook_catcher.rb -o 0.0.0.0 -p 8080" C-m