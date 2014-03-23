already_started=/home/maruen/servers/AtendimentoSMS.port9000/RUNNING_PID
play_cmd=play
prog_dir=/home/maruen/servers/AtendimentoSMS.port9000

if [ -f $already_started ];
then
    process_id=`cat $already_started`
    echo "file RUNNING_PID already exists, process ID is: $process_id"
    echo "killing the server and restarting"
    `kill -9 $process_id`
    `rm $already_started`
    `cd "$prog_dir" ;"$play_cmd" start &`
else
    echo "play server is not up, so starting it"
    `cd "$prog_dir" ;"$play_cmd" start &`
fi

exit
