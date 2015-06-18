var shop = spawn<barbershop>();
var barber1 = spawn<barber>();
var barber2 = spawn<barber>();

start(barber1);
start(barber2);
start(shop, barber1, barber2);

var rand = new Random();
for (int i = 1; i <= 30; i++)
{
    Thread.Sleep((int)(3000*rand.NextDouble()));
    shop.visit(i);
}