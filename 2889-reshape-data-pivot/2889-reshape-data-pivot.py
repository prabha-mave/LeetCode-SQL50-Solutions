import pandas as pd

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    weather_pivot = weather.pivot(
        index = 'month',
        columns = 'city',
        values = 'temperature'
    )
    return weather_pivot


# df.pivot(index=None, columns=None, values=None)