SynthDef(\tactus, {
	arg obs,kobs, atk=0.1, rel=0.25, crv= -4, gate=0;
	var sig = EnvGen.ar(Env.asr(atk,1.0,rel,crv),gate, doneAction:2);
	sig.poll;
	Out.ar(obs,sig);
	Out.kr(kobs,sig);
}).add;

s.sendMsg(\g_new, 2000);
s.sendMsg(\s_new, \tactus, 3000, 0, 2000, \obs,50, \kobs, 0, \atk, 0.1, \rel, 0.25,\gate, 1);
s.sendMsg(\n_set, 3000, \gate, 1);
s.sendMsg(\n_set, 3000, \gate, 0);
s.sendMsg(\n_free, 3000);

s.queryAllNodes