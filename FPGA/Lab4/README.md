# Lab4 Register X Wire

### I/O：
- 一個Switch及Button作為輸入
- 四顆七段顯示器作為輸出

### 目的：
- 了解Register、Wire的使用時機
- 大致上來說，wire和reg都類似於C/C++的變數，<br>
    但若此變數要放在always block內，該變數就須使用reg，在always block之外，則使用wire。<br>
    使用wire時須搭配assign，reg則不必。input、output、inout預設值都是wire。<br>
    在Verilog中使用reg，並不表示合成後就是暫存器(register)。<br>
    若在組合電路中使用reg，合成後仍只是wire，唯有在循序電路中使用reg，<br>
    合成後才會以flip-flop形式表示成register。<br>
    Ex: <br>
        ```
        always @(a or b)begin
            c = a & b;
        end
        ```


### 作業：
- 以4個七段顯示器作為輸出，顯示出貪吃蛇跑八字形
- 以SW0(R1)作為輸入，未上撥為向右，上撥為向左
- 以中間按鍵S2(R15)作為輸入，按下時，降低貪吃蛇的速度 <br>

t=0: 上 上 上 上 &nbsp; &nbsp;
t=1: 無 上 上 上&右上 &nbsp; &nbsp;
t=2: 無 無 上 上&右上&中 &nbsp; &nbsp;
t=3: 無 無 中 上&右上&中 <br>
t=4: 無 中 中 右上&中 &nbsp; &nbsp;
t=5: 中 中 中 中 &nbsp; &nbsp;
t=6 ~ 9: ... <br>
t=10: 上 上 上 上 &nbsp; &nbsp;
t=11: 無 上 上 上&右上 &nbsp; &nbsp;
t=12: 無 無 上 上&右上&右下 &nbsp; &nbsp;
t=13: 無 無 無 上&右上&右下&下 <br>
t=14: 無 無 下 右上&右下&下 &nbsp; &nbsp;
t=15: 無 下 下 右下&下 &nbsp; &nbsp;
t=16 ~ 21: ... <br>
