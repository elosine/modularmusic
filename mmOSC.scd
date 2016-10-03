a = NetAddr("127.0.0.1", 12321);
a.sendMsg("/savecrv", "squig001");
a.sendMsg("/loadcrv", "squig001", 1);
a.sendMsg("/loadcrv", "squig001", 0);