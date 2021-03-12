const peakPowerInfo = """
This is the power that the manufacturer declares that the panel can produce **under standard test conditions**.


What are these standard conditions?
+ solar radiation of **1,000 watts/m²**
- an ambient temperature of **25°C**
- a **clear sky**, around noon for example

You can find this information in the panel's description under *peak power* or *maximum power*.
""";
//If you do not know the declared peak power of your modules but instead know the area of the modules and the declared conversion efficiency (in percent), you can calculate the peak power as power = (area * efficiency / 100).

const systemLossInfo = """
The estimated **system losses** are all the losses in the system, which cause the power actually delivered to the electricity grid to be lower than the power produced by the solar panels. 

There are several causes for this loss, such as losses in **cables**, **power inverters**, **dirt** (sometimes **snow**) on the panels and so on. Over the years the panels also tend to lose a bit of their power, so the average yearly output over the lifetime of the system will be a few percent lower than the output in the first years.

We have given a default value of **14%** for the overall losses. If you have a good idea that your value will be different (maybe due to a really high-efficiency inverter) you may reduce this value a little. 
""";

const costInfo = """
This is used for calculating the amount of time that you would need to **break even**.

You should include the **sum of all costs** that you might have including system components (panel modules, mounting, inverters, cables etc.) and installation costs (planning, installation....).

You can use any currency, just keep it consistent with the **electricity price**
""";

const amountInfo = """
The number of solar panels that you want to calculate with.
""";

const electricityPriceInfo = """
This is used for calculating the **money saved** by using the solar panel(s).

You should input the amount that you would pay for **1 kWh**. (For example, in the US the average price is 12 cents/1 kWh)

You can use any currency, just keep it consistent with the **costs**.
""";
