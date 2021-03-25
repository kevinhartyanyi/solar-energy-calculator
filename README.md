# Solar Energy Calculator

A simple app to calculate energy generation from solar radiation at specific coordinates.

## Getting Started

You can download the apk from the [releases](https://github.com/kevinhartyanyi/solar-energy-calculator/releases) tab or from [Google Play](https://play.google.com/store/apps/details?id=com.mdatanorm.solar_energy_calculator)

<a target='_blank' href='https://play.google.com/store/apps/details?id=com.mdatanorm.solar_energy_calculator'><img width='200' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/></a>

Or you can compile it yourself by downloading the code. To compile it you will need the [flutter sdk](https://flutter.dev/docs/get-started/install).



## Description

### Api
This app uses the https://re.jrc.ec.europa.eu/pvg_tools/en/ api. Which includes much more features than what is currently implemented into the app. 

The api contains radiation data for the following regions:
- Europe
- North America
- Africa
- Parts of Asia and South America

If you select a location where radiation data is not available, then the app will return a message informing you, that no data is available for that location.

### Calculations
You can find all the information about the data sources and calculation methods used in the api [here](https://ec.europa.eu/jrc/en/PVGIS/docs/methods) .

One calculation that is not included in the api is the CO2 reduction. For that calculation I use the following simple formula:
```
energy * 0.417305
```
where energy is in kWh. The value 0.417305 is based on the U.S. electricity generation in 2019,
which was 4.13 trillion kWh from all energy sources that resulted in the emission of 1.72 billion metric tons of CO2. 
This is approximately 0.417305 kg of CO2 emissions per kWh. [Source](https://www.eia.gov/tools/faqs/faq.php?id=74&t=11) 

### Features
- Calculate energy generation from solar radiation
- Option to specify the peak power of the panel
- Option to specify system loss
- Estimate the amount of money saved by using solar panels
- Estimate the time it takes to break even
- Approximate CO2 reduction
- Save calculations
- Dark mode

 

## Gallery
<p float="left">
  <img src="https://user-images.githubusercontent.com/37983153/111533164-c6673a80-8766-11eb-8954-4ea08e5bf219.jpg" width="200" />
  <img src="https://user-images.githubusercontent.com/37983153/111533321-f0b8f800-8766-11eb-9511-384d317c123f.jpg" width="200" /> 
  <img src="https://user-images.githubusercontent.com/37983153/111533323-f1518e80-8766-11eb-9dbb-2a354b7e49d6.jpg" width="200" />
  <img src="https://user-images.githubusercontent.com/37983153/111533324-f1518e80-8766-11eb-85c6-936d5e18d87f.jpg" width="200" />
</p>

<p float="left">
  <img src="https://user-images.githubusercontent.com/37983153/111533327-f1ea2500-8766-11eb-8232-1027fb1135c1.jpg" width="200" />
  <img src="https://user-images.githubusercontent.com/37983153/111533330-f282bb80-8766-11eb-9ba6-e0e490a9325f.jpg" width="200" /> 
  <img src="https://user-images.githubusercontent.com/37983153/111533333-f3b3e880-8766-11eb-83f0-14d6c0bfc127.jpg" width="200" />
  <img src="https://user-images.githubusercontent.com/37983153/111533334-f3b3e880-8766-11eb-9a8a-fa26b9527dff.jpg" width="200" />
</p>

## License

This project is licensed under the MIT License.
