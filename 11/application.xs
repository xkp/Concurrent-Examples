var resource = spawn<resource>();
var clients = spawn<client>(5);

start(resource);
foreach(var client in clients)
    start(client, resource);