concurrent class barber
{
    [Forever]                        
    void main()
    {
        {shave -> tip}
    }

    public void shave(int client)
    {
        await wait(sec: rand(1, 2));
    }

    double _tip = 0;
    public void tip(double amount)
    {
        _tip += amount;
        console.write("tipped: " + amount.ToString("C2") + " total: " + _tip.ToString("C2"));
    }
}