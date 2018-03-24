---
title: "Recurisve ingredients"
date: 2017-06-23T19:19:15-07:00
tags: [food, coding]
slug: recursive-ingredients
written: ["2017-06-23","2017-06","2017"]
---

What would happen if you made a recipe out of the ingredients for a recipe? What if you repeated this process over and over? I ended up doing this and generated the recipe that starts with the most basic ingredients - dirt, water and sun.


Here are the ingredients of my favorite recipe - a recipe for bread - that I have made almost every week during the past decade:

-   7 1/4 cup flour
-   3 1/2 teaspoon salt
-   3 1/4 cup water
-   1 tablespoon yeast

After thinking about this recipe almost a thousand times, and being inspired by a number of DIY cookbooks, [^1] [^2] [^3] I started wondering - *why don't I make flour?* and *why don't I extract my own salt?* Flour and salt are ingredients that I usually buy from the store. However, what would happen if I included the recipe for salt and flour in the recipe for bread? What would the ingredients and instructions look like, and how long would this elongated recipe take to make?

Ingredients are usually restricted to the foods we can buy at the store. Lets remove this restriction and investigate the ingredients of ingredients. In order not to get too far I will define "core ingredients" that are irreducible (we don't need to specify the number of Carbon atoms in a loaf of bread). Core ingredients include soil, sun, water, and living organisms (cow, yeast, chickens).

## Recipe recursion

In order to make bread from scratch,[^4] we can take each ingredient in the original ingredient list and generate a list of ingredients for that. We can then use [a mathematical concept known as "recursion"](https://en.wikipedia.org/wiki/Recursion) - *the process a procedure goes through when one of the steps of the procedure involves invoking the procedure itself*.

In order to iterate through the recipe as a recursive process, we need a recursive definition of a recipe. For my purposes I created a list of axioms which define the recipe:

1.  Recipes are ingredients.
2.  A recipe is composed of *reactants*, *products* and *instructions*. The *reactants* are a list of recipes needed to complete the reaction. The *products* are the recipes that result. The *instructions* explain the transformation (how much, how long, etc.)
3.  The same *reactants* and the same *instructions* always create the same *products* (note: the inverse is not necessarily true).

Using these axioms, I wrote a [document containing lists of various recipes](https://github.com/schollz/timetomakefood/blob/master/datav2/data.toml) which are known precursors to flour, salt, and many other foods.

## Ingredients to *really* make bread from scratch

*What is the recipe for flour?* It is basically grinding of wheat berries. *What is the recipe for wheat berries?* It is basically the winnowing of the grain from wheat. *What is the recipe for wheat berries?* ...

These are the questions that I asked myself over and over again to do a recursive replacement of ingredients in the bread recipe, until the final core ingredients were reached. After this process I obtained the following new list of ingredients:

-   Sun
-   Plot of soil
-   Water source
-   1 gallon seawater
-   3 1/4 cup water
-   1 tablespoon yeast

"Flour" has been replaced by "plot of soil, water source, and sun" to grow the wheat and "salt" has been replaced by "seawater." Of course, there is a process for converting these ingredients into the final loaf of bread, which can be visualized in the following:

![Visualization of the network for making bread. Ingredients are in green, intermediate foods are in yellow, and the final recipe is in red.](/img/bread-graph.png)

In the figure, it shows the ingredients (in red) and their intermediate products (in yellow) and the final recipe (in green). It turns out there is a good reason to buy flour at the store - there are a lot of steps and a lot of materials needed to create it! I bet it tastes good, though.

## Time to make bread from scratch


Of course, there is also a [set of instructions for each step in this graph (40 instructions total!)](http://timetomakefood.com/loaf-of-bread/bread-dough/salt/flour/wheat-berries/cured-wheat/field-of-wheat/). Each instruction carries with it the amount of time to create the necessary intermediate product:

-   Loaf of bread: 6 hours and 50 minutes
-   Salt: 2 weeks, 10 hours
-   Flour: Over 4 months

In total, then, making this loaf of bread *from the very core ingredients* will take **4 months, 3 weeks, 5 days, 14 hours, and 25 minutes** (which includes the intermediate processes for grinding and threshing wheat).

## Time to make food - the app

I started compiling similar recipes for cookies, tortillas, noodles and found it very interesting to peruse their recipes to the core ingredients.

**You can check out different recipes at the website I made with an app to calculate this automatically: [timetomakefood.com](https://timetomakefood.com).**

The tool is open-source, and you can edit the code and add your own recipes: [github.com/schollz/timetomakefood](https://github.com/schollz/timetomakefood).

I am glad grocery stores exist, because I like making bread every week, and not three times a year.

[^1]: Alana Chernila (2012). *The Homemade Pantry: 101 Foods You Can Stop Buying and Start Making.* Clarkson Potter/Publishers. ISBN 978-0-307-88726-9.

[^2]: Jennifer Reese (16 October 2012). *Make the Bread, Buy the Butter: What You Should and Shouldn't Cook from Scratch--Over 120 Recipes for the Best Homemade Foods.* Simon and Schuster. ISBN 978-1-4516-0588-4.

[^3]: Miyoko Schinner (16 June 2015). *The Homemade Vegan Pantry: The Art of Making Your Own Staples.* Potter/TenSpeed/Harmony. ISBN 978-1-60774-678-2.

[^4]: *Skip this section if you are not a nerd.*
