var santa = spawn<santa>();
var reindeer = spawn<reindeer>( 8).ToArray();
var elves = spawn<elf>( 10).ToArray();

var rnames = ["Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Dunder", "Rudolph"];
var enames = ["Alabaster", "Bushy", "Pepper", "Shinny", "Sugarplum", "Wunorse", "Buddy", "Kringle", "Tinsel", "Jangle"];

start(santa);

for(var i = 0; i < rnames.Length; i++)
    start(reindeer[i], santa, rnames[i]);

for (var i = 0; i < enames.Length; i++)
    start(elves[i], santa, enames[i]);