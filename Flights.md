
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


## Data clean
>Tip: Make sure that you keep your reader informed on the steps that you are taking in your investigation. Follow every code cell, or every set of related code cells, with a markdown cell to describe to the reader what was found in the preceding cell(s). Try to make it so that the reader can then understand what they will be seeing in the following cell(s).


```python
# Clean data and Fill in the NAN Value
df['DepTime']=df['DepTime'].fillna(df['DepTime'].mean())
df['ArrTime']=df['ArrTime'].fillna(df['ArrTime'].mean())
df['ActualElapsedTime']=df['ActualElapsedTime'].fillna(df['ActualElapsedTime'].mean())
df['CRSElapsedTime']=df['CRSElapsedTime'].fillna(df['CRSElapsedTime'].mean())
df['AirTime']=df['AirTime'].fillna(df['AirTime'].mean())
df['ArrDelay']=df['ArrDelay'].fillna(df['ArrDelay'].mean())
df['DepDelay']=df['DepDelay'].fillna(df['DepDelay'].mean())
df['Distance']=df['Distance'].fillna(df['Distance'].mean())
df['TaxiIn']=df['TaxiIn'].fillna(df['TaxiIn'].mean())
df['TaxiOut']=df['TaxiOut'].fillna(df['TaxiOut'].mean())
df['CarrierDelay']=df['CarrierDelay'].fillna(df['CarrierDelay'].mean())
df['WeatherDelay']=df['WeatherDelay'].fillna(df['WeatherDelay'].mean())
df['NASDelay']=df['NASDelay'].fillna(df['NASDelay'].mean())
df['SecurityDelay']=df['SecurityDelay'].fillna(df['SecurityDelay'].mean())
df['LateAircraftDelay']=df['LateAircraftDelay'].fillna(df['LateAircraftDelay'].mean())
df['LateAircraftDelay']=df['LateAircraftDelay'].fillna(df['LateAircraftDelay'].mean())
df.drop_duplicates(inplace=True)
#df.drop(['CancellationCode'],axis=1,inplace=True)
#df.drop(['TailNum'], axis=1,inplace=True)
```


```python
# Check the null value after cleaning
df.isnull().sum()
```




    Year                      0
    Month                     0
    DayofMonth                0
    DayOfWeek                 0
    DepTime                   0
    CRSDepTime                0
    ArrTime                   0
    CRSArrTime                0
    UniqueCarrier             0
    FlightNum                 0
    TailNum               80105
    ActualElapsedTime         0
    CRSElapsedTime            0
    AirTime                   0
    ArrDelay                  0
    DepDelay                  0
    Origin                    0
    Dest                      0
    Distance                  0
    TaxiIn                    0
    TaxiOut                   0
    Cancelled                 0
    CancellationCode     218752
    Diverted                  0
    CarrierDelay              0
    WeatherDelay              0
    NASDelay                  0
    SecurityDelay             0
    LateAircraftDelay         0
    dtype: int64




```python
# Describe the data after cleaning and show do there any outlier
df.describe()
```




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



# Q1)  What is the count cancelled of  Flights for every year?


```python
#computing the count cancelled of  trip for every year
year =  df['Year'].unique()
yaxiscan = df[df["Cancelled"]== 1].groupby("Year").count()
yaxiscan = yaxiscan['Cancelled'].values
plt.figure(figsize=(16, 10), dpi=80)
plt.xlabel("Year")
plt.ylabel("Count of cancelled")
X_axis = np.arange(len(year))
plt.bar(X_axis - 0.01, yaxiscan, 0.4, label = 'cancelled')
plt.xticks(X_axis, year)
plt.show()
```


    
![png](output_13_0.png)
    


>**Tip:** the years of 1998 to 2001 have height number of cancelled

# Q2) What is average arrival delay times (of delayed flights) by airline?


```python
# get the most cities for lunched the trip
count_trip = df.query('Cancelled == 0')
Origin_to_Dest= count_trip['Origin']+' to '+count_trip['Dest']
count_trip[['Origin_to_Dest']] = Origin_to_Dest
count_trip_for_cities = count_trip.groupby('Origin_to_Dest')["Cancelled"].count().sort_values(ascending=False)
Origin_Cities = count_trip_for_cities.index[0:10]
Count_trip = count_trip_for_cities.values[0:10]
plt.figure(figsize=(16, 10), dpi=80)
plt.xlabel("Cities")
plt.ylabel("Count of Trip")
plt.bar(Origin_Cities,Count_trip,width=0.4)
plt.show()
```

    <ipython-input-136-cf30d34f77bc>:4: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versus-a-copy
      count_trip[['Origin_to_Dest']] = Origin_to_Dest
    


    
![png](output_16_1.png)
    


>**Tip:** Show here the largest number of flights to and from the airport so we must reduce delays at these airports

# Q3) What is Airline On-Time Performance and Delay/Cancellation Percentages?


```python
#Airline On-Time Performance and Delay/Cancellation Percentages
# Big figure
fig = plt.figure(figsize=(17,6), constrained_layout=True, dpi=80)
# Set font size
sns.set(font_scale=1)
# Arrange grid size of subplot
grid = plt.GridSpec(1, 3, hspace=0.1, wspace=0.1, figure=fig)
ax1 = plt.subplot(grid[0])
ax2 = plt.subplot(grid[1])
ax3 = plt.subplot(grid[2])
# Prepare data
d = {'On-Time': (df.query('DepDelay <= 15 & Cancelled == 0')).shape[0], 
     'Delayed': (df.query('DepDelay > 15 & Cancelled == 0')).shape[0], 
     'Cancelled': (df.query('Cancelled == 1')).shape[0]}
temp_df = pd.Series(d, index=['On-Time','Delayed','Cancelled'])
temp_df = temp_df / temp_df.sum()
# Plot airline performance percentage
colors= sns.color_palette('Set1',4)
ax1.bar(temp_df.index, temp_df.values * 100, width=0.25, edgecolor='k')
ax1.set_xlabel('proportion of Airline')
ax1.set_ylim([0, 100])

# Prepare data
temp_df = df.query('DepDelay > 15 & Cancelled == 0').iloc[:, [23,24,25,26,27]]
temp_df = temp_df.sum(axis=0).sort_values(ascending=False) / temp_df.sum().sum()
temp_df = temp_df.rename(index={'CarrDel': 'Carrier', 'WeaDel': 'Weather', 'NASDel': 'NAS', 
                                'SecDel': 'Security', 'LatAirDel': 'Late Aircraft'})
# Plot delay percentage
ax2.bar(temp_df.index, temp_df.values * 100, width=0.55, edgecolor='k')
ax2.set_ylim([0, 100])
ax2.set_xlabel('Delay Causes')

# Prepare data
temp_df = df.query('Cancelled == 1').loc[:, 'CancellationCode'].value_counts()[:]
temp_df = temp_df.sort_values(ascending=False) / temp_df.sum()
# CancellationCode reason for cancellation (A = carrier, B = weather, C = NAS, D = security)
temp_df = temp_df.rename(index={'A': 'Carrier', 'B': 'Weather', 'C': 'NAS', 'D': 'Security'})

# Plot cancellation percentage
ax3.bar(temp_df.index, temp_df.values * 100, width=0.355, edgecolor='k')
ax3.set_ylim([0, 100])
ax3.set_xlabel('Cancellation Causes')

fig.suptitle('Airline On-Time Performance and Delay/Cancellation Percentages ', fontsize=15)

```




    Text(0.5, 0.98, 'Airline On-Time Performance and Delay/Cancellation Percentages ')




    
![png](output_19_1.png)
    


>**Tips:** There are several causes for a flight to be delayed. It is interesting to look at the proportions or chances of encountering certain delay type. Almost 20% of the fights tend to be late (this taking account delays more than 15 mins). Most planes are late due to late aircraft and/or airline delays. This is interesting because it means that it is an area of the airline industry that could be optimized. Supporting our argument, one notices that the lower amount of delays are caused due to weather and security issues. Showing us that security for example is optimized to a very large level and other types of delays could eventually be avoided by optimizing organization in airports or establishing a delay prevention schedule. Weather delays are rather rare and are not primary reasons for flights to be delayed.

# Q4) What is the ratio of canceled flights and diverted flights?


```python
#the ratio of canceled flights and diverted flights.
fig, (ax1, ax2) = plt.subplots(ncols=2, figsize=[14.70, 8.27])

# canceled flights ratio 
labels1 = ['Not Cancelled','Cancelled']
# plot 1
ax1.pie(df.Cancelled.value_counts(), explode=(0.2, 0), autopct='%.2f%%',
        startangle=180, counterclock=True, colors=colors)

labels2 = ['Not Diverted','Diverted']

# Diverted flights ratio 
ax2.pie(df.Diverted.value_counts(), explode=(0.2, 0), autopct='%.2f%%',
        startangle=180, counterclock=True, colors=colors, )

ax1.title.set(text="Cancelled Flights Ratio", weight='bold', size=14);
ax2.title.set(text="Diverted Flights Ratio", weight='bold', size=14);
ax1.legend(labels1, loc=8, ncol=2);
ax2.legend(labels2, loc=8, ncol=2);

```


    
![png](output_22_0.png)
    


<ul>
    <li>Only 1.89% of the flights were cancelled.</li>
    <li>Only 0.24% of the flights were diverted.</li>
</ul>


```python
# Computing the hours of day 
df['DepTime'] = df['DepTime'].astype(int)
df['DepTime'] = df['DepTime'].astype(str)
df['DepHour'] = df['DepTime'].apply(lambda x: x if len(x) == 1  else (x if (len(x)==2 and int(x) <=24) else (x[0:1] if (len(x)==2 and int(x) >=24) else (x[0:2] if (len(x)==3 and int(x)<=24) else(x[0:1] if (len(x)==3 and int(x)>24) else (x[0:2] if (len(x)==4 and int(x)<=24)else(x[0:1] if (len(x)==4 and int(x)>24) else "0")))) )) )
df['DepHour'] = df['DepHour'].astype(int)
```

# Q5) When is the best time of day/day of week/time of year to fly to minimise delays?


```python
#When is the best time of day/day of week/time of year to fly to minimise delays?
temp_df = df.query("Cancelled == 0")
heat_map = temp_df.groupby([temp_df.DayOfWeek, temp_df.DepHour])['DepDelay'].apply(lambda x: np.mean(x)).unstack()
fig = plt.figure(figsize=(20,8), constrained_layout=True, dpi=80)
sns.set(font_scale=1)
hm = sns.heatmap(heat_map, annot=True,square=False, linewidths=.5, cmap="YlGnBu",
                 yticklabels=['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'], 
                 xticklabels=['12-1AM', '1-2AM', '2-3AM', '3-4AM', '4-5AM', '5-6AM', '6-7AM', '7-8AM', '8-9AM',
                             '9-10AM', '10-11AM', '11-12PM', '12-1PM', '1-2PM', '2-3PM', '3-4PM', '4-5PM', '5-6PM',
                             '6-7PM', '7-8PM', '8-9PM', '9-10PM', '10-11PM', '11-12AM'])
fig.suptitle('the best time of day/day of week/time of year to fly to minimise delays ', fontsize=16)
```




    Text(0.5, 0.98, 'the best time of day/day of week/time of year to fly to minimise delays ')




    
![png](output_26_1.png)
    


>**Tip:** The figure above summarizes average amount of delay in minutes by daily, hourly, and combined time intervals with delay <=  60 minutes.represent average delay with respect to daily (on the right) and hourly (on the bottom) axes. It is clearly seen that best of the delays is much smaller (< 5 mins) from 04:00AM-09:00AM every week 

# Q6) Waht is  the avarage distance for every city?


```python
# waht is  the avarage distance for every city ?
count_trip = df.query('Cancelled == 0')
Origin_to_Dest= count_trip['Origin']+' to '+count_trip['Dest']
count_trip[['Origin_to_Dest']] = Origin_to_Dest
average_of_distance = count_trip.groupby('Origin_to_Dest')['Distance'].mean().sort_values(ascending=False)
Origin_Cities = average_of_distance.index[0:15]
Count_trip = average_of_distance.values[0:15]
plt.figure(figsize=(20, 10), dpi=80)
plt.xlabel("Cities")
plt.ylabel("distance for miles")
plt.bar(Origin_Cities,Count_trip,width=0.4)
plt.suptitle('the avarage of distance for trip ', fontsize=16)
plt.show()
```

    <ipython-input-25-a7e20ab50000>:4: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame.
    Try using .loc[row_indexer,col_indexer] = value instead
    
    See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versus-a-copy
      count_trip[['Origin_to_Dest']] = Origin_to_Dest
    


    
![png](output_29_1.png)
    


>**Tip:** Here show the avarage distance for every city 

# Q7) How does the departure & arrival delay look like for every carrier?


```python
# how does the departure & arrival delay look like for every carrier?
flights_speed_dep_df = df.groupby(['UniqueCarrier'],as_index = False).agg({'DepDelay':'mean'})
flights_speed_dep_df = flights_speed_dep_df.reset_index()
plt.figure(figsize=(20, 5), dpi=80)
plt.bar(x=flights_speed_dep_df['UniqueCarrier'],height=flights_speed_dep_df['DepDelay'])
plt.xlabel("UniqueCarrier")
plt.ylabel("Mean Departure Delay")
plt.suptitle('Speed of Carriers ', fontsize=16)
plt.show()
flights_speed_dep_df = df.groupby(['UniqueCarrier'],as_index = False).agg({'ArrDelay':'mean'})
flights_speed_dep_df = flights_speed_dep_df.reset_index()
plt.figure(figsize=(20, 5), dpi=80)
plt.bar(x=flights_speed_dep_df['UniqueCarrier'],height=flights_speed_dep_df['ArrDelay'])
plt.xlabel("UniqueCarrier")
plt.ylabel("Mean Arrival Delay")
plt.suptitle('Speed of Carriers ', fontsize=16)
plt.show()
```


    
![png](output_32_0.png)
    



    
![png](output_32_1.png)
    


>**Tip:**  The most reliable carrier in the US is Hawaiian Airlines., with 9 Air second place.

# Q8) Which carrier is the most reliable in terms of cancellations?


```python
# Create a cancelled and uncancelled list
c_flights = df[df.Cancelled == 1]
uc_flights = df[df.Cancelled == 0]
flights_by_carrier = uc_flights.groupby(by=['UniqueCarrier']).size().rename('carriers_dict')
cancelled_flights_by_carrier = c_flights.groupby(by=['UniqueCarrier']).size().rename('carriers_dict')

fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(20,8))

ax1 = flights_by_carrier.plot(kind='barh', title='Successful flights by carrier', ax=axes[0], colormap='summer')
ax1.set_xlabel(" Count of  Flights")
ax1.set_ylabel("Carrier")

ax2 = cancelled_flights_by_carrier.plot(kind='barh', title='Cancelled flights by carrier', ax=axes[1], colormap='Set1')
ax2.set_xlabel(" Count of Flights")
ax1.set_ylabel("Carrier")
```




    Text(0, 0.5, 'Carrier')




    
![png](output_35_1.png)
    


>**Tip:**From these results we can already see that American Airlines,United Airlines and alaska airlines. have the most flight cancellations, but this was to be expected since they are also the largest carriers of the US. A more interesting metric is the cancelled flights per total flights served

# Q9) What is fit a logistic regression model to predict if an individual is Cancelled using [`CarrierDelay`, `WeatherDelay`, `NASDelay`, `SecurityDelay`,`LateAircraftDelay`]


```python
#look at pairwise relationships for all of the quantitative, explanatory variables in the dataset
sns.pairplot(df[['CarrierDelay', 'WeatherDelay', 'NASDelay','SecurityDelay','LateAircraftDelay','DepDelay']]);
```


    
![png](output_38_0.png)
    


>**Tip:** the relation between ['CarrierDelay', 'WeatherDelay', 'NASDelay','SecurityDelay','LateAircraftDelay','DepDelay']


```python
# What is fit a logistic regression model to predict if an individual is Cancelled using `CarrierDelay`, `WeatherDelay`, `NASDelay`, `SecurityDelay`,`LateAircraftDelay`
df['intercept'] = 1
log_mod = sm.Logit(df['Cancelled'], df[['intercept', 'CarrierDelay', 'WeatherDelay', 'NASDelay','SecurityDelay','LateAircraftDelay']])
results = log_mod.fit()
results.summary()
```

    Optimization terminated successfully.
             Current function value: 0.092210
             Iterations 9
    




<table class="simpletable">
<caption>Logit Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>       <td>Cancelled</td>    <th>  No. Observations:  </th>  <td>219774</td>  
</tr>
<tr>
  <th>Model:</th>                 <td>Logit</td>      <th>  Df Residuals:      </th>  <td>219768</td>  
</tr>
<tr>
  <th>Method:</th>                 <td>MLE</td>       <th>  Df Model:          </th>  <td>     5</td>  
</tr>
<tr>
  <th>Date:</th>            <td>Sun, 02 Jan 2022</td> <th>  Pseudo R-squ.:     </th> <td>0.006120</td> 
</tr>
<tr>
  <th>Time:</th>                <td>14:11:12</td>     <th>  Log-Likelihood:    </th> <td> -20265.</td> 
</tr>
<tr>
  <th>converged:</th>             <td>True</td>       <th>  LL-Null:           </th> <td> -20390.</td> 
</tr>
<tr>
  <th>Covariance Type:</th>     <td>nonrobust</td>    <th>  LLR p-value:       </th> <td>6.814e-52</td>
</tr>
</table>
<table class="simpletable">
<tr>
          <td></td>             <th>coef</th>     <th>std err</th>      <th>z</th>      <th>P>|z|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>intercept</th>         <td>   -3.6033</td> <td>    0.029</td> <td> -124.130</td> <td> 0.000</td> <td>   -3.660</td> <td>   -3.546</td>
</tr>
<tr>
  <th>CarrierDelay</th>      <td>   -0.0303</td> <td>    0.006</td> <td>   -5.041</td> <td> 0.000</td> <td>   -0.042</td> <td>   -0.019</td>
</tr>
<tr>
  <th>WeatherDelay</th>      <td>   -0.0183</td> <td>    0.011</td> <td>   -1.706</td> <td> 0.088</td> <td>   -0.039</td> <td>    0.003</td>
</tr>
<tr>
  <th>NASDelay</th>          <td>   -0.0397</td> <td>    0.006</td> <td>   -6.376</td> <td> 0.000</td> <td>   -0.052</td> <td>   -0.027</td>
</tr>
<tr>
  <th>SecurityDelay</th>     <td>   -0.0601</td> <td>    0.098</td> <td>   -0.616</td> <td> 0.538</td> <td>   -0.252</td> <td>    0.131</td>
</tr>
<tr>
  <th>LateAircraftDelay</th> <td>   -0.0257</td> <td>    0.005</td> <td>   -5.452</td> <td> 0.000</td> <td>   -0.035</td> <td>   -0.016</td>
</tr>
</table>



>**Tip:** effect of each ['CarrierDelay', 'WeatherDelay', 'NASDelay','SecurityDelay','LateAircraftDelay] on Cancellation


```python
np.exp(results.params)
```




    intercept            0.027234
    CarrierDelay         0.970185
    WeatherDelay         0.981910
    NASDelay             0.961090
    SecurityDelay        0.941661
    LateAircraftDelay    0.974626
    dtype: float64




```python
1/_
```




    intercept            36.718676
    CarrierDelay          1.030731
    WeatherDelay          1.018423
    NASDelay              1.040485
    SecurityDelay         1.061954
    LateAircraftDelay     1.026035
    dtype: float64



# Conclusion

>From the above findings, and after investigating and plotting the correlation matrix between the variables, we deduced That:

>Most of the flights not diverted (only 0.24%).

>The most cancellation flights were due to the carrier and weather reasons.

>Los Angeles International Airport. followed by San Francisco International Airport. has the most delayed flights and American Airlines Inc. has the most canceled ones.

>We have found The most reliable carrier in the US is Hawaiian Airlines., with 9 Air second place., in which we observed that the shortest delayed on arrival and Depature.

>And from the above charts it turns out the early hours of the morning have the least delays over the hours of the day.
