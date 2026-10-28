# 参考文献、版本与定理依赖

## 1. 主文献版本

**RT05** — David A. Renard and Peter E. Trapa, *Kazhdan–Lusztig algorithms for nonlinear groups and applications to Kazhdan–Patterson lifting*, American Journal of Mathematics 127 (2005), no. 5, 911–971. DOI: [10.1353/ajm.2005.0034](https://doi.org/10.1353/ajm.2005.0034).

- 本轮实际查阅的作者预印本：[finalRT3.pdf](https://www.math.utah.edu/~ptrapa/finalRT3.pdf)，51 PDF 页。路线图的 §、Definition、Theorem 编号暂按此文件。
- [作者所属机构的书目信息](https://researchportal.ip-paris.fr/en/publications/kazhdan-lusztig-algorithms-for-nonlinear-groups-and-applications-/)确认正式论文为 61 个印刷页。不能将预印本 PDF 页码直接换成正式发表页码。
- 本轮可读取的是网页解析文本；网页 PDF 截图工具返回 cache-miss，未据此声称已完成公式图像校对。涉及上横线、正负号、转置、图和附表的内容，仍需取得可渲染原文后核对。
- 尚未取得该预印本的本地字节，故不编造 SHA256。将来取得后登记下载日期、哈希和页码映射。
- 不把论文 PDF 或其全文复制到本公共仓库。

## 2. 主文献导航

| RT05 位置 | 本项目依赖 | 重要边界 |
|---|---|---|
| §1 | 实群、HC 模、pseudocharacters、标准基与 irreducible 基、长度 | 正则参数；正文采用不可约 submodule 约定 |
| §§2–4 | translation、参数族、cross action 等基础 | 有限维表示积分所需的辅助有限中心覆盖也要构造 |
| §5 | rank-one、Cayley、parity、非整墙 | Γ 可以高维；符号 εα 追溯 Vgr |
| Definition 6.2 | metaplectic root | 基于真实 rank-one 覆盖 |
| Definition 6.3 / Convention 5.2 | genuine cover 的根条件 | 不是 genuine representation；G₂ 的 long-root 约定特殊 |
| Definitions 6.5、6.7 | extended integral roots 与 length | ordinary/integral/extended lengths 分开 |
| Hypothesis 6.15 | lowest K-type multiplicity one | 原文假设，不得删除 |
| Proposition 6.16 | 一种根长时的 multiplicity-one 结果 | 不能未经论证推广到任意根系 |
| §§7–8、Theorem 8.1 | block 与上同调/奇偶消失理论 | 与前述群假设一同使用 |
| Definition 9.2 | Bruhat G-order | 正文明确更正 RT00 Definition 7.2 的非整 exchange 箭头 |
| Definition 9.4 / Proposition 9.5 | T_s 公式与二次关系 | 完整代数不是普通 Hecke algebra |
| Corollary 9.6 | KLV 规范元素的唯一性与可计算性 | 以存在 D 和 Cδ 为前提 |
| (9.1) / Theorem 9.9 | cohomological Q 与组合 P 的比较 | Lie algebra cohomology 及前面的消失理论 |
| Theorem 9.10 | character matrix 的数值解释 | 需要 localization/几何与实际 K0，不是纯递推结论 |
| Part II / Theorem 11.1 / Corollary 11.2 | 对偶及多项式矩阵恒等式 | 符号、参数双射和矩阵方向须统一 |
| §12 / Theorem 12.2 | Sλ 与 Kazhdan–Patterson Tλ 的比较 | 外自同构 A 的选择不可遗漏 |
| Part III | GL(4,R) 可约 lifting 应用 | 附图附表是测试材料，不是算法定义 |

以上为导航。准确 theorem statement 应当在写对应 Lean 声明时重新逐项校对，不能从表格省略的条件推断一般定理。

## 3. 按工作包排列的文献

### 群、覆盖、表示的基础

**Vgr** — David A. Vogan, Jr., *Representations of Real Reductive Lie Groups*, Birkhäuser, 1981。§0.1 的群类；§0.3 的类别与 infinitesimal-character 分解；Chapters 7–9 的平移、Cayley、block 与算法。特别是 Definition 8.3.11 的 parity sign 应查原页。

**Knapp** — Anthony W. Knapp, *Representation Theory of Semisimple Groups: An Overview Based on Examples*, Princeton University Press, 1986。用于真实群结构、离散系列、归一化抛物诱导、Langlands 理论与解析表示。具体定理须按将来实际调用定位，不能泛指全书已实现。

**KV** — Anthony W. Knapp and David A. Vogan, Jr., *Cohomological Induction and Unitary Representations*, Princeton University Press, 1995。Definition 4.29（由 AT12 §2 引用）的群类，以及 (g,K)-modules/cohomological constructions。精确版本的定义比较待核对原页。

**Wallach** — Nolan R. Wallach, *Real Reductive Groups I* (1988), *II* (1992), Academic Press。用于 admissible/smooth 表示、标准模、解析实现和 globalization。完整 KLV 阶段不因此自动获得这些定理。

**CM（补充定义来源）** — Casselman–Miličić 的矩阵系数渐近论文，§1 开头列出 Harish–Chandra 类的四个条件；[作者收藏版](https://www.math.utah.edu/~ptrapa/math-library/milicic/casselman-milicic-asymptotics-duke-1983.pdf)。此处只采用其 §1 的定义导航，完整书目与版本尚未审计，不从文件名推断发表年份。

**Adams04** — Jeffrey Adams, *Nonlinear covers of real groups*, International Mathematics Research Notices (2004), 4031–4047。[作者 PDF](https://www.math.umd.edu/~jda/preprints/groupswithcovers.pdf)。用于覆盖结构及 rank-one 检查；具体覆盖必须构造，不能仅给存在性标签。

### 已上传的配套资料

**RT00** — David A. Renard and Peter E. Trapa, *Irreducible genuine characters of the metaplectic group: Kazhdan–Lusztig algorithm and Vogan duality*, Representation Theory 4 (2000), 245–295。项目已有上传 PDF。

优先位置：§1.2 pseudocharacters 与标准模；§1.3 translation；§3.3 的非线性 rank-one 现象；§4 rank one；§7，尤其 Proposition 7.7、Corollary 7.11、Theorems 7.12–7.13。该文在 §7 明确分开规范元素的条件性递推和最终存在/表示论解释。其连通、等秩、半整等范围不能搬成 RT05 的一般假设。

**AT12** — Jeffrey Adams and Peter E. Trapa, *Duality for nonlinear simply laced groups*, Compositio Mathematica 148 (2012), 931–965，DOI [10.1112/S0010437X11007354](https://doi.org/10.1112/S0010437X11007354)。项目已有上传 PDF。

§§2–3：群类、double cover 与 admissibility；§4：duality；§5：regular character、非交换 Cartan 表示；§7：cross/Cayley。此文用 `admissible cover`，RT05 用 `genuine cover`；应证明比较，不静默替换术语。AT12 (6.6) 与 RT05 Definition 5.1 的 parity sign 表达应做归一化比较。

**AVLT** — Jeffrey Adams, Marc van Leeuwen, Peter Trapa, David A. Vogan, Jr., *Unitary representations of real reductive groups*。项目上传的是 155 页稿件。本仓库不从文件名推断版本日期。

§2 / Definition 2.5：连续表示、smooth K-finite 与 (g,K)-module；§3：群范围；§5：包络代数中心、无穷小特征、distribution character；§8：一般 pairs。§3 明确把主体工作范围限制在线性代数群，不可用其线性群定理直接覆盖非线性对象。

**ABPTV** — Jeffrey Adams, Dan Barbasch, Annegret Paul, Peter Trapa, David A. Vogan, Jr., *Unitary Shimura correspondences for split real groups*。项目已有上传 PDF。§2 Proposition 2.2 为覆盖交换群的 genuine representations 提供配套证明；不是本项目当前主攻的酉性定理。

**AV19** — Jeffrey Adams and David A. Vogan, Jr., *Associated varieties for real reductive groups*，项目上传稿。仅作为后续 associated-variety 工作的参考，不插入当前主线的必要路径。

### 算法、对偶与几何正确性

**V1** — Vogan, *Irreducible characters of semisimple Lie groups I*, Duke Math. J. 46 (1979), 61–108。rank-one/translation/Cayley 的来源。

**V2** — Vogan, *Irreducible characters of semisimple Lie groups II: the Kazhdan–Lusztig conjectures*, Duke Math. J. 46 (1979), 805–859。上同调、奇偶消失和表示论递推。

**V3** — Vogan, *Irreducible characters of semisimple Lie groups III: Proof of Kazhdan–Lusztig conjecture in the integral case*, Invent. Math. 71 (1983), 381–417。§6、Proposition 6.14 是整根递推的重要参照；不能据标题假定覆盖非整情况。

**V4** — Vogan, *Irreducible characters of semisimple Lie groups IV: Character-multiplicity duality*, Duke Math. J. 49 (1982), 943–1073。[作者收藏版](https://www.math.utah.edu/~ptrapa/math-library/vogan/vogan-IC4.pdf)。参数对偶与 Hecke 模对偶，尤其 §§12–13。

**ABV** — Jeffrey Adams, Dan Barbasch, David A. Vogan, Jr., *The Langlands Classification and Irreducible Characters for Real Reductive Groups*, Progress in Mathematics 104, Birkhäuser, 1992。§17 为 RT05 Theorem 9.10 明确调用的几何来源；参数/几何解释的其他章节按实际使用登记。

**LV** — George Lusztig and David A. Vogan, Jr., *Singularities of closures of K-orbits on flag manifolds*, Invent. Math. 71 (1983), 365–379。orbit closure 与几何多项式。

**BBD** — Beilinson, Bernstein, Deligne, *Faisceaux pervers*, Astérisque 100 (1982)。perverse sheaves、decomposition 的基础。具体用到的特例应单列定理，不把整部书作为一条未解释公理。

**Mi1 / Mi2** — Miličić 的 *Intertwining functors and irreducibility of standard Harish–Chandra sheaves* 与 *Notes on Localization Theory*，为 RT05 引用的标准模不可约准则/localization 来源。需要时先锁定作者稿和对应命题。

### Lifting

**KP** — David Kazhdan and Stephen J. Patterson, *Metaplectic forms*, Publications Mathématiques de l'IHÉS 59 (1984), 35–142。lift 的来源及与诱导的相容；RT05 调用的具体命题应逐条核对。

**AH97** — Jeffrey Adams and Jing-Song Huang, *Kazhdan–Patterson lifting for GL(n,R)*, Duke Math. J. 89 (1997), 423–444。实群 lifting，特别是参数与 translation 的相容。

## 4. mathlib 复现基线

Lean：`leanprover/lean4:v4.24.0`。

mathlib：`f897ebcf72cd16f89ab4577d0c826cd14afaafc7`，GitHub 已确认对应 v4.24.0。选择它是为了固定复现基线，不声称它是最新版本。传递依赖按该提交的上游 manifest 锁定。

本轮检查的官方接口：

- [Matrix.GeneralLinearGroup 定义](https://github.com/leanprover-community/mathlib4/blob/f897ebcf72cd16f89ab4577d0c826cd14afaafc7/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean)：matrix units、det、toLin；
- [Representation 基础文档](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RepresentationTheory/Basic.html)：现行文档只作导航，实际编译以 pin 为准；
- [lean-action](https://github.com/leanprover/lean-action)：CI 会运行真实 `lake build` 和项目 smoke checks。

尚未审计的 mathlib 模块只能写为候选依赖，不能仅凭名字断言具备 HC 模、Langlands 分类或 nonlinear KLV。

## 5. 每个新定理的引用记录模板

```
项目声明名：
状态：PLANNED / DEFINED / PROVED / CONDITIONAL / COMPUTED
源文献和确切版本：
定义/定理号及页码：
适用群、覆盖、参数、中心特征、正则性：
符号/基方向/normalization 比较：
Lean 依赖：
显式数学假设与尚未清偿的义务：
编译提交、命令及结果：
#print axioms 结果：
```
