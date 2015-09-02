# DrinkMoreWater Backend

API server for [DrinkWaterApp](https://itunes.apple.com/us/app/drinkwaterapp/id916242075?mt=8). Goal for this project was to experiment with alternative Ruby web servers stack.

Technologies:

* [Sinatra](https://github.com/sinatra/sinatra) as a backbone of the app
* [Sequel](https://github.com/jeremyevans/sequel) for database operations
* [Virtus](https://github.com/solnic/virtus) for writing better models

Ideas:

* Make data persistence "implementation detail"
* Use separate layer to model business interactions with the system

Rails influence:

I intentionally tried to achieve some similarity to Rails, mostly in folders structure. I wanted to feel Rails flavour but use way more lighter Sinatra gem.