# Ch9 CMOS 邏輯電路的先進技術

## <b> 9.1 Mirror circuit： </b>
- 條件：1 / 0 要一樣多
- 範例：XOR / XNOR 電路
- 優點：相較AOI，跑得比較快、有更對稱的Layout
<br><br>
<hr>

## <b> 9.2 虛CMOS (略) </b>
<br>
<hr>

## <b> 9.3 Tri-State Circuits： </b>
- 特點：除了能產生正常的 0 / 1 訊號外，擁有 Z (high-impedance)狀態
- 由 En 輸入訊號操控
<br><br>
<hr>

## <b> 9.4 Clock CMOS (aka C<sup>2</sup>MOS) </b>
- 由 CLK 作為 En 來控制電路，CLK為 1 時才能輸出
- <p><b> Charge Leakage 問題： </b>

    當 CLK 為 0 時，即使此時電路的輸出處已被關閉，<br>
    PMOS 和 NMOS 都還會有一個Body(bulk)與S/D端之間的漏電流，PMOS流入輸出節點電流為 i<sub>p</sub>、<br>
    NMOS從輸出節點抽離電流為 i<sub>n</sub>，則還會有一電流 i<sub>out</sub> 從輸出電容抽離，<br> &emsp;
    i<sub>out</sub> = i<sub>n</sub> - i<sub>p</sub> = - C<sub>out</sub> x (dV / dt) = I<sub>L</sub>。

    漏電流問題使輸出節點電壓線性下降，假設在輸出節點的初始電壓為 V1、最後會下降到Vx，<br>
    則能維持住輸出電壓的時間 (hold time) 為：<br> &emsp;
    t<sub>h</sub> = ( C<sub>out</sub> / I<sub>L</sub> ) x ( V<sub>1</sub> - V<sub>x</sub>)

    然而經過估計，t<sub>h</sub> 大約在幾百ms的級別，對於現代數位電路來說久到可以不在乎它。
    </p>
- <p><b>另一個漏電流--- Sub-threshold Current I<sub>sub</sub>： </b>

    在次微米元件中，即使 FET 的 V<sub>GS</sub> 小於 V<sub>T</sub>，在 S / D 之間也存在著一個電流，
    稱為次臨限電流 (sub-threshold current)：<br> &emsp;
    I<sub>sub</sub> = I<sub>D0</sub> x (W / L) x e<sup>-(V<sub>GS</sub> - V<sub>T</sub>)/(nV<sub>th</sub>)</sup>

    經過估計，t<sub>h</sub> 大約在幾us的級別，為重要的限制。
    </p>
<br>
<hr>

## <b> 9.5 Dynamic CMOS Logic Circuits </b>
- 以 N 邏輯 (nFET) 為主的電路為例，在CLK為 0 時預先充電(precharge)，為 1 時進入求值(evaluation)
- <p><b>Charge Sharing：</b>

    在 CLK = 1 (evaluation)時，充電用的PMOS已經關閉，儲存在輸出節點的電荷被分享到其他節點的寄生電容上，<br>
    讓 C<sub>out</sub> >> 其他寄生電容，可以改善這個問題。
    </p>
<br>

- <p><b>骨牌邏輯(Domino Logic)：</b>

    將一個靜態inverter加在動態CMOS邏輯電路的輸出處，並將這種結構串接。
    - 缺點是Charge Sharing惡化、以及只能實現正邏輯。<br>
    - 在骨牌邏輯裡面插入inverter的話可能會造成一些突波。<br>
    - <b>Charge Keeper：</b>在輸出節點加一個(W/L)很小的pFET，以微小的電流對輸出節點充電。有可能持續turn on或者由一個inverter控制。<br>
    - 除了使用Charge Keeper外，也可以加更多PMOS在pre-charge時對邏輯中的部分節點充電，以解決電荷分享問題，但會增加fall time。<br>
    - <b>骨牌邏輯的優點</b>：(1)省面積 (2)寄生電容較小所以速度可能較快 (3)不會有突波<br>
    - <b>Multiple Output Domino Logic (MODL)：</b>將邏輯電路"F"與邏輯電路"G" AND 起來，多重輸出為 G 與 F · G。<br>
</p>

- <p><b>N-P CMOS Logic (Zipper CMOS)：</b>

    - 移除了Domino Logic的輸出Buffer (即inverter)。
    - 將n-Logic、p-Logic交替串接。
    - (n-Logic、p-Logic)兩者的 CLK 是相反的，因為一個是pre-charge，另一個是pre-discharge。
    - 優點：(1)可實現負邏輯 (2)面積較靜態電路小 (3)寄生電容較小所以較快 (4)可避免突波
    - 缺點：(1) p-Logic部分速度較慢 (2) Charge sharing problem
<p>

- 動態電路速度較快，但功率消耗很大。
<br>
<hr>

