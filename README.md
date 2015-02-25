
```
$ ./pss -h
Usage: pss [options] [pid or command] ...

Options:
  -h, --help            show this help message and exit
  -c COUNT, --count=COUNT
                        count to sampling [default: 10]
  -i INTERVAL, --interval=INTERVAL
                        interval to sampling [default: 2]
  -d, --delta           show changed procs only [default: False]
  -p, --prof            profiling [default: False]
  -t, --tag             show tag continuously [default: False]
```

```
$ ./pss sshd libvirtd
#                 doa   %CPU  %usr  %sys   pid    uname       vsz   vpeak     rsz   rpeak stack    data    text    swap  nv_cs   v_cs   nlwp cmdline
2015-02-25T12:21:43 +   0.01  0.00  0.00  1305       root   66608   66612     624    1240    88     532     520     616      0      0      1 /usr/sbin/sshd
2015-02-25T12:21:43 +   0.00  0.00  0.00  1473       root 1024096 1089632   10568   12176    88  773148    1396    1964      0      0     11 libvirtd --daemon
2015-02-25T12:21:43 +   0.00  0.00  0.00  7509       root  100356  100388    3956    3960    88     716     520       0      0      0      1 sshd: aminamid [priv]
2015-02-25T12:21:43 +   0.00  0.00  0.00  7511   aminamid  100356  100360    1876    1876    88     716     520       0      0      0      1 sshd: aminamid@pts/0
2015-02-25T12:21:45 c   0.00  0.00  0.00  1305       root   66608   66612     624    1240    88     532     520     616      0      0      1 /usr/sbin/sshd
2015-02-25T12:21:45 c   0.00  0.00  0.00  1473       root 1024096 1089632   10568   12176    88  773148    1396    1964      0      0     11 libvirtd --daemon
2015-02-25T12:21:45 c   0.00  0.00  0.00  7509       root  100356  100388    3956    3960    88     716     520       0      0      0      1 sshd: aminamid [priv]
2015-02-25T12:21:45 c   0.00  0.00  0.00  7511   aminamid  100356  100360    1876    1876    88     716     520       0      0      0      1 sshd: aminamid@pts/0
2015-02-25T12:21:47 c   0.00  0.00  0.00  1305       root   66608   66612     624    1240    88     532     520     616      0      0      1 /usr/sbin/sshd
2015-02-25T12:21:47 c   0.00  0.00  0.00  1473       root 1024096 1089632   10568   12176    88  773148    1396    1964      0      0     11 libvirtd --daemon
2015-02-25T12:21:47 c   0.00  0.00  0.00  7509       root  100356  100388    3956    3960    88     716     520       0      0      0      1 sshd: aminamid [priv]
2015-02-25T12:21:47 c   0.00  0.00  0.00  7511   aminamid  100356  100360    1876    1876    88     716     520       0      0      0      1 sshd: aminamid@pts/0
```
