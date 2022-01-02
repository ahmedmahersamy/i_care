
# Data Description
>Data Expo 2009 - Airline on-time performance (http://ww2.amstat.org/sections/graphics/datasets/DataExpo2009.zip)

>This dataset reports flights in the United States, including carriers, arrival and departure delays, and reasons for delays, from 1987 to 2008.
>The data consists of flight arrival and departure details for all commercial flights within the USA, from October 1987 to April 2008. This is a large dataset: there are nearly 120 million records in total, and takes up 1.6 gigabytes of space compressed and 12 gigabytes when uncompressed.I take a random sample every year about 10000 records x 22 years 

### Question(s) for Analysis
<ol>
        <li> What is the count cancelled of Flights for every year?</li>
        <li> What is average arrival delay times (of delayed flights) by airline?</li>
        <li> What is Airline On-Time Performance and Delay/Cancellation Percentages?</li>
        <li> What is the ratio of canceled flights and diverted flights?</li>
        <li> When is the best time of day/day of week/time of year to fly to minimise delays?</li>
        <li> Waht is  the avarage distance for every city?</li>
        <li> How does the departure & arrival delay look like for every carrier?</li>
        <li>Which carrier is the most reliable in terms of cancellations?</li>
        <li> What is fit a logistic regression model to predict if an individual is Cancelled using `CarrierDelay`, `WeatherDelay`, `NASDelay`, `SecurityDelay`,`LateAircraftDelay`
 </li>
</ol>

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Year</th>
      <th>Month</th>
      <th>DayofMonth</th>
      <th>DayOfWeek</th>
      <th>DepTime</th>
      <th>CRSDepTime</th>
      <th>ArrTime</th>
      <th>CRSArrTime</th>
      <th>UniqueCarrier</th>
      <th>FlightNum</th>
      <th>...</th>
      <th>TaxiIn</th>
      <th>TaxiOut</th>
      <th>Cancelled</th>
      <th>CancellationCode</th>
      <th>Diverted</th>
      <th>CarrierDelay</th>
      <th>WeatherDelay</th>
      <th>NASDelay</th>
      <th>SecurityDelay</th>
      <th>LateAircraftDelay</th>
    </tr>
  </thead>
  <tbody>


Actual Arrival Times	Gate arrival time is the instance when the pilot sets the aircraft parking brake after arriving at the airport gate or passenger unloading area.Â  If the                         parking brake is not set, record the time for the opening of the passenger door.Â  Also, carriers using a Docking Guidance System (DGS) may record the                           official gate-arrival time when the aircraft is stopped at the appropriate parking mark.
          
Actual Departure Times	Gate departure time is the instance when the pilot releases the aircraft parking brake after passengers have loaded and aircraft doors have been closed.Â                         In cases where the flight returned to the departure gate before wheels-off time and departed a second time, report the last gate departure time before                           wheels-off time.Â  In cases of an air return, report the last gate departure time before the gate return.Â  If passengers were boarded without the                               parking brake being set, record the time that the passenger door was closed. Â Also, carriers using a Docking Guidance System may record the official                             gate-departure time based on aircraft movement. Â For example, one DGS records gate departure time when the aircraft moves more than 1 meter from the                             appropriate parking mark within 15 seconds.Â  Fifteen seconds is then subtracted from the recorded time to obtain the appropriate out time.
          
Airline ID	An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation. Use this field for analysis across a range of years.
Airport Code	A three character alpha-numeric code issued by the U.S. Department of Transportation which is the official designation of the airport. The airport code is not always unique to a specific airport because airport codes can change or can be reused.
Airport ID	An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
Arrival Delay	Arrival delay equals the difference of the actual arrival time minus the scheduled arrival time. A flight is considered on-time when it arrives less than 15 minutes after its published arrival time.
CRS	Computer Reservation System. CRS provide information on airline schedules, fares and seat availability to travel agencies and allow agents to book seats and issue tickets.
Cancelled Flight	A flight that was listed in a carrier's computer reservation system during the seven calendar days prior to scheduled departure but was not operated.
Carrier Code	Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique.
Certificate Of Public Convenience And Necessity	A certificate issued to an air carrier under 49 U.S.C. 41102, by the Department of Transportation authorizing the carrier to engage in air transportation.
Certificated Air Carrier	An air carrier holding a Certificate of Public Convenience and Necessity issued by DOT to conduct scheduled services interstate. Nonscheduled or charter operations may also be conducted by these carriers. (same as Certified Air Carrier)
Certified Air Carrier	An air carrier holding a Certificate of Public Convenience and Necessity issued by DOT to conduct scheduled services interstate. Nonscheduled or charter operations may also be conducted by these carriers. (same as Certificated Air Carrier)
City Market ID	An identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.
Departure Delay	The difference between the scheduled departure time and the actual departure time from the origin airport gate.
Diverted Flight	A flight that is required to land at a destination other than the original scheduled destination for reasons beyond the control of the pilot/company.
Domestic Operations	All air carrier operations having destinations within the 50 United States, the District of Columbia, the Commonwealth of Puerto Rico, and the U.S. Virgin Islands.
Elapsed Time	The time computed from gate departure time to gate arrival time.
FIPS	Federal Information Processing Standards. Usually referring to a code assigned to any of a variety of geographic entities (e.g. counties, states, metropolitan areas, etc). FIPS codes are intended to simplify the collection, processing, and dissemination of data and resources of the Federal Government.
Flight Number	A one to four character alpha-numeric code for a particular flight.
In-Flight Time	The total time an aircraft is in the air between an origin-destination airport pair, i.e. from wheels-off at the origin airport to wheels-down at the destination airport.
Late Flight	A flight arriving or departing 15 minutes or more after the scheduled time.
Passenger Revenues	Revenues from the air transportation of passengers.
Scheduled Departure Time	The scheduled time that an aircraft should lift off from the origin airport.
Scheduled Time Of Arrival	The scheduled time that an aircraft should cross a certain point (landing or metering fix).
Taxi-In Time	The time elapsed between wheels down and arrival at the destination airport gate.
Taxi-Out Time	The time elapsed between departure from the origin airport gate and wheels off.
Unique Carrier	Unique Carrier Code. It is the Carrier Code most recently used by a carrier. A numeric suffix is used to distinguish duplicate codes, for example, PA, PA (1), PA (2). Use this field to perform analysis of data reported by one and only one carrier.
World Area Code (WAC)	Numeric codes used to identify geopolitical areas such as countries, states (U.S.), provinces (Canada), and territories or possessions of certain countries. The codes are used within the various data banks maintained by the Office of Airline Information (OAI) and are created by OAI.
          
          
<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Year</th>
      <th>Month</th>
      <th>DayofMonth</th>
      <th>DayOfWeek</th>
      <th>DepTime</th>
      <th>CRSDepTime</th>
      <th>ArrTime</th>
      <th>CRSArrTime</th>
      <th>FlightNum</th>
      <th>ActualElapsedTime</th>
      <th>...</th>
      <th>Distance</th>
      <th>TaxiIn</th>
      <th>TaxiOut</th>
      <th>Cancelled</th>
      <th>Diverted</th>
      <th>CarrierDelay</th>
      <th>WeatherDelay</th>
      <th>NASDelay</th>
      <th>SecurityDelay</th>
      <th>LateAircraftDelay</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>...</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
      <td>219774.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>1997.502152</td>
      <td>6.711158</td>
      <td>15.744519</td>
      <td>3.943005</td>
      <td>1348.220397</td>
      <td>1333.890829</td>
      <td>1493.122064</td>
      <td>1489.294821</td>
      <td>1269.664692</td>
      <td>118.835624</td>
      <td>...</td>
      <td>694.925453</td>
      <td>6.394189</td>
      <td>15.057632</td>
      <td>0.018660</td>
      <td>0.002407</td>
      <td>3.684090</td>
      <td>0.796257</td>
      <td>4.080690</td>
      <td>0.024824</td>
      <td>4.792424</td>
    </tr>
    <tr>
      <th>std</th>
      <td>6.343756</td>
      <td>3.485052</td>
      <td>8.782524</td>
      <td>1.989349</td>
      <td>471.484529</td>
      <td>476.102868</td>
      <td>491.560838</td>
      <td>492.867681</td>
      <td>1303.096990</td>
      <td>67.319189</td>
      <td>...</td>
      <td>545.706803</td>
      <td>16.867218</td>
      <td>8.376344</td>
      <td>0.135322</td>
      <td>0.049002</td>
      <td>9.667764</td>
      <td>4.770863</td>
      <td>7.595746</td>
      <td>0.446194</td>
      <td>9.412188</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1987.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>0.000000</td>
      <td>1.000000</td>
      <td>0.000000</td>
      <td>1.000000</td>
      <td>3.000000</td>
      <td>...</td>
      <td>11.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>1992.000000</td>
      <td>4.000000</td>
      <td>8.000000</td>
      <td>2.000000</td>
      <td>939.000000</td>
      <td>930.000000</td>
      <td>1122.000000</td>
      <td>1115.000000</td>
      <td>435.000000</td>
      <td>70.000000</td>
      <td>...</td>
      <td>304.000000</td>
      <td>4.000000</td>
      <td>11.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>3.684010</td>
      <td>0.796138</td>
      <td>4.080364</td>
      <td>0.024820</td>
      <td>4.791959</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1998.000000</td>
      <td>7.000000</td>
      <td>16.000000</td>
      <td>4.000000</td>
      <td>1341.000000</td>
      <td>1325.000000</td>
      <td>1509.000000</td>
      <td>1519.000000</td>
      <td>885.000000</td>
      <td>102.000000</td>
      <td>...</td>
      <td>539.000000</td>
      <td>6.394364</td>
      <td>15.057433</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>3.684010</td>
      <td>0.796138</td>
      <td>4.080364</td>
      <td>0.024820</td>
      <td>4.791959</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>2003.000000</td>
      <td>10.000000</td>
      <td>23.000000</td>
      <td>6.000000</td>
      <td>1732.000000</td>
      <td>1726.000000</td>
      <td>1911.000000</td>
      <td>1911.000000</td>
      <td>1626.000000</td>
      <td>149.000000</td>
      <td>...</td>
      <td>931.000000</td>
      <td>6.394364</td>
      <td>15.057433</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>3.684010</td>
      <td>0.796138</td>
      <td>4.080364</td>
      <td>0.024820</td>
      <td>4.791959</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2008.000000</td>
      <td>12.000000</td>
      <td>31.000000</td>
      <td>7.000000</td>
      <td>2519.000000</td>
      <td>2359.000000</td>
      <td>2630.000000</td>
      <td>2400.000000</td>
      <td>9584.000000</td>
      <td>1637.000000</td>
      <td>...</td>
      <td>4962.000000</td>
      <td>1452.000000</td>
      <td>286.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>1039.000000</td>
      <td>935.000000</td>
      <td>389.000000</td>
      <td>104.000000</td>
      <td>492.000000</td>
    </tr>
  </tbody>
</table>
<p>8 rows × 24 columns</p>
</div>


# Conclusion

>From the above findings, and after investigating and plotting the correlation matrix between the variables, we deduced That:

>Most of the flights not diverted (only 0.24%).

>The most cancellation flights were due to the carrier and weather reasons.

>Los Angeles International Airport. followed by San Francisco International Airport. has the most delayed flights and American Airlines Inc. has the most canceled ones.

>We have found The most reliable carrier in the US is Hawaiian Airlines., with 9 Air second place., in which we observed that the shortest delayed on arrival and Depature.

>And from the above charts it turns out the early hours of the morning have the least delays over the hours of the day.
