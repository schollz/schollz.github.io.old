---
title: "How many ice cubes?"
date: 2015-03-14T09:43:35-06:00
slug: ice-cubes
---

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$'], ['\\(','\\)']],
    displayMath: [['$$','$$'], ['\[','\]']],
    processEscapes: true,
    processEnvironments: true,
    "HTML-CSS": { 
         linebreaks: { automatic: true }
    },
    SVG: { 
         linebreaks: { automatic: true } 
    },
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
    TeX: { equationNumbers: { autoNumber: "AMS" },
         extensions: ["AMSmath.js", "AMSsymbols.js"] }
  }
});
</script>

<script type="text/x-mathjax-config">
  MathJax.Hub.Queue(function() {
    // Fix <code> tags after MathJax finishes running. This is a
    // hack to overcome a shortcoming of Markdown. Discussion at
    // https://github.com/mojombo/jekyll/issues/199
    var all = MathJax.Hub.getAllJax(), i;
    for(i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
    }
});
</script>


How many ice cubes do you need to *quickly* cool down a hot beverage to its perfect drinking temperature?

Coffee is initially at a temperature of 82°C. Tea has a similar high, undrinkable, temperature. The perfect drinking temperature is 60°C. Lets use physics to find the exact number of ice cubes to drop into a scalding hot cup of coffee or tea to make it the perfect temperature.

## The beverage

The hot beverage must lose a certain amount of energy in order to decrease its temperature to a warm temperature. The energy of heat loss is given by a difference of temperature. The equation is

<p>
$$\Delta H_{beverage} = c_{water} \times m_{beverage} \times \Delta T_{hot-to-warm}$$
</p>

<p>
The specific heat of water, $c_{water}$ is 4.2 $J / g / °C$. The mass of a typical cup of coffee or tea, $m_{beverage}$  is 473 grams. The change in temperature is $82°C - 60°C = 22°C$.
</p>

## The ice

Ice melts by absorbing heat, or energy. The heat absorbed by ice is given by

<p>$$ \Delta H_{ice} = m_{ice} \times H_{fusion}$$</p>

<p>
where $H_{fusion}$ is the enthalpy of fusion for ice, which is 334 $J/g$. Enthalpy of fusion is simply the amount of energy that will be needed to transform ice into cold water.
</p>

<p>
Once the ice changes into cold water, it will begin to warm up, by absorbing heat from the beverage. As before, the water will absorb according to the equation 

$$\Delta H_{ice-water} = c_{water} \times m_{ice} \times \Delta T_{cold-to-warm}$$ 
In this case, the change in temperature, $\Delta T = 60°C - 0°C = 60°C$.
</p>

## The beverage + ice

<p>
When we reach equilibrium, it means that the total energy lost by the beverage equals the sum of the energy of the ice and the cold water (once the ice has transformed), $\Delta H_{beverage}= \Delta H_{ice-water} + \Delta H_{ice}$. When we plug in the equations above we get
</p>
$$
c_{water} \times m_{beverage} \times \Delta T_{hot-to-warm} = m_{ice} \times H_{fusion} \\
+ c_{water} \times m_{ice} \times \Delta T_{cold-to-warm}
$$
<p>
The only unknown is the mass of the ice, $m_{ice}$, which we can solve for to get
</p>
$$
m_{ice} = \frac{c_{water} \times m_{beverage} \times \Delta T_{hot-to-warm}}{\Delta H_{fusion} + c_{water} \times \Delta T_{cold-to-warm}}
$$
<p>
which after plugging in the above numbers gives
$$
m_{ice} = 75 g
$$
</p>

## How many ice cubes do you need? 

**Five**. An ice cube weighs about 16 $g$, so 75 $g$ of ice would require about five ice cubes.

Another question to be considered now is: *how strong to make the beverage because you are diluting it?* I will leave that up to you.