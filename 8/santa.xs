concurrent class santa
{
    bool _delivering = false;
    bool _helping = false;
                    
    public void reindeer()
    {
        _delivering = true;
        if (!_helping)
            await deliver();    
    }

    public void elves()
    {
        if (_delivering)
        {
            console.write("elves: nobody home, back to work!");
            return;
        }

        console.write("santa: hey guys, need help?");
                        
        _helping = true;
        await wait(sec: rand(1, 2)) | reindeer;
                        
        _helping = false;
        if (_delivering)
        {
            console.write("santa: sorry fellows, got toys to deliver!");
            await deliver();
        }
        else
            console.write("elves: great advice santa!");
    }
                    
    private void deliver()
    {
        console.write("santa: Off to deliver toys!");
        {wait(sec: rand(5, 7))}
        console.write("santa: Merry Christmas, enjoy the toys!");
                        
        _delivering = false;
    }
}