# Midterm Report

## 干了些什么

- AstBuilder: 根据g4生成的CST构建AST
- ScopeTreeBuilder: 扫描AST生成ScopeTree并抛出“Identifier未定义”等错误
- TypeDefinitionChecker: 扫描AST检查并抛出“含void的非法类型”等错误
  - 我本来还写了类的循环定义的检查，但因为M*语言不存在C++那样初始化和资源申请同步的情况，所以其实是没必要且会导致语义分析错误的
- StaticTypeChecker: 扫描AST进行静态类型分析、处理成员访问并抛出相应错误
- ClassTypeResolver: 链接类的引用与其定义
  - 我本来是考虑将这项工作放进StaticTypeChecker中顺带完成，但发现不得不再扫描一遍AST，因为函数的调用与定义是乱序的，可能会出现先进行调用的类型推理再分析定义的返回类型的情况，所以类引用只能通过查找名称来消解，而难以通过类型推理来消解
- BuilInCode: 
  - 思路1：在AST上挂相应节点，但我觉得这样太麻烦了
  - 思路2：将内建类/方法的定义写成代码复制到测试代码后面，我的编译器采用了这种思路
- *结构设计请见Git中[Readme](https://github.com/xxxxxyt/compiler-lite)*

## 遇到了哪些问题

- 在类似 `new int[1][][1]` 的代码中会出现g4将其识别成“对new表达式进行的一次下标访问”的情况，这实质上是语言描述出现歧义的问题，好像不能单纯通过调换优先级解决
  - 解决1：在AST中强判下标访问的caller不能是new表达式。但是这样做是不妥的，因为测试数据中出现了类似这样的表达 `(new int[1][])[1]`
  - 解决2：在生成AST的过程中对CST进行强判，下标访问的caller不能是new表达式。我的代码最终采用了这种方法，暂时没有出现错误
  - 解决3（卢思迪学长提供的方案）：在语法描述自动机中加入 positive rejection 节点，其匹配规则为 `Type ([placeholder])* ([])+ [placeholder]` ，当其被匹配到时抛出错误

## 一些收获

- Visitor的使用可以大大减少代码量并简化代码逻辑
  - 节点类的代码文件是分散的，若用节点类的多态方法来实现，代码将非常不易读
  - Visitor类的方法接口进一步简化了代码，否则就需要写“#节点类×#操作种类”个方法定义

