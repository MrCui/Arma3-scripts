# Arma3 Scripts

### 武装突袭3 自制脚本 

#### 飞机投弹脚本使用方法:

上述代码保存为文件 命名为fire.sqf 放到自己编辑任务的 script文件夹里(没有就自己建一个)

比如:

`C:\Users\用户名\Documents\Arma 3\missions\任务名.地图名\script`

使用时 比如创建个飞机, 给它一个 路径点 "移动"

然后在"移动" 的 执行栏里写入

```[vehicle this, "武器名"] execVM "script\fire.sqf";```

// this代表触发当前路径点的小队长 (一架飞机自己一个小队)

// vehicle this 的意思就是获取当前触发路径点的小队长所乘坐的载具

// 武器名就是飞机挂载的武器 比如Mk82 是 MK82Launcher; 获取载具武器名字可以 给载具设置个变量名

// 比如p1, 然后进入游戏 打开控制台 输入 weapons p1; 即可在控制台的下方看到载具所携带的武器.

