# DrinkMoreWater 2.0 Backend

API server for [DrinkWaterApp](https://itunes.apple.com/us/app/drinkwaterapp/id916242075?mt=8).

Goal for this project was to experiment with [Hanami](https://github.com/hanami/hanami) Ruby web servers stack.


## DrinkMoreWater 1.0 Backend
Previous version of API can be find on [sinatra-sequel](https://github.com/kubenstein/DrinkMoreWaterBackend/tree/sinatra-sequel) branch

Technologies:

* [Sinatra](https://github.com/sinatra/sinatra) as a backbone of the app
* [Sequel](https://github.com/jeremyevans/sequel) for database operations
* [Virtus](https://github.com/solnic/virtus) for writing better models

Ideas:

* Make data persistence "implementation detail"
* Use separate layer to model business interactions with the system

Rails influence:

I intentionally tried to achieve some similarity to Rails, mostly in folders structure. I wanted to feel Rails flavour but use way more lighter Sinatra gem.