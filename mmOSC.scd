a = NetAddr("127.0.0.1", 12321);

a.sendMsg("/mkcursor", 0);


a.sendMsg("/savecrv", "test1014");
a.sendMsg("/savecrv", "squig002");
a.sendMsg("/savecrv", "updown");
a.sendMsg("/savecrv", "downup");
a.sendMsg("/savecrv", "plateaus001");
a.sendMsg("/savecrv", "midsquig001");
a.sendMsg("/savecrv", "risingsquig001");
a.sendMsg("/savecrv", "fallingsquig001");
a.sendMsg("/loadcrv", "squig001", 1);
a.sendMsg("/loadcrv", "squig001", 0);
a.sendMsg("/loadcrv", "squig00", 0);
a.sendMsg("/loadcrv", "plateaus001", 1);
a.sendMsg("/loadcrv", "updown", 1);
a.sendMsg("/mkdrwcrvs", 1, "downup", 0, "purple");

a.sendMsg("/mkdrwcrvs", 0, "risingsquig001", 1, "dodgerblue");


a.sendMsg("/mkcrvfollower", 1, 0, 0);
a.sendMsg("/mkcrvfollower", 2, 0, 1);