# XilinxWinterCampProject
## 项目任务

- 利用Vitis AI部署CNN模型到ZCU104开发板
- 记录延迟、功耗、时序等信息
  - 未经优化
  - 软件优化
    - 优化卷积操作
  - 硬件优化
    - 通过Pipeline优化CNN的推理过程



## 项目平台

### 软件平台

- Vitis 2020.1

### 硬件平台

- 由于没有官方ZCU104的开发板，因此我们使用了xczu5ev芯片（ZCU104的芯片为xczu7ev，虽然不完全兼容，但是只需要做少许需改即可适配ZCU104提供的资源）



## 项目流程

1. 使用 Vitis HLS 2020.1 设计高层图像处理函数，并将模块打包封装为IP
2. 在 Vivado 工程中将第一步设计好的IP加入到Block Design中
3. 通过 Vivado 2020.1 生成 XSA 文件（需包含Bitstream）
4. 通过3生成的XSA文件创建Vitis 2020.1的Application Project
5. 编译通过之后即可上板测试。



## 参考

[PipeCNNN](https://github.com/doonny/PipeCNN)

[Accelerating-CNN-with-FPGA](https://github.com/WalkerLau/Accelerating-CNN-with-FPGA)

[zynqnet](https://github.com/dgschwend/zynqnet)

[SkrSkr](https://github.com/jiangwx/SkrSkr)

[ultra_net](https://github.com/heheda365/ultra_net)

