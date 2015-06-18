concurrent class philosopher 
{
    [Forever]
    void main(string name, chopstick left, chopstick right) 
    {
        _name  = name;
        _left  = left;
        _right = right;
                               
        {think()}
    }
	
    void think()
    {
        console.write(_name + " is thinking");
        await wait(sec: rand(1.0, 2.0))
                        -> hungry();
    }

    void hungry()
    {
        console.write(_name + " is hungry");

        await (_left.acquire(this) & _right.acquire(this))
                         -> eat();
    }
	
    void eat()
    {
        console.write(_name + " is eating");
	                    
        await wait(sec: rand(1.0, 2.0))
                        -> (_left.release(this) & _right.release(this));

        console.write(_name + " is full");
    }
	                
    private string _name;
    private chopstick _left;
    private chopstick _right;
}