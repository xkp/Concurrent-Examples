concurrent class philosopher 
{
    [Forever]
    void main(string name, chopstick left, chopstick right) 
    {
        _name  = name;
        _left  = left;
        _right = right;
                               
        {hungry()}
    }
	
    void hungry()
    {
        console.write(_name + " is hungry");

        try
        {
            await ((_left.acquire(this) & _right.acquire(this))
                  | timeout(sec: 2.1))
                      -> eat();
        }
        catch
        {
            console.write(_name + " livelock");
            _left.release(this);
            _right.release(this);
        }
    }
	
    void eat()
    {
        console.write(_name + " is eating");
	                    
        {wait(sec: 1.0)
            -> (_left.release(this) & _right.release(this))}

        console.write(_name + " is full");
    }
	                
    private string _name;
    private chopstick _left;
    private chopstick _right;
}