(
s.waitForBoot{
	fork{
		//VARIABLES
		var proc = NetAddr("127.0.0.1", 12321);
		//GROUPS/////////////////////////////
		s.sendMsg(\g_new, 300, 1, 1);
		//SYNTHDEFS//////////////////////
		SynthDef(\phasorclock, {
			arg dur=10.0, start=0, end=1, abus=99, kbus, t_tr=0, pos=0;
			var index, indexnorm;
			index = Phasor.ar( t_tr, 1.0/(44100.0*dur), start, end, pos );
			Out.ar(abus, index);
			Out.kr(kbus, index);
		}).add;
		//OSC DEFS//////////////////////////
		////Mechanism to grab control data
		//////This one sends msg to server, server replies with \c_set msg
		OSCdef( \getkdata, {
			arg msg;
			var kbus = msg[1].asInteger;
			s.sendMsg(\c_get, kbus);
		}, "/getkdata");
		//////This one receives \c_set msg w/control data from server and forwards to processing
		OSCdef( \kdat, {
			arg msg;
			var clknum = msg[1].asInteger;
			var val = msg[2].asFloat;
			proc.sendMsg("/kdat", clknum, val);
		}, \c_set);
		0.1.wait;
		//SYNTHS///////////////////////
		s.sendMsg(\s_new, \phasorclock, 5000, 0, 300, \abus, 50, \kbus, 0, \dur, 8);
	}
}
)

//Change Speed of Cursor On the Fly
s.sendMsg(\n_set, 5000, \dur, 8);
//Develop way to gradually speed up or slow down