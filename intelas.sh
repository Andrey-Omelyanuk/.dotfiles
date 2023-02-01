#!/bin/sh
#tmux new-session -s intelas -n code -d 'vim' 
#tmux new-window  -t intelas:1 -n logs            'docker-compose up; bash -i'
#tmux split-window -v                  'sleep 30s; docker-compose logs -f back2; bash -i'
#tmux split-window -h                  'sleep 30s; docker-compose logs -f front; bash -i'
#tmux new-window  -t intelas:2 -n run  'sleep 30s; docker-compose exec back2 sh'
#tmux split-window -v                  'sleep 30s; docker-compose exec front sh'

cd ~/projects/intelas
#find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;

cd ~/projects/intelas/intelas-web
tmux new-session  -s intelas   -n docker -d 'make web' 
tmux new-window   -t intelas:1 -n back      'sleep 20s; docker container attach intelas-web_back_1'
tmux split-window -v                        'sleep 20s; make sh s=back'
tmux new-window   -t intelas:2 -n front     'sleep 20s; docker container attach intelas-web_front_1'
tmux split-window -v                        'sleep 20s; make sh s=front'
#tmux new-window   -t intelas:3 -n api      'sleep 10s; docker container attach intelas_api_1'
#tmux new-window  -t intelas:4 -n worker   'sleep 10s; docker container attach intelas_worker_1'
#tmux new-window  -t intelas:5 -n beat     'sleep 10s; docker container attach intelas_beat_1'
#tmux new-window  -t intelas:6 -n flower   'sleep 10s; docker container attach intelas_flower_1'
#tmux new-window  -t intelas:7 -n db       'sleep 10s; docker container attach intelas_db_1'
#tmux new-window  -t intelas:8 -n redis    'sleep 10s; docker container attach intelas_redis_1'
tmux select-window -t intelas:0
tmux -2 attach-session -t intelas 

