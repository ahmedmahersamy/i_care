
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

## Data Wrangling
   > **Tip**: In this section of the report, you will load in the data, check for cleanliness, and then trim and clean your dataset for analysis. Make sure that you **document your data cleaning steps in mark-down cells precisely and justify your cleaning decisions.**

</style>
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



    Year                      
    Month                     
    DayofMonth                
    DayOfWeek                 
    DepTime                   
    CRSDepTime                
    ArrTime                   
    CRSArrTime                
    UniqueCarrier             
    FlightNum                 
    TailNum               
    ActualElapsedTime         
    CRSElapsedTime            
    AirTime                  
    ArrDelay                 
    DepDelay                  
    Origin                    
    Dest                      
    Distance                  
    TaxiIn                    
    TaxiOut                   
    Cancelled                 
    CancellationCode     
    Diverted                  
    CarrierDelay              
    WeatherDelay              
    NASDelay                  
    SecurityDelay             
    LateAircraftDelay         
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
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
