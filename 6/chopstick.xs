concurrent class chopstick
{
    [Forever]
    void main()
    {
        {acquire | release}
    }

    public void acquire(object owner)
    {
        if (_owner != null)
        {
            await release;
        }
                                
        _owner = owner;
    }
	
    public void release(object owner)
    {
        if (_owner != owner)
            throw new InvalidOperationException();

        _owner = null;
    }

    private object _owner;
}