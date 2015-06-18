concurrent class santa
{
    List<reindeer> _reindeer = new List<reindeer>();
    List<elf>      _elves = new List<elf>();
                    
    private bool isDelivering { get {return _reindeer.Count == 8;} }
                    
    public void reindeer_back(reindeer r)
    {
        _reindeer.Add(r);
        if (isDelivering)
        {
            await cancel_elves();

            console.write("Santa: Off to deliver toys!");
            await wait(sec:rand(5, 10));
            console.write("Santa: Merry Christmas, enjoy the toys!");

            foreach(var rd in _reindeer)
                rd.unharness();

            _reindeer.Clear();
        }
    }

    public void elf_request(elf e)
    {
        if (isDelivering)
            await reindeer_back;

        _elves.Add(e);
        if (_elves.Count == 3)
        {
            console.write("Santa: hey guys, need help?");
            await wait(sec: rand(1, 2)) | cancel_elves;

            if (isDelivering)
                console.write("Santa: sorry fellows, got toys to deliver!");
            else
                console.write("Santa: Good to see you, little fellas!");

            foreach(var el in _elves)
                el.advice(!isDelivering);

            _elves.Clear();
        }    
    }

    private void cancel_elves();
}