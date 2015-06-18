concurrent class reindeer
{
    santa _santa;
    string _name;                    

    [Forever]    
    void main(santa s, string name)
    {
        _santa = s;
        _name = name;
 
        {vacation()}
    }

    public void unharness()
    {
        console.write(_name + ": job well done");
    }

    private void vacation()
    {
        await wait(sec: rand(3, 7))
                -> console.write(_name + ": back from vacation")
                -> (_santa.reindeer_back(this) & unharness);
    }
}

concurrent class elf
{
    santa _santa;
    string _name;                    

    [Forever]    
    void main(santa s, string name)
    {
        _santa = s;
        _name = name;
                        
        {work()}
    }

    public void advice(bool given)
    {
        if (given)
            console.write(_name + ": great advice, santa!");
        else 
            console.write(_name + ": too bad santa had to go");
    }

    private void work()
    {
        try
        {
            await wait(sec: rand(1, 5))
                    -> console.write(_name + ": Off to see Santa")
                    -> (_santa.elf_request(this) & advice);
        }
        catch(InvalidOperationException e)
        {
            console.write(_name + ": Santa's busy, back to work! ");
        }
    }
}