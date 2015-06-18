concurrent class factorial
{
    static int buckets = 3;
    double main(int n)
    {
        double fact = 0;
        {fact = parallel<double>(n, 
            map: () => {
                var size = (int)(n/buckets);
                for(int i = 0; i < buckets; i++)
                {
                    int lower = i == 0? 1 : i * size + 1;
                    int upper = i == (buckets - 1)? n : (i + 1) * size;

                    yield return () => {
                        double result = 1;
                        for(int j = lower; j <= upper; j++)    
                            result *= j;
                                        
                        return result;
                    };                                
                }
            },
            reduce: (values) => {
                double result = 1;
                foreach(double value in values)
                    result *= value;
                return result;
            })
        }

        return fact;
    }
}