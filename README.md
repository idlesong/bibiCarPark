# bibiCarPark
bibi Car Park system, includes in-out control, park lots status, payment, etc

### lot
### lot monitor
### car plate
### parking records

## Road map
1. 快速搭建模型（包含车牌识别，道闸，收费等基本环节）
1. 车牌识别 改用 GPRS实现
1. 各家停车场分开，如何搭建服务器（dock？）

## Work to do list
### Features requested
1. 只有管理员才有权限，添加修改用户，停车场等信息
1. 每家停车场都有自己的优惠方案，所以收费设定一定要灵活
1. 界面如何专业
 - 出口收银界面，要能够全键盘操作（收银界面最好连箭头都不用，一路enter，除非打印小票）
 - 一键访问网站，自动到输入框，输完到下一输入框，然后根据机器ip自动跳转到出口收费界面
 -
1. 可靠性如何保证
1. 安全性如何保证

## small fixes
 - parking records: receivable & received linkable
 - parking records: sort by exit time, if not exit, sort by enter time

## validations needed
 - 系统没有创建/删除／更新 Parkings的权限
 - 系统没有创建／删除／更新 Car的权限，只能由GPRS传输过来创建
 - 操作保安只有查看当班记录的权限
 - 设备管理员才有更改设备的权限
 - 管理员有查看分析报告的权限
 - 有Parking必须创建payments，是否放在Enter时创建更合适
 - 管理员可以看User的登录记录logs
 - 只有管理员可以创建用户
 -

## Issues
1. 多个停车场系统如何并存
1. 网络化性能不及本地，特别是图片（能否摄像头的数据，一路传server，一路发本地）。
1. GPRS json如何编程

### schema
rails g scaffold Hub mark_id:string
rails g scaffold Node mark_id:string

node1 belongs_to hub1
node1 belongs_to hub2
node default_hub
hub has many nodes
