---
title: "Average chocolate chip cookies"
date: 2018-03-23T20:57:15-07:00
tags: [food, coding]
slug: average-cookies
written: ["2018-03-23","2018-03","2018"]
---

I recently wrote [a program to determine consensus recipes](/consensus-cookery/). It scrapes the web for a thousand recipes for a given recipe (e.g. cookies), then clusters the recipes and finally computes an average ingredient list for each cluster. This idea was prompted by making brownies, because I wasn't sure whether to use cocoa, chocolate, or both. Turns out there is a recipe for each variation.

I decided to try out my software in the real world. What would an average recipe taste like? I computed the average recipes for "chocolate chip cookies" and took the second largest cluster because it had both baking powder and baking soda.

**An average chocolate chip cooke recipe:**

|   Ingredient  |   Amount  | Variation | Rel. Freq. |
|---------------|-----------|-----------|------------|
| baking powder |   1 tsp   |  ± 1 3/8  |     95     |
|  baking soda  |  3/4 tsp  |   ± 3/8   |     75     |
|  brown sugar  |  7/8 cup  |   ± 3/8   |     99     |
|     butter    |  5/8 cup  |   ± 1/2   |     97     |
|   chocolate   |   1 cup   |   ± 5/8   |    109     |
|      eggs     |  2 whole  |   ± 3/4   |    105     |
|     flour     | 1 1/4 cup |   ± 7/8   |    116     |
|      salt     |  5/8 tsp  |   ± 1/2   |     86     |
|     sugar     |  3/8 cup  |   ± 1/4   |    100     |
|    vanilla    | 1 5/8 tsp |  ± 3 1/8  |    100     |

I used my standard techniques for baking to mix up the ingredients - first mixing wet and then adding dry ingredients and then baking for 10-15 minutes at 350F. They turned out to be much more like cake than cookies. Apparently there was too much baking powder and the ratio of liquid to dry ingredients was too high. They also tasted too sugary. They weren't bad, but they weren't great, so I think they would qualify as *average cookies*.

![Average cookies I made from my code results](/img/cookies.jpg)

I think part of the problem was that I had trouble converting ingredients to volumes for normalization. Some recipes dictate their recipes in "grams" or "ounces" which need to be converted to volume using the density. In this version I used a constant density for everything (0.9 g / ml) which was somewhat between the density for flour and water. However the density for flour (0.6 g / ml) is much lower than the density for water (1 g / ml) and butter (0.9 g / ml).

When I modified the densities, it indeed changed the flour to  1 3/4 cup instead of 1 1/4 cup, and reduced the variation from 7/8 cup to 1/2 cup. Next time I think I'd like to make the biggest cluster - i.e. the most popular recipe, which doesn't use baking powder. Here's that recipe:


|  Ingredient |   Amount  | Variation | Rel. Freq. |
|-------------|-----------|-----------|-----------|
| baking soda |  7/8 tsp  |   ± 3/8   |     97     |
| brown sugar |  3/4 cup  |   ± 1/4   |     91     |
|    butter   |  3/4 cup  |   ± 3/8   |     99     |
|  chocolate  | 1 3/8 cup |   ± 5/8   |    105     |
|     eggs    |  2 whole  |   ± 1/2   |    103     |
|    flour    |   2 cup   |   ± 1/2   |     96     |
|     salt    |  5/8 tsp  |   ± 3/8   |     89     |
|    sugar    |  1/2 cup  |   ± 1/4   |     94     |
|   vanilla   | 1 1/4 tsp |  ± 2 1/8  |     98     |

In this case the flour seems a lot more reasonable too (2 cups). I'd be interested in trying this recipe, instead. 

If you'd like to generate your own check out [the source on Github](https://github.com/schollz/consensus-cookery).