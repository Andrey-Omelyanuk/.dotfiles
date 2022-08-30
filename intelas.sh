#!/bin/sh
#tmux new-session -s intelas -n code -d 'vim' 
#tmux new-window  -t intelas:1 -n logs            'docker-compose up; bash -i'
#tmux split-window -v                  'sleep 30s; docker-compose logs -f back2; bash -i'
#tmux split-window -h                  'sleep 30s; docker-compose logs -f front; bash -i'
#tmux new-window  -t intelas:2 -n run  'sleep 30s; docker-compose exec back2 sh'
#tmux split-window -v                  'sleep 30s; docker-compose exec front sh'

cd ~/projects/intelas
#find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;

cd ~/projects/intelas/intelas
tmux new-session -s intelas -n docker -d 'docker-compose up' 
tmux new-window  -t intelas:1 -n back  'sleep 30s; docker container attach intelas_back_1'
tmux new-window  -t intelas:2 -n front 'sleep 30s; docker container attach intelas_front_1'
tmux new-window  -t intelas:3 -n sh-back  'sleep 30s; docker-compose exec back sh'
tmux new-window  -t intelas:4 -n sh-front 'sleep 30s; docker-compose exec front sh'
tmux select-window -t intelas:0
tmux -2 attach-session -t intelas 

