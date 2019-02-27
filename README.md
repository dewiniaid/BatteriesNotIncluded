# Batteries Not Included

Batteries Not Included is a different take on electric vehicle mods.  Rather than using equipment grids and/or wireless
charging, it operates on the premise of quickly-swappable batteries that can be recharged at a dedicated charging 
station.

This internally uses a similar mechanism to that of uranium fuel cells and nuclear reactors.  You insert battery packs
 into electric trains and -- when they're drained -- they produce empty battery packs which can then be removed and
 brought to a charging station.
 
The end goal for this mod is to provide alternatives to solid fuel and rocket fuel in trains which take advantage of
capabilities commonly found in electric engines (such as rapid acceleration).  These benefits are intended to be 
balanced out by both production costs and the logistics overhead of setting up a charging infrastructure.

## HELP WANTED

All of the art in this mod is currently placeholder graphics and/or my terrible paint.net skills.  Contributions to 
 making it less ugly are welcome.
  
Discussions about balance are also welcome!  Find me on Discord or the forums.
  
## Battery Packs

To get started, you'll need to make at least one battery pack (probably much more).  Begin by researching
"Heavy-Duty Battery Packs", which requires research in batteries, electric energy accumulators and electric energy
 distribution 2.  
 
 After that, you can create drained battery packs.  Wait, drained?  Yes.  Before you can actually use 
   your shiny new battery pack, you'll need to charge it.  This requires a Charging Station (which currently 
   looks suspiciously like a blue accumulator -- did you see HELP WANTED?) -- insert a drained battery pack into a charging station, wait for awhile, and a 
   charged battery pack comes out.
   
**Note**: Other than drain, the power usage for charge stations (both types!) actually matches up with how power is
going into a battery being charged. 

## Electric Locomotives

You'll need Electric Locomotives to be able to use Battery Packs.  Note that they only hold 20 battery packs (batteries
have far worse energy density than fossil fuels).  You can insert battery packs into locomotives just like fuel in a
regular locomotive, and remove empty battery packs as well.  Inserters won't remove full battery packs.

## High-Performance Battery Packs

These fancy gold-label batteries hold more power and offer substantially increased vehicle performance.  Of course, 
this means more charging time...

## Rapid Charging Stations

Charge batteries, faster.

## Known Issues

* Placeholder graphics are terrible.  Did you read HELP WANTED?
  
* Balance needs work.  Did you read HELP WANTED?!

## Unknown Issues
   
Found a bug?  Please visit the [Issues page](https://github.com/dewiniaid/BatteriesNotIncluded/issues) to see if it has 
already been reported, and report it if not.

## Changelog

### 0.2.0 (2019-02-26)
* Updated for Factorio 0.17

### 0.1.4 (2018-10-08)
* Added German translations.  Thanks to MrBesen and SuperSandro2000 for contributing.
* Partially-depleted batteries are no longer completely lost when mining a vehicle and are returned in the form of
  a fully-depleted battery instead.
* Increased amount of cables, circuits and advanced circuits required for making charging stations.
* Support QuickItemSwap natively. (QIS already supports Batteries Not Included, so this change should be invisible.)

### 0.1.3 (2017-12-23)
* Rapid Charging Station rebalanced: Now requires 15 advanced processing units (reduced from 20), has 250% speed (increased from 200), and 80% efficiency (reduced from 100%).
* Charging stations no longer produce drain.

### 0.1.2 (2017-12-14)
* Fixed the Electric Locomotive being available without research.  (It's useless without the research for battery packs anyways).
* Fixed Heavy Duty Battery Packs to require Electric Energy Distribution 1 instead of Electric Energy Distribution 2.  It no longer is a green science recipe depending on a blue science recipe.
* Renamed "Heavy Duty Battery Packs" technology to "Battery Packs".  Heavy-Duty Battery Packs may appear in another incarnation in the future.
* Removed research dependency on batteries, since it is implied by also depending on Accumulators.
* Support Factorio 0.16 native changelog features.

### 0.1.1 (2017-12-13)
* Update for Factorio 0.16
* Temporarily remove support for QuickItemSwap to work around [a bug in the current Factorio experimental](https://forums.factorio.com/viewtopic.php?f=182&t=54567&p=321491).  To counteract this, support is now provided in QuickItemSwap itself. 

### 0.1.0 (2017-12-11)
* First release.

