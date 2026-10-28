# 状态记录

日期：2026-10-28（Asia/Singapore）。

## 已完成的仓库操作

- 已建立 `AGENTS.md`，记录“群 → 表示 → KLV”的强制顺序。
- 已固定 Lean 4.24.0 和 mathlib 提交 `f897ebcf72cd16f89ab4577d0c826cd14afaafc7`（对应 v4.24.0）。这是复现基线，不宣称是最新版本。
- 已提交首批 Lean 源码及 CI。下列源码在本地尚未编译；只有检查到相应提交的 CI 成功后才能标记为 `DEFINED` / `PROVED`。

## 首批源码（当前：待编译验证）

| 文件 | 内容 | 不包含什么 |
|---|---|---|
| `Groups/Matrix.lean` | 复用 mathlib 的实际 GL、SL 矩阵群及 GL 的定义表示 | 未证明实约化群结构、未构造非线性覆盖 |
| `Groups/DoubleCover.lean` | 实际群上的代数中心二重扩张、子群逆像、纤维与核元素的引理 | 不等于拓扑或 Lie 群覆盖；不是覆盖存在定理 |
| `Representations/Genuine.lean` | genuine 性质、下降性质及其不相容性 | 不是 Harish–Chandra 模或标准模 |
| `Tests/Smoke.lean` | 初始类型和公理依赖检查 | 不是 KLV 计算证书 |

路径前三项相对于 `RealCoveringGroup/`。

## 构建事实

本地检查：`lean` 和 `lake` 不在可执行路径中；尝试访问 GitHub 安装依赖时，本地容器 DNS 无法解析 github.com。因此没有声称运行过本地 `lake build`。

仓库 CI 将执行 build 和 `Tests/Smoke.lean`；工作流的存在不等于构建通过。成功、失败和具体提交须据 Actions 实际结果记录。

## 尚未完成

真正的非线性 Lie 群覆盖实例；Harish–Chandra 类的完整定义及群实例；连续/光滑表示到 Harish–Chandra 模的构造；标准模与分类；参数穷尽；KLV 引擎；Theorems 9.9–9.10；对偶；Kazhdan–Patterson lifting。

下一数学任务：在代数二重扩张上加入拓扑覆盖结构，并构造第一个非平凡 Lie 群覆盖实例；同时记录其与具体矩阵群、紧子群和 Lie 代数的关系。rank-one 用于验证基础接口，不作为项目终点。
