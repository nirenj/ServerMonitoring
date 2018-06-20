ServerMonitoring Shell Scripts

Shell scripts to monitor CPU and Memory of a Unix based system and output to a file.

We all want to monitor CPU usage and memory usage of a process continuously and get that output to a file so that we can use them to analyze more later with graphs and stuff.

Below are two shell scripts which use Linux top and free commands to undertake this task for me.

In these scripts I run the top command in a loop and use grep command to only filter out the rest and get the line I need and then do some text processing using cut and tr.

After that result of appended to a file using tee command. Here I am monitoring influxd, a time series database process. You can monitor any process you require by simply replacing the relevant name here “grep -w influxd”.

Note that the filter string you use should properly filter out others and only leave a single line.
