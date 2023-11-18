# 2021 IC Design Contest

## <b>題目：</b> Geofence

<br>


## <b>說明：</b>

- <b>自訂的變數：</b>
    - ``` reg [1:0] state ```：
        儲存目前的執行狀態，"0"：輸入、"1"：計算、"2"：輸出。

    - ``` reg [9:0] tar [0:1] ```：
        目標物體的座標，tar[0]儲存X座標、tar[1]儲存Y座標。

    - ``` reg [9:0] rec [0:5][0:1] ```：
        6個接收器的座標，rec[n][0]儲存第n個接收器的X座標、rec[n][1]儲存第n個接收器的Y座標。

    - ``` reg [2:0] count ``` & ``` reg [2:0] round ```：
        計算次數使用，詳見RTL code。

    - ``` reg [2:0] right_times ```：
        紀錄vec1向量在vec2向量右邊的次數。

    - ``` reg signed [10:0] vec1 [0:1] ``` & ``` reg signed [10:0] vec2 [0:1] ```：
        vec1為接受器A指向目標物的向量、vec2為接受器A指向接收器B的向量，較座標值多了1 bit以儲存正負。

    - ``` reg signed [20:0] v_cross1 ``` & ``` reg signed [20:0] v_cross2 ```：
        vec1 cross vec2 的第一部分與第二部分。

    - ``` reg right ```：
        vec1 是否在 vec2 的右邊。

- <b>組合邏輯：</b>

- <b>循序邏輯：</b>

<br>


## <b>當前問題：</b>
