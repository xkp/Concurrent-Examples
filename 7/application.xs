var names = ["Kant", "Archimedes", "Nietzche", "Plato", "Engels"];
var count = names.Length;

var philosophers = spawn<philosopher>(count).ToArray();
var chopsticks   = spawn<chopstick>(count).ToArray();

foreach (var chopstick in chopsticks)
    start(chopstick);

for (var i = 0; i < count; i++)
{
    var left = chopsticks[i];
    var right = i == count - 1 ? chopsticks[0] : chopsticks[i + 1];
    start(philosophers[i], names[i], left, right);
}