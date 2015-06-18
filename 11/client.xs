concurrent class client
{
    resource _resource;
    void main(resource r)
    {
        _resource = r;
        {read() & write()}
    }

    [Forever]
    public void read()
    {
        await wait(sec: rand(0.2, 0.5));
        var result = 0;
        {result = _resource.read()}

        console.write("read: " + result);
    }

    [Forever]
    public void write()
    {
        await wait(sec: rand(1, 2));
        _resource.write();
    }
}