# IntelligentHome
UNIVAQ Software Engineering For Autonomous System Project

The project simulates a SmartHome through a set of OSGi modules that implements the MAPE-K feedback loop.

All the modules communicate using a set of MQTT queues and stores data into a postgres database schema.
There is also a simulation of an AI in the Planner module and all decisions are taken by a set of Javascript scripts - with ho reloading - 
that exposes Sensors and Actuators data. 

The included webapp allows users to change, add, etc scripts into the system and to look at historical with a chart module. This app
requires an appserver to run - Tested with Tomcat 8.5.x (port 8080)

The C# Windows app is a simulation of an House with various sensors and actuators you can interact with.
