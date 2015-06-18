concurrent class barbershop
{
    barber _barber1, _barber2;
    bool _busy1, _busy2;
                    
    void main(barber b1, barber b2)
    {
        _barber1 = b1; _busy1 = false;
        _barber2 = b2; _busy2 = false;

        while(true)
            await visit;
    }

    [Blocking]
    public void visit(int client)
    {
        console.write("entered : " + client);
        if (_busy1 && _busy2)
            await next_client;

        if (!_busy1)
        {
            _busy1 = true;
            yield return _barber1.shave(client)
                -> barber_free(_barber1);
        }

        if (!_busy2)
        {
            _busy2 = true;
            yield return _barber2.shave(client)
                -> barber_free(_barber2);
        }
    }

    private void next_client();
    private void barber_free(barber which)
    {
        double tip = rand(5, 10);
        which.tip(tip);
        if (which == _barber1)
        {
            console.write("barber 1 finished");
            _busy1 = false;
        }
        else 
        {
            console.write("barber 2 finished");
            _busy2 = false;
        }

        next_client();
    }
}