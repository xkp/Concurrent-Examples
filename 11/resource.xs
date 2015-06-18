concurrent class resource
{
    [Blocking]
    public int read()
    {
        if (_writing)
            await writing_done;
                        
        return _value++;        
    }

    bool _writing = false;
    int _value = 0;                    

    [Blocking]
    public void write()
    {
        console.write("writing at: " + _value);
        _writing = true;
        await wait(sec: rand(0.5, 1));
        _writing = false;
                        
        console.write("finished writing at: " + _value);
        writing_done();        
    }

    private void writing_done();
}