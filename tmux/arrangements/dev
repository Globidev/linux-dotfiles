# nload pane
tmux split-window -t .0 -h
tmux send-keys -t .1 "nload eth0" C-m

# htop
tmux split-window -t .1 -v
tmux send-keys -t .2 htop C-m

# adjust dimensions
tmux resize-pane -t .1 -R 42
tmux resize-pane -t .1 -U 10
tmux split-window -t .0 -v # extra window
tmux resize-pane -t .3 -D 15
tmux select-pane -t .0
tmux send-keys -t .0 clear C-m

tmux new-window -n dockerd
tmux send-keys -t .0 "sudo docker daemon" C-m
