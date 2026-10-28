# 定义登记表与数学规格

本文件给出要进入 Lean 的数学对象、定义内容、依赖和模块位置。**这是定义规格，不是已经完成的 Lean API 清单。** 除 `Groups/Matrix.lean`、`Groups/DoubleCover.lean`、`Representations/Genuine.lean` 中的首批源码外，其余条目目前均为 `PLANNED`；已有源码的编译状态以 [STATUS](STATUS.md) 为准。

模块路径是建议位置；禁止为凑齐路径而加入空定义。参考文献键见 [REFERENCES](REFERENCES.md)。数学定义、实现选择和待核对的文献约定在下面分别说明。

## A. 群与覆盖

### G01 — 实际矩阵群

- `RealGL n`：实矩阵环 `Matrix (Fin n) (Fin n) ℝ` 的单位群。
- `RealSL n`：其中行列式等于 1 的矩阵群。
- `RealSp n`：令 `J = [[0,I],[-I,0]]`，定义保持 `gᵀJg=J` 的可逆实矩阵群。
- `UnitaryPQ p q`：令 `I_pq=diag(I_p,-I_q)`，定义保持 `g* I_pq g=I_pq` 的可逆复矩阵群。

拓扑来自矩阵空间；群律的连续/光滑性、闭子群性质、相应 Lie 代数另证。矩阵方程是定义，约化性是结构定理。当前代码只含 GL、SL 和 GL 的定义表示。

**模块：** `Groups/Matrix`、`Groups/Classical`。

### G02 — 实 Lie 群、Lie 代数、复化、Ad

有限维 Hausdorff、second-countable 实光滑流形上的群，乘法和逆光滑。`g₀` 为单位元处切空间，括号由左不变向量场给出；`g = ℂ ⊗_ℝ g₀`。`Ad(g)` 是共轭映射在单位元处的微分。

必须证明矩阵群的这个 Lie 代数与对应矩阵括号代数相同，不用两套不相联系的 `g`。

### G03 — Harish–Chandra 类与线性性

工作规格：实 Lie 群 G，满足 g₀ 约化、G/G⁰ 有限、Ad(G) 在复化 Lie 代数上为 inner automorphisms、G⁰ 的导出连通子群有有限中心。这里取 `[G⁰,G⁰]`，不能把非连通 G 的抽象交换子群无说明地代入。精确版本与 Vgr §0.1 / KV Definition 4.29 的比较是独立核对及证明任务；Casselman–Miličić §1 是四条件表述的补充来源。

`IsLinear G`：存在有限维实或复向量空间上的忠实连续表示；两种标量域的等价另证。`IsNonlinear G := ¬ IsLinear G`。

这一定义不把“具有根数据”“已有 Langlands 分类”作为结构字段。

### G04 — Cartan involution 与 K

θ 为 G 的光滑 involutive automorphism。设 K=Fix(θ)，g₀=k₀⊕p₀ 是微分的 ±1 eigenspaces。Cartan 条件还须保证 K 紧及正确的正定性/Cartan decomposition；不能把任意群 involution 命名为 Cartan involution。

可先在具体矩阵群构造 θ，再证明 `K × p₀ → G, (k,X) ↦ k exp X` 是微分同胚。最大紧性、唯一性和存在性属于定理。

### G05 — 代数中心二重扩张

实际群 E、G，群同态 p:E→G，元素 z∈E，使 p 满射、z≠1、z²=1、z 中心且

$$\ker p=\{1,z\}.$$

当前 `AlgebraicDoubleCover G E` 实现这一层。`preimage H = p⁻¹(H)` 是实际子群。

### G06 — 拓扑二重覆盖与 Lie 群二重覆盖

在 G05 上加入拓扑群结构和连续性；每个 g 有开邻域 U 及保持投影的同胚

$$p^{-1}(U)\simeq U\times\{1,z\}.$$

Lie 版本再要求适当光滑结构与 p 为局部微分同胚。要证明 d p:g(E)→g(G) 是 Lie 代数同构。

单独的抽象有限核满同态不满足本定义。若用 cocycle 构造，抽象集合 E≃G×{±1} 不意味着积拓扑；非平凡连通覆盖尤其不能这样处理。

### G07 — splitting、覆盖等价、非平凡性

代数 splitting 是同态 s:G→E 满足 p∘s=id；连续、光滑 splitting 分别加相应条件。覆盖等价是保持投影和核标记的群同构，并根据层级要求 homeomorphism/diffeomorphism。

这些概念都不同于 `IsNonlinear E`。证明某个覆盖 non-split，不能代替证明它没有忠实有限维表示。

### G08 — 非平凡覆盖的第一具体模型

供实施比较的 SL(2,R) 模型：上半平面 H 上取对 `(g,φ)`，其中 φ 全纯且 `φ(z)²=cz+d`，g 的下行为 `(c,d)`；乘法

$$(g,\phi)(h,\psi)=(gh,(\phi\circ h)\psi).$$

这是候选实施模型，不是本文件已经证明的构造。需证明平方根存在、每个 g 的两种选择、群律、拓扑和局部平凡化。随后与路径提升模型及文献中的指定覆盖比较。

GL(n,R) 的非连通延拓与两个可能的核平方选择需独立处理；不把全部 n 的 double cover 都叫 universal cover。

### G09 — rank-one subgroup、metaplectic root、genuine cover

从真实/非紧虚根的 sl₂-triple 构造 Lie 代数同态并积分到适当的 rank-one 群。metaplectic root 指提升的 rank-one 同态不能下降到 SL(2,R)。该条件与覆盖限制非平凡/秩一核元素阶为 4 的等价要证明。

RT05 Definition 6.3 的 **genuine cover** 要求真实或非紧虚根为 metaplectic 当且仅当该根为 RT05 Convention 5.2 意义的 long root；其 G₂ 约定尤其特殊。它不是“genuine representation”，也不未经证明等同于 AT12 的 admissible cover。

### G10 — 中心、分支群、覆盖的限制和拉回

中心按交换定义，分支群按连通分支定义。拉回为实际纤维积 `{(h,e) | f(h)=p(e)}`，群律逐分量。证明限制和拉回的 exactness/covering properties，并明确它们是否保留目标 root condition。

**首批群层证明目标：** 同纤维 iff 相差 z；deck involution 无不动点；每个纤维恰有两点；非平凡 Lie 覆盖实例；群条件在所需 Levi 子群上的继承。

## B. Cartan、根与结构数据

| ID | 概念与实际定义 | 关键依赖 |
|---|---|---|
| S01 | Cartan subalgebra：采用 Lie 理论标准定义，证明在约化情形与所需 toral 描述相同 | G02 |
| S02 | Cartan subgroup H：g₀ 的 Cartan subalgebra 在 G 中的 centralizer；覆盖中的 H 可以不交换 | S01、Ad |
| S03 | θ-stability：θ(H)=H；T=H∩K，a₀ 为 h₀ 的负 eigenspace，A=exp(a₀) | G04、S02 |
| S04 | H=T A 的分解与相交/连通性性质 | 必须证明，非定义字段 |
| S05 | 根空间 gα={X : [H,X]=α(H)X 对所有 H∈h}，根是非零且根空间非零的权 | g、h |
| S06 | coroot 与 root pairing：由 rank-one triple 规范化，α(α∨)=2；与 mathlib root datum 比较 | S05、G09 |
| S07 | root/weight/coroot/cocharacter lattices；正根与 simple roots；有限 Weyl 群 | S06 |
| S08 | 实根 θα=−α；虚根 θα=α；其余复根；虚根的 compact/noncompact 由 θ 在根空间的作用判定 | θ、S05 |
| S09 | real Weyl group N_G(H)/H；abstract Weyl group 来自根反射；二者不直接混同 | S02、S07 |
| S10 | parabolic P=MAN、Levi、nilradical n；θ-stable parabolic Lie subalgebra q=l⊕u | 真实群和 Lie 子代数 |
| S11 | ρ、ρ_i、ρ_c、ρ_u：对指定根集合取半和，固定标量扩张及正根选择 | S05–S08 |
| S12 | 覆盖 rank-one 元素 mα；平方与中心核、不同 lift 的关系 | G09 |

不能由 `RootDatum` 的存在直接宣布已经构造了实 Lie 群；反向的根数据提取与比较也要证明。

## C. 表示和 Harish–Chandra 模

### R01 — 代数表示和 intertwiner

在复向量空间 V 上取同态 `π:G→GL_C(V)`，等价使用 mathlib `Representation ℂ G V`。intertwiner 是线性映射 f 使 `f π(g)=π'(g) f`。同构为可逆 intertwiner。稳定子空间和商空间带诱导作用。

代数不可约要求 V≠0 且不含非平凡稳定子空间；topological irreducibility 只排除闭稳定子空间，两者分开。

### R02 — 连续表示与光滑表示

V 为明确指定的 Hausdorff locally convex complex space，作用 `G×V→V` 联合连续。完整解析类别再加入 completeness / Fréchet / moderate growth 等条件，不把它们混入纯代数表示。

`V∞={v | g↦π(g)v 光滑}`；证明它是向量子空间、G-stable，并有微分表示。无限维光滑性采用的微分演算与具体 V 的拓扑须固定。

### R03 — 微分与 K-finite 向量

$$d\pi(X)v=\left.\frac{d}{dt}\right|_{t=0}\pi(\exp(tX))v,$$

先对 smooth vectors 定义，证明 Lie bracket relation，再复线性延拓至 g。

$$V_{K\text{-fin}}=\{v:\dim_\mathbb C\operatorname{span}(K v)<\infty\}.$$

证明 smooth K-finite vectors 同时为 g 和 K 稳定，且满足 Ad compatibility。

### R04 — genuine 表示、中心特征与下降

`IsGenuine π` 定义为 `π(z)v=−v` 对所有 v。下降定义为存在 σ:G→GL(V) 使 π=σ∘p。

中心特征是实际 character χ:Z(E)→C×，满足 `π(c)=χ(c)Id`。genuine 性质在任意非零复表示上蕴含不能下降；反向需不可约等额外条件，不能对任意可约表示声称等价。

当前源码已写入 genuine 与下降及两个基本引理，编译状态见 STATUS。

### R05 — compact type 与 admissibility

K-type 是紧群 K 的不可约连续有限维复表示的同构类。其在 V 中的重数空间为 `Hom_K(τ,V)`。

`KAdmissible V`：每个 K-type 的这个空间有限维。它不同于 V 有限维，也不同于每个向量 K-finite。

### R06 — Harish–Chandra pair

g 是有限维复 Lie 代数；K_C 是复代数群；有 Lie(K_C)→g 的单射和 K_C 对 g 的代数作用，其微分等于通过这个嵌入得到的 adjoint action。要构造紧群 K_R 的 complexification 并证明其适用性质。

这是一般 pair 的定义。它来自某个具体 G/覆盖时，还要证明与 G 的微分结构相容。

### R07 — (g,K)-module

复向量空间 V，带 Lie algebra action ρ:g→End_C(V) 和 locally algebraic K_C action π，满足

$$\pi(k)\rho(X)\pi(k)^{-1}=\rho(\operatorname{Ad}(k)X),$$

以及 `dπ|Lie(K_C)=ρ∘inclusion`。locally algebraic 意味着每个向量在有限维 K_C-stable 子空间中，且该有限维作用 algebraic。

微分条件在这些有限维子空间上定义并证明相容；不能省掉它而只保留 Ad equivariance。

### R08 — Harish–Chandra module、有限长度

在 R07 上加 K-admissibility 与 U(g)-finite generation，形成采用的 Harish–Chandra module 类；有限长度指存在有限 composition series，其非零 successive quotients 为 simple objects。论文使用的有限长度子范畴明确单列。不同常见定义的等价需要定理。

genuine HC module 再要求覆盖核在 K 作用中为 −Id。morphism 同时 intertwine g、K；kernel/cokernel/extension 在这个类别中构造。

### R09 — U(g) 和中心的作用

复用 enveloping algebra 的 universal property，将 ρ 延拓为 `U(g)→End(V)`；PBW、中心 Z(g)、Harish–Chandra homomorphism 及其 Weyl invariance 按需要补齐。包络代数存在不意味着 Harish–Chandra isomorphism 已有。

### R10 — 无穷小特征与广义无穷小特征

χ:Z(g)→C 是代数同态。exact character：zv=χ(z)v。令 mχ=kerχ；generalized character：每个 v 被某个幂 mχ^N 杀掉；有限生成情形统一 N 的存在另证。

定义 Vχ 为实际 generalized-primary submodule，投影 functor 的存在与 exactness 是定理。经 Harish–Chandra isomorphism，λ∈h* 给出 χλ；χλ=χμ iff μ∈Wλ 也要证明。

### R11 — 短正合列、Jordan–Hölder 与 K0

先定义 actual module category 中的 exactness；composition multiplicity `[V:L]` 是 composition series 中 L 的次数，Jordan–Hölder 证明其不依赖系列。

$$K_0(\mathcal C)=\mathbb Z\{[V]\}/\langle[B]-[A]-[C]:0\to A\to B\to C\to0\rangle.$$

需要选取适当小化/对象同构类处理 universes。simple classes 构成自由基是有限长度范畴定理；不是 K0 的替代定义。

### R12 — 最低 K-type 和 multiplicity-one hypothesis

选定紧根正系与不变范数，在出现的 K-types 的最高权 μ 上最小化 Vogan 的 norm（标准约定使用 μ+2ρ_c）。非连通 K 的定义通过限制及其 constituent 数据处理，选择独立性另证。

RT05 Hypothesis 6.15：genuine irreducible HC modules 的 lowest K-types 重数为一。必须先有 R05、R08 和最低类型定义，才能陈述它；不能当作一个未经解释的布尔值。

### R13 — 特征标

有限维时 trace π(g)；一般 admissible 表示使用积分测试函数/密度的算子 `π(f)` 的 trace，形成分布 Θπ。trace-class、正则半单集上的解析性和 characters 的线性独立都是后续定理。

KLV 首先在 K0 中陈述；lifting 需要时再明确接入分布特征标，而不是对无限维 π(g) 直接求 trace。

## D. 标准模和参数

### P01 — relative discrete series 与诱导数据

从实际不可约表示定义 square-integrability modulo center；twist、central character、Levi 上的 relative discrete series 单列。离散系列分类属于构造标准模的依赖工作。

### P02 — normalized parabolic induction

对 P、σ 和 V，选定约定后定义满足

$$f(pg)=\delta_P(p)^{1/2}\sigma(p)f(g)$$

的光滑函数空间，G 以右平移作用。这里明确取 `δ_P(p)=|det(Ad(p)|n)|`，并记录与来源约定的对应。若采用相反 equivariance，则证明两种实现的等价，不能同时混用两种符号。

证明函数空间、作用、K-finite 部分和所需 finiteness 性质。`Representation.ind` 的纯代数张量积 induction 不能直接代替它。

### P03 — pseudocharacter / regular character

数据 `(H,Γ,λ)`：θ-stable Cartan、H 的不可约表示、λ∈h*；加入 regularity、所需实/纯虚限制、以及相对于指定正虚根的 differential identity

$$d\Gamma=(\lambda+\rho_i-2\rho_c)\operatorname{Id}.$$

非交换 H 上 Γ 不是一般的一维 character；右侧表示标量微分作用。RT00 §1.2 与 AT12 Definition 5.3 的详细 positivity 约定各自保留，和 RT05 的比较需做完后才合并 API。

### P04 — 标准模和 Langlands 不可约成分

由 P03 得到 Levi relative discrete series、A-character 与 parabolic，再用 P02 定义 X(γ)。RT05 §1 用标准模的唯一不可约 **submodule** 约定；项目记为 L(γ)。若选 quotient realization，必须先证明 contragredient/正负 chamber 变换，不能只改名字。

唯一性、存在性、全部不可约的穷尽和同构判别均是定理。

### P05 — 参数集合、同构类和有限性

实际 pseudocharacters 按 K-conjugacy 取商；固定 χλ 与中心特征后取子集。证明分类双射后才允许用有限 `Parameter` 代替实际表示同构类。

“finite”不等于“已有算法枚举”。需要 `encode/decode`、逆关系、无重复、每个合法表示都出现的 exhaustion 证明。

### P06 — 两个基和矩阵

在 R11 的 K0 中定义标准基和 simple 基；证明前者确实是基。固定

$$[L(\delta)]=\sum_\gamma M_{\gamma\delta}[X(\gamma)],\quad
[X(\delta)]=\sum_\gamma m_{\gamma\delta}[L(\gamma)].$$

`characterMatrix=M` 可有负数；`compositionMatrix=m` 是非负整数矩阵。`m=M⁻¹` 来自基变换，不能把两者直接命名为同一个 multiplicity matrix。

## E. Functors、根操作、block 与长度

| ID | 要定义的对象 | 定义内容或需要展开的依赖 |
|---|---|---|
| W01 | finite-dimensional highest/extremal-weight module Fμ | 实际有限维表示；Lie 模积分到所用群的条件、RT05 §2 的辅助有限覆盖 |
| W02 | translation Tλ→μ | `pr_μ(F⊗V)`，其中 projection 用 R10 的广义特征子模；F 与路径选择明确 |
| W03 | 整墙/非整墙 crossing | 向墙及离墙的平移复合；非整墙时的类别等价另证 |
| W04 | τ-invariant | 使指定向墙 functor 杀掉表示的 simple integral roots 集合 |
| W05 | Uα(V) | 由 adjunction 给出的 `V → φαψα(V) → V` 的中间上同调；先证明连续复合为零 |
| W06 | cross action | RT05 参数族上经 weight translation 与 Weyl chamber 选择定义的实际 pseudocharacter 操作；不是随意的 permutation |
| W07 | Cartan Cayley transform | 用 rank-one 根向量与其指数共轭改变 Cartan；实/虚方向和根向量归一化都需明确 |
| W08 | 参数 Cayley transform | 在新 Cartan 上满足限制、微分和 character identities 的 pseudocharacters；可单值/双值，先用 relation 再证明精确值数 |
| W09 | parity condition | 按 RT05 Definition 5.1 的 Γ(mα) 特征值条件；εα 的定义追溯 Vgr Definition 8.3.11。与 AT12 的符号不可直接混用；此项的完整符号审计尚待完成 |
| W10 | type I / type II | 由 rank-one Cartan/Weyl/表示限制行为定义，再证明组合标签的判别；保留 RT05 §6 的约定调整 |
| W11 | 参数族 F 与 P_F | 同时记录非整墙移动到的无穷小特征以及相应参数；有限性与操作闭合性均需证明 |
| W12 | block equivalence | 固定正则特征下，由共同标准模的组成因子关系生成的等价关系；与 Ext 或 Cayley/cross 的刻画另证 |

### W13 — 整根、扩张整根与长度

$$R(\lambda)=\{\alpha:\langle\lambda,\alpha^\vee\rangle\in\mathbb Z\}.$$

按 RT05 的 long/short 约定，扩张整根 `R_e(λ)` 为 short integral roots 与 long half-integral roots 的并。半整指 `2〈λ,α∨〉∈Z`；“半整但不整”另加排除条件，二者不能混淆。

普通长度、整长度和扩张整长度分别在 Δ⁺、R⁺、R_e⁺ 上使用

$$\frac12\#\{\alpha\in S^+:\theta\alpha\notin S^+\}
 +\frac12\dim a_\mathbb R.$$

实现先保存双倍长度，长度差的整性和适用于符号的 parity 单独证明。Theorem 9.10 的 sign 使用的长度和 Corollary 9.6 的次数界使用的长度必须分别命名。

### W14 — Bruhat G-order

按 RT05 Definition 9.2 定义为满足生成关系和 exchange conditions 的最小偏序。同层性、反对称、与长度的严格单调、与 composition factors 的支撑关系都需证明。

特别记录：RT05 正文更正了 RT00 Definition 7.2 中非整 exchange 条件的一个箭头方向，不能按旧式机械抄录。

## F. KLV 数学规格与可执行算法

### K01 — 系数环和 free module

原始系数为 A=Z[u,u⁻¹]，M 为 P_F 上的有限支撑自由 A-module。为半整数长度使用 v 并令 u=v²时，必须证明与原系数扩张的比较。由同构类建立的 M 与实际 K0 的关系由 P06 和最终正确性定理提供。

### K02 — Ts 算子

先按 RT05 Definition 9.4 对每个 basis vector、simple root 和该参数的根类型给出公式，再线性延拓。分支包括 compact imaginary、real parity fail、complex ascent/descent、real/imaginary type I–II，以及 integral/nonintegral 分支。

不得先假设它是 ordinary Hecke action。证明各自适用范围内的

$$(T_s+1)(T_s-u)=0,\qquad T_s^2=uI.$$

还要证明相关 braid/transport 关系；非整墙涉及不同层时，用参数族保留源与靶信息。

### K03 — 半线性对偶 D

D 为 additive involution，对系数满足 `D(fm)=bar(f)D(m)`，其中 bar(u)=u⁻¹；再加与 Ts 相容、support triangularity、leading-term normalization。这些条件的精确来源为 RT05 §9 所引 RT00 Proposition 7.7。

存在、唯一性、D²=id 分开证明，不能用一个字段假设所有实际群都有它。

### K04 — 规范元素和 KLV 多项式

在原文未归一化约定下：

$$C_\delta=\sum_{\gamma\le\delta}P_{\gamma,\delta}(u)e_\gamma,\qquad
D(C_\delta)=u^{-\widetilde\ell^I(\delta)}C_\delta,$$

其中 diagonal coefficient=1，非对角条目是多项式并满足原文次数界。若用 v，则特征因子为 `v^(−2 ellExt(δ))`。

次数条件宜按系数表述：若 γ≠δ 且 coeff_n(Pγδ)≠0，则 `2n ≤ ellExt(δ)−ellExt(γ)−1`。这样零多项式无须特殊错误的 `natDegree` 约定。正整数指数和半整数长度之间要给出类型安全的比较。

### K05 — 递推程序

在良基关系上递归，保存 memoized 多项式表和变换证书。证明：每个 recursive call 下降；所有所需参数在 P_F 中；输出满足 K04；由唯一性得选择无关。不得用一个 fuel 上限而不证明其足够。

### K06 — 数值化、矩阵逆与语义

`eval₁:P→Z` 是环同态；连同长度符号得到 M，再求 m。实现既可递归解三角系统也可用已证明的单位三角逆。最终需证明这与真实 K0 基变换相同，不把匹配几张表当正确性证明。

### K07 — 可计算参数与一般复参数

有理权重只是一种可执行输入表示。完整数学定义仍允许所需的复参数。任意复数的整数判定不宣称可计算；通过有限组合证书或已证明的 deformation/translation reduction 对接一般情形，并单列证明义务。

## G. 正确性所需的同调与几何概念

| ID | 概念 | 应如何定义/构造 |
|---|---|---|
| H01 | Lie algebra cohomology | Chevalley–Eilenberg complex `Hom(Λ^q u,V)` 的实际 differential，证明 d²=0，再取 cohomology |
| H02 | Ext、长正合列 | 在实际 HC 或适当更大阿贝尔范畴中的 derived/Yoneda 构造，比较所用版本 |
| H03 | semisimple module | 实际 simple submodules 的直和；Uα(V) 的半单性是定理 |
| H04 | flag variety 与 K-orbits | g 的 Borel subalgebras 的代数簇及实际 K_C 作用，非一个预设有限 poset |
| H05 | equivariant local system | 轨道上的 local system 加相容等变结构；与 stabilizer/component group representations 的对应另证 |
| H06 | twisted D-modules | differential-operator sheaf、twist、module 和 equivariance；ρ/λ 的正负规范明确 |
| H07 | localization / global sections | 实际 functors 与相关 regular/dominant 范围内的等价；不把等价作为定义 |
| H08 | constructible derived category、perverse sheaf、IC、Verdier dual | t-structure、intermediate extension 和 duality 的定义，所需 finiteness 与对称性质 |
| H09 | Riemann–Hilbert / decomposition theorem | 独立的大型证明依赖；可证明实际所需的特例，不能用未证明公理代替 |
| H10 | cohomological Qγδ | 按 RT05 (9.1) 由 H^q 和 multiplicity 定义；符号/指数逐页核对后固化 |

最后证明 `Qγδ=Pγδ` 和 `characterMatrix=sign*eval₁(P)`；两者分别对应 RT05 Theorems 9.9、9.10。

## H. 对偶与 lifting

| ID | 概念 | 定义内容/依赖 |
|---|---|---|
| D01 | dual block datum | 参数双射、root type/操作对应、长度 parity；双方都是实际表示 block |
| D02 | dual operator module | free module 的线性对偶及反变算子作用；证明与另一侧算子模同构 |
| D03 | character multiplicity duality | 按固定下标约定的带符号逆转置矩阵恒等式，以及实际 K0 解释 |
| L01 | regular semisimple set、matching、transfer factor | 实际群中的元素条件、覆盖 lift、Weyl denominator/character 规范 |
| L02 | KP lifting T | 对实际分布/正则特征标按 KP、AH97 和 RT05 的定义构造；良定义与稳定性另证 |
| L03 | geometric/parameter lifting Sλ | 按 RT05 参数嵌入及对偶构造的 K0 线性映射；不能直接定义为 T |
| L04 | 外自同构 A | 实际群 automorphism、pullback on representations 和 parameters 的相容 |
| L05 | T 与 S 的比较 | Theorem 12.2 的两种选择；λ 与 λ/2、A 是否出现均明确 |
| L06 | GL(4) 应用 | 具体 irreducible C 的构造及两个不同 genuine irreducibles；用已证明的算法与 lifting 得到分解 |

## I. 尚待核对，不可猜测的定义细节

1. RT05 genuine-cover 与 AT12 admissible-cover 的关系及不同根长范围。
2. parity sign εα 的 Vgr 来源和不同文章的负号约定。
3. 非连通群的最低 K-type 定义、Γ 的维数变化和 type I–II 标签。
4. 标准模 submodule/quotient、ρ-shift、D 的 eigenvalue 与矩阵方向。
5. 作者预印本与发表版的编号、附图、横线和排版差别。

把这些标为未完成是为了让实现者知道要证明什么；不能将它们替换成布尔字段后称“定义都完成了”。
