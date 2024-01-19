# 2023 IC Design Contest

## <b>題目：</b> Laser Treatment

<br>


## <b>說明：</b>

此題有兩處需描述清楚的部分，而題目未提及：
- 移動圓心尋找最佳點時必須先由左往右、再由上至下，否則容易掉到 local minimum。
- 對於更新圓心的條件，除了當新的最大值出現時要更新以外，相等於最大值也要更新圓心，否則會掉到 local minimum。

<br>


## <b>Behavioral Simulation：</b>
```
# *******************************
# ** Simulation Start          **
# *******************************
# == PATTERN D:/Vcodes/ICDC/2023_univ_cell/img1.pattern
# ---- Used Cycle:      22584
# ---- Get Return: C1(11,12),C2( 4,10)
# ---- cover =  30, optimum =  30
# == PATTERN D:/Vcodes/ICDC/2023_univ_cell/img2.pattern
# ---- Used Cycle:      34346
# ---- Get Return: C1( 5,11),C2(11, 6)
# ---- cover =  28, optimum =  28
# == PATTERN D:/Vcodes/ICDC/2023_univ_cell/img3.pattern
# ---- Used Cycle:      34958
# ---- Get Return: C1( 5,10),C2(10, 5)
# ---- cover =  29, optimum =  29
# == PATTERN D:/Vcodes/ICDC/2023_univ_cell/img4.pattern
# ---- Used Cycle:      46748
# ---- Get Return: C1(10, 5),C2( 4, 9)
# ---- cover =  30, optimum =  30
# == PATTERN D:/Vcodes/ICDC/2023_univ_cell/img5.pattern
# ---- Used Cycle:      41372
# ---- Get Return: C1( 8,12),C2( 2,10)
# ---- cover =  23, optimum =  23
# == PATTERN D:/Vcodes/ICDC/2023_univ_cell/img6.pattern
# ---- Used Cycle:      34202
# ---- Get Return: C1( 9, 9),C2(13, 2)
# ---- cover =  30, optimum =  30
# 
# *******************************
# **   Finish Simulation       **
# **   RUN CYCLE =     214465  **
# **   Cover total = 170/170   **
# *******************************
```
