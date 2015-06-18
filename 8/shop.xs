concurrent class shop
{
    santa _santa;
    int   _reindeer = 0;
    int   _elves    = 0;
    void main(santa s)
    {
        _santa = s;
                        
        {reindeer() & elves()}
    }

    [Forever]
    public void reindeer()
    {
        console.write("reindeer: back from vacation");
        _reindeer++;

        if (_reindeer == 8)
        {
            await _santa.reindeer();
            _reindeer = 0;
        }

        {wait(sec: rand(2, 3))}
    }

    [Forever]
    public void elves()
    {
        console.write("elf: need santa");
        _elves++;
        if (_elves == 3)
        {
            await _santa.elves();
            _elves = 0;
        }

        {wait(sec: rand(1, 2))}
    }
}