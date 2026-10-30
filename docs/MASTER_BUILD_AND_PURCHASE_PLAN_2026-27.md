# 航天未来科技组 · OMER 太空补给服务

> 以团队既有资料为题材和任务流程参考，独立选择可行技术路线的 2026–2027 Problem 1 原型项目。

本仓库用于开发 OMER 购物服务原型。所有设计状态必须以可复核证据为准；文档/代码存在不等于实物验收通过。

## 先读这里

0. **[统一制作与采购总表（主控文件）](docs/MASTER_BUILD_AND_PURCHASE_PLAN_2026-27.md)** — 当前唯一采购/制作基线；旧 BOM 冲突项以此为准。

1. [完整系统设计包](docs/MASTER_DESIGN_PACKAGE_2026-27.md)
2. [尺寸登记表与制作草图](docs/DIMENSION_REGISTER_AND_DRAWINGS_2026-27.md)
3. [电气与固件接口规范](docs/ELECTRICAL_AND_FIRMWARE_SPEC_2026-27.md)
4. [综合测试计划与比赛执行手册](docs/TEST_AND_COMPETITION_RUNBOOK_2026-27.md)
5. [成本登记模板](docs/COST_LEDGER_2026-27.csv)
6. [独立卸载器参数化概念CAD](cad/independent_unloader_concept.scad)
7. [项目工作进度与验收台账](docs/PROJECT_PROGRESS.md)
2. [设计冻结前完整审查记录（2026-10-31）](docs/PREBUILD_AUDIT_2026-10-31.md)
3. [2026–2027 全面审查与整改台账](docs/FULL_AUDIT_2026-27.md)
4. [2026–2027 可行性审查与重构门槛](docs/FEASIBILITY_REVIEW.md)
5. [详细模块化拼装说明书 v0.1](docs/BUILD_MANUAL_2026-27_v0.1.md)
6. [理论技术报告 v0.1](docs/THEORETICAL_TECHNICAL_REPORT_2026-27.md)
7. [购物车与道具选型](docs/CART_AND_PROP_SELECTION.md)
8. [Division II 独立卸载装置概念基线（待测）](docs/DIVISION_II_UNLOADER_CONCEPT.md)
9. [规则追踪表](docs/RULE_TRACEABILITY_2026-27.md)
10. **规则原文优先**：[本地 2026–2027 Problem 1 题面 PDF](OM/2026-2027年度头脑奥林匹克长期题9.30.pdf)；同时核对 [官方 Problem 1](https://odysseyofthemind.com/problem-1/)、[官方澄清](https://odysseyofthemind.com/read-clarifications/) 和 [2026–2027 Program Guide](https://odysseyofthemind.com/program-guide/)。

## 工程与软件资料

- [旧版详细采购 BOM（仅作技术参考；冲突项以统一主控文件为准）](docs/COMPONENTS_BOM.md)
- [ESP32-S3 引脚分配与接线安全](docs/ESP32S3_PINMAP.md)
- [ESP32-S3 固件入口和 bring-up 步骤](firmware/esp32_s3/README.md)
- [验收与测试清单](docs/ACCEPTANCE.md)
- [风险与待确认事项](docs/RISKS.md)
- [整合方案与技术决策](docs/INTEGRATED_PLAN.md)
- [小组分工与交付标准](docs/TEAM_ROLES.md)
- [14 天交付计划](docs/14_DAY_DELIVERY.md)

## 当前项目边界

- 团队已将 **Division II** 作为设计基线；正式报名/教练证据仍待归档。
- 乘坐式车辆必须为队伍原创制作；当前没有可制造总装 CAD、结构强度、稳定性、转向、制动或乘员安全验证。
- 购物车统一选为中国大陆采购的60L金属网篮超市购物车；Sakugi 80L布篮wagon候选已撤销。牵引接口仍须按实物重新设计并完成结构审查。
- Division II 独立卸载装置必须由队伍制作、与车辆分离且不连接车辆；当前只有概念设计，没有实物测试。
- 当前 ESP32-S3 固件是安全 bring-up/串口点动骨架，不是完整自动导航或任务控制程序；商品抓取机械臂尚未实现。
- ESP32-S3 GPIO 为 3.3V；HC-SR04 Echo 等 5V 信号必须电平适配。硬件急停必须物理切断电机驱动能量。
- 购物车、道具、车辆、独立卸载台及风格材料均需计入 2026–2027 Cost Form；Problem 1 成本上限为 US$165。当前完整成本未闭合。
- `3组/` 目录内所有既有材料为只读保护区，不得编辑、移动、重命名或删除。

## 当前状态

项目目前是“有条件可行的原型规划”，不是已完成或已通过验收的比赛系统。所有没有实测记录、照片/视频或构建日志的项目均保持“未测”。**禁止真人乘坐或进行载人动力测试**，直至结构审查、空载测试、受控配重测试、转向/制动验证和适用审批完成。

## 许可

新编写的项目文档与代码按 **CC BY-NC 4.0** 声明许可，范围及第三方材料限制见 [LICENSE](LICENSE)。第三方赛题文件、官方图表和既有材料不因该声明自动获得再许可。
