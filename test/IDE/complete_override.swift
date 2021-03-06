// RUN: sed -n -e '1,/NO_ERRORS_UP_TO_HERE$/ p' %s > %t_no_errors.swift
// RUN: %target-swift-frontend -typecheck -verify -disable-objc-attr-requires-foundation-module -enable-objc-interop %t_no_errors.swift

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_PA -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_PA_EXT_1 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_PA_EXT_2 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_PB -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_PB < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PB < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_PA_PB -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_PA_PB < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PB < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BA -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BA_PA -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BA_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BA_PA_EXT1 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BA_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BA_PA_EXT2 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BA_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BA_PB -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BA_PB < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PB < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BB -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BB < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BB < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BE -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BE < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BE_PA -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BE_PA < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BE_PA_PE -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BE_PA_PE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BE_PA_PE_EXT1 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BE_PA_PE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_BE_PA_PE_EXT2 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_BE_PA_PE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_BE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=CLASS_PEI_PE -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=CLASS_PEI_PE < %t.txt
// RUN: %FileCheck %s -check-prefix=WITH_PEI < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=PROTOCOL_PA -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=PROTOCOL_PA < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=PROTOCOL_PA_EXT -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=PROTOCOL_PA_EXT < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=NESTED_NOMINAL -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=NESTED_NOMINAL < %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=NESTED_CLOSURE_1 -code-completion-keywords=false | %FileCheck %s -check-prefix=NESTED_CLOSURE_1
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=NESTED_CLOSURE_2 -code-completion-keywords=false | %FileCheck %s -check-prefix=NESTED_CLOSURE_2

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD1 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=OMIT_KEYWORD1< %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD2 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=OMIT_KEYWORD2< %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD3 -code-completion-keywords=false > %t.txt
// RUN: %FileCheck %s -check-prefix=OMIT_KEYWORD3< %t.txt

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD4 -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD4_LET -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD5 -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD1
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD6 -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD2
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD7 -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD3
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD8 -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD8_LET -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD9 -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD9_LET -code-completion-keywords=false | %FileCheck %s -check-prefix=OMIT_KEYWORD4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=OMIT_KEYWORD10 -code-completion-keywords=false | %FileCheck %s -check-prefix=WITH_PA_NO_PROTOFUNCA

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=SR2560_WHERE_CLAUSE -code-completion-keywords=false | %FileCheck %s -check-prefix=SR2560_WHERE_CLAUSE
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=HAS_THROWING -code-completion-keywords=false | %FileCheck %s -check-prefix=HAS_THROWING
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=ASSOC_TYPE1 -code-completion-keywords=false | %FileCheck %s -check-prefix=ASSOC_TYPE1

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=DEPRECATED_1 -code-completion-keywords=false | %FileCheck %s -check-prefix=DEPRECATED_1
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=ESCAPING_1 -code-completion-keywords=false | %FileCheck %s -check-prefix=ESCAPING_1

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER1 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER1
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER2 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER2
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER3 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER2
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER4 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER4
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER5 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER5
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER6 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER6
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER7 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER7
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER8 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER8
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER9 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER9
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER10 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER6
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER11 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER9
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER12 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER12
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER13 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER13
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER14 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER12
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER15 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER15
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER16 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER15
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER17 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER17
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER18 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER17
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER19 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER13
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER20 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER13
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER21 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER21
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER22 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER22
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER23 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER23
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER24 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER24
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER25 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER23
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MODIFIER26 -code-completion-keywords=false | %FileCheck %s -check-prefix=MODIFIER24

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=PROTOINIT_NORM -code-completion-keywords=false | %FileCheck %s -check-prefix=PROTOINIT_NORM
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=PROTOINIT_FINAL -code-completion-keywords=false | %FileCheck %s -check-prefix=PROTOINIT_FINAL
// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=PROTOINIT_STRUCT -code-completion-keywords=false | %FileCheck %s -check-prefix=PROTOINIT_STRUCT

// RUN: %target-swift-ide-test -enable-objc-interop -code-completion -source-filename %s -code-completion-token=MISSING_ASSOC_1 -code-completion-keywords=false | %FileCheck %s -check-prefix=MISSING_ASSOC_1

// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=OVERRIDE_SYNTHESIZED_1 -code-completion-keywords=false | %FileCheck %s -check-prefix=OVERRIDE_SYNTHESIZED_1
// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=OVERRIDE_SYNTHESIZED_2 -code-completion-keywords=false | %FileCheck %s -check-prefix=OVERRIDE_SYNTHESIZED_2
// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=OVERRIDE_SYNTHESIZED_3 -code-completion-keywords=false | %FileCheck %s -check-prefix=OVERRIDE_SYNTHESIZED_3
// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=OVERRIDE_SYNTHESIZED_4 -code-completion-keywords=false | %FileCheck %s -check-prefix=OVERRIDE_SYNTHESIZED_4

@objc
class TagPA {}
@objc
protocol ProtocolA {
  init(fromProtocolA: Int)

  func protoAFunc()
  @objc optional func protoAFuncOptional()

  subscript(a: TagPA) -> Int { get }

  var protoAVarRW: Int { get set }
  var protoAVarRO: Int { get }
}
// WITH_PA: Begin completions
// WITH_PA-DAG: Decl[Constructor]/Super:    required init(fromProtocolA: Int) {|}{{; name=.+$}}
// WITH_PA-DAG: Decl[InstanceMethod]/Super: func protoAFunc() {|}{{; name=.+$}}
// WITH_PA-DAG: Decl[InstanceMethod]/Super: func protoAFuncOptional() {|}{{; name=.+$}}
// WITH_PA-DAG: Decl[Subscript]/Super:      subscript(a: TagPA) -> Int {|}{{; name=.+$}}
// WITH_PA-DAG: Decl[InstanceVar]/Super:    var protoAVarRW: Int{{; name=.+$}}
// WITH_PA-DAG: Decl[InstanceVar]/Super:    var protoAVarRO: Int{{; name=.+$}}
// WITH_PA: End completions

// WITH_PA_NO_PROTOFUNCA: Begin completions
// WITH_PA_NO_PROTOFUNCA-DAG: Decl[Constructor]/Super:    required init(fromProtocolA: Int) {|}{{; name=.+$}}
// WITH_PA_NO_PROTOFUNCA-DAG: Decl[InstanceMethod]/Super: func protoAFuncOptional() {|}{{; name=.+$}}
// WITH_PA_NO_PROTOFUNCA-DAG: Decl[InstanceVar]/Super:    var protoAVarRW: Int{{; name=.+$}}
// WITH_PA_NO_PROTOFUNCA-DAG: Decl[InstanceVar]/Super:    var protoAVarRO: Int{{; name=.+$}}
// WITH_PA_NO_PROTOFUNCA: End completions

struct TagPB {}
protocol ProtocolB : ProtocolA {
  init(fromProtocolB: Int)

  func protoBFunc()

  subscript(a: TagPB) -> Int { get }

  var protoBVarRW: Int { get set }
  var protoBVarRO: Int { get }
}
// WITH_PB: Begin completions
// WITH_PB-DAG: Decl[Constructor]/Super:    required init(fromProtocolA: Int) {|}{{; name=.+$}}
// WITH_PB-DAG: Decl[InstanceMethod]/Super: func protoAFunc() {|}{{; name=.+$}}
// WITH_PB-DAG: Decl[InstanceMethod]/Super: func protoBFunc() {|}{{; name=.+$}}
// WITH_PB-DAG: Decl[Subscript]/Super:      subscript(a: TagPB) -> Int {|}{{; name=.+$}}
// WITH_PB-DAG: Decl[InstanceVar]/Super:    var protoBVarRW: Int{{; name=.+$}}
// WITH_PB-DAG: Decl[InstanceVar]/Super:    var protoBVarRO: Int{{; name=.+$}}
// WITH_PB: End completions

struct TagPE {}
protocol ProtocolE {
  init(fromProtocolE: Int)

  func protoEFunc()

  subscript(a: TagPE) -> Int { get }

  var protoEVarRW: Int { get set }
  var protoEVarRO: Int { get }
}
// WITH_PE: Begin completions
// WITH_PE-DAG: Decl[Constructor]/Super:    required init(fromProtocolE: Int) {|}{{; name=.+$}}
// WITH_PE-DAG: Decl[InstanceMethod]/Super: func protoEFunc() {|}{{; name=.+$}}
// WITH_PE-DAG: Decl[Subscript]/Super:      subscript(a: TagPE) -> Int {|}{{; name=.+$}}
// WITH_PE-DAG: Decl[InstanceVar]/Super:    var protoEVarRW: Int{{; name=.+$}}
// WITH_PE-DAG: Decl[InstanceVar]/Super:    var protoEVarRO: Int{{; name=.+$}}
// WITH_PE: End completions

class BaseA {
  init(fromBaseA: Int) {}
  init(fromBaseAWithParamName foo: Int, withOther bar: Double) {}
  convenience init(convenienceFromBaseA: Double) {
    self.init(fromBaseA: 0)
  }

  func baseAFunc(foo x: Int) {}
  func baseAFunc2(foo x: Int) {}

  var baseAVarRW: Int { get { return 0 } set {} }
  var baseAVarRO: Int { return 0 }
}
// WITH_BA: Begin completions
// WITH_BA-DAG: Decl[Constructor]/Super:    override init(fromBaseA: Int) {|}{{; name=.+$}}
// WITH_BA-DAG: Decl[Constructor]/Super:    override init(fromBaseAWithParamName foo: Int, withOther bar: Double) {|}{{; name=.+$}}
// WITH_BA-DAG: Decl[InstanceMethod]/Super: override func baseAFunc(foo x: Int) {|}{{; name=.+$}}
// WITH_BA-DAG: Decl[InstanceMethod]/Super: override func baseAFunc2(foo x: Int) {|}{{; name=.+$}}
// WITH_BA-DAG: Decl[InstanceVar]/Super:    override var baseAVarRW: Int{{; name=.+$}}
// WITH_BA-DAG: Decl[InstanceVar]/Super:    override var baseAVarRO: Int{{; name=.+$}}
// WITH_BA: End completions

class BaseB : BaseA {
  override func baseAFunc2(foo x: Int) {}

  init(fromBaseB: Int) {}
  convenience init(convenienceFromBaseB: Double) {
    self.init(fromBaseB: 0)
  }

  func baseBFunc() {}

  var baseBVarRW: Int { get { return 0 } set {} }
  var baseBVarRO: Int { return 0 }
}
// WITH_BB: Begin completions
// WITH_BB-DAG: Decl[InstanceMethod]/Super: override func baseAFunc(foo x: Int) {|}{{; name=.+$}}
// WITH_BB-DAG: Decl[InstanceMethod]/Super: override func baseAFunc2(foo x: Int) {|}{{; name=.+$}}
// WITH_BB-DAG: Decl[Constructor]/Super:    override init(fromBaseB: Int) {|}{{; name=.+$}}
// WITH_BB-DAG: Decl[InstanceMethod]/Super: override func baseBFunc() {|}{{; name=.+$}}
// WITH_BB-DAG: Decl[InstanceVar]/Super:    override var baseAVarRW: Int{{; name=.+$}}
// WITH_BB-DAG: Decl[InstanceVar]/Super:    override var baseAVarRO: Int{{; name=.+$}}
// WITH_BB-DAG: Decl[InstanceVar]/Super:    override var baseBVarRW: Int{{; name=.+$}}
// WITH_BB-DAG: Decl[InstanceVar]/Super:    override var baseBVarRO: Int{{; name=.+$}}
// WITH_BB: End completions

class BaseE : ProtocolE {
  required init(fromProtocolE: Int) {}

  func protoEFunc() {}

  subscript(a: TagPE) -> Int { return 0 }

  var protoEVarRW: Int { get { return 0 } set {} }
  var protoEVarRO: Int { return 0 }

  init(fromBaseE: Int) {}

  func baseEFunc() {}

  var baseEVarRW: Int { get { return 0 } set {} }
  var baseEVarRO: Int { return 0 }
}
// WITH_BE: Begin completions
// WITH_BE-DAG: Decl[Constructor]/Super:    required init(fromProtocolE: Int) {|}{{; name=.+$}}
// WITH_BE-DAG: Decl[InstanceMethod]/Super: override func protoEFunc() {|}{{; name=.+$}}
// WITH_BE-DAG: Decl[Subscript]/Super:      override subscript(a: TagPE) -> Int {|}{{; name=.+$}}
// WITH_BE-DAG: Decl[Constructor]/Super:    override init(fromBaseE: Int) {|}{{; name=.+$}}
// WITH_BE-DAG: Decl[InstanceMethod]/Super: override func baseEFunc() {|}{{; name=.+$}}
// WITH_BE-DAG: Decl[InstanceVar]/Super:    override var protoEVarRW: Int{{; name=.+$}}
// WITH_BE-DAG: Decl[InstanceVar]/Super:    override var protoEVarRO: Int{{; name=.+$}}
// WITH_BE-DAG: Decl[InstanceVar]/Super:    override var baseEVarRW: Int{{; name=.+$}}
// WITH_BE-DAG: Decl[InstanceVar]/Super:    override var baseEVarRO: Int{{; name=.+$}}
// WITH_BE: End completions

class ProtocolEImpl /* : ProtocolE but does not implement the protocol */ {
  init(fromProtocolE: Int) {}

  func protoEFunc() {}

  subscript(a: TagPE) -> Int { return 0 }

  var protoEVarRW: Int { get { return 0 } set {} }
  var protoEVarRO: Int { return 0 }
}
// WITH_PEI: Begin completions
// WITH_PEI-DAG: Decl[Constructor]/Super:    override init(fromProtocolE: Int) {|}{{; name=.+$}}
// WITH_PEI-DAG: Decl[InstanceMethod]/Super: override func protoEFunc() {|}{{; name=.+$}}
// WITH_PEI-DAG: Decl[Subscript]/Super:      override subscript(a: TagPE) -> Int {|}{{; name=.+$}}
// WITH_PEI-DAG: Decl[InstanceVar]/Super:    override var protoEVarRW: Int{{; name=.+$}}
// WITH_PEI-DAG: Decl[InstanceVar]/Super:    override var protoEVarRO: Int{{; name=.+$}}
// WITH_PEI: End completions

// NO_ERRORS_UP_TO_HERE

class TestClass_PA : ProtocolA {
  func ERROR() {}

  #^CLASS_PA^#
}
// CLASS_PA: Begin completions, 6 items

class TestClass_PA_Ext {
  func ERROR1() {}
  #^CLASS_PA_EXT_1^#
}
extension TestClass_PA_Ext : ProtocolA {
  func ERROR2() {}
  #^CLASS_PA_EXT_2^#
}

class TestClass_PB : ProtocolB {
  #^CLASS_PB^#
}
// CLASS_PB: Begin completions, 11 items

class TestClass_PA_PB : ProtocolA, ProtocolB {
  #^CLASS_PA_PB^#
}
// CLASS_PA_PB: Begin completions, 11 items

class TestClass_BA : BaseA {
  #^CLASS_BA^#
}
// CLASS_BA: Begin completions, 6 items

class TestClass_BA_PA : BaseA, ProtocolA {
  #^CLASS_BA_PA^#
}
// CLASS_BA_PA: Begin completions, 12 items

class TestClass_BA_PA_Ext : BaseA {
  #^CLASS_BA_PA_EXT1^#
}

extension TestClass_BA_PA_Ext : ProtocolA {
  #^CLASS_BA_PA_EXT2^#
}

class TestClass_BA_PB : BaseA, ProtocolB {
  #^CLASS_BA_PB^#
}
// CLASS_BA_PB: Begin completions, 17 items

class TestClass_BB : BaseB {
  #^CLASS_BB^#
}
// CLASS_BB: Begin completions, 8 items

class TestClass_BE : BaseE {
  #^CLASS_BE^#
}
// CLASS_BE: Begin completions, 9 items

class TestClass_BE_PA : BaseE, ProtocolA {
  #^CLASS_BE_PA^#
}
// CLASS_BE_PA: Begin completions, 15 items

class TestClass_BE_PA_PE : BaseE, ProtocolA, ProtocolE {
  #^CLASS_BE_PA_PE^#
}
// CLASS_BE_PA_PE: Begin completions, 15 items

class TestClass_BE_PA_PE_Ext : BaseE {
  #^CLASS_BE_PA_PE_EXT1^#
}
extension TestClass_BE_PA_PE_Ext : ProtocolA, ProtocolE {
  #^CLASS_BE_PA_PE_EXT2^#
}

class TestClass_PEI_PE : ProtocolEImpl, ProtocolE {
  #^CLASS_PEI_PE^#
}
// CLASS_PEI_PE: Begin completions, 5 items

protocol TestProtocol_PA : ProtocolA {
  #^PROTOCOL_PA^#
}
// PROTOCOL_PA: found code completion token
// PROTOCOL_PA-NOT: Begin completions

extension TestProtocol_PA {
  #^PROTOCOL_PA_EXT^#
}

// PROTOCOL_PA_EXT: Begin completions
// PROTOCOL_PA_EXT-DAG: Decl[Constructor]/Super:            init(fromProtocolA: Int) {|}; name=init(fromProtocolA: Int)
// PROTOCOL_PA_EXT-DAG: Decl[InstanceMethod]/Super:         func protoAFunc() {|}; name=protoAFunc()
// PROTOCOL_PA_EXT-DAG: Decl[InstanceMethod]/Super:         func protoAFuncOptional() {|}; name=protoAFuncOptional()
// PROTOCOL_PA_EXT-DAG: Decl[Subscript]/Super:              subscript(a: TagPA) -> Int {|}; name=subscript(a: TagPA) -> Int
// PROTOCOL_PA_EXT-DAG: Decl[InstanceVar]/Super:            var protoAVarRW: Int; name=protoAVarRW: Int
// PROTOCOL_PA_EXT-DAG: Decl[InstanceVar]/Super:            var protoAVarRO: Int; name=protoAVarRO: Int
// PROTOCOL_PA_EXT: End completions

class OuterNominal : ProtocolA {
  class Inner {
    #^NESTED_NOMINAL^#
  }
}
// NESTED_NOMINAL: found code completion token
// NESTED_NOMINAL-NOT: Begin completions

class OuterNominal2: ProtocolA {
  var f = { #^NESTED_CLOSURE_1^# }()
}
// NESTED_CLOSURE_1-NOT: Decl{{.*}}/Super
// NESTED_CLOSURE_1-NOT: {|}

class OuterNominal3: ProtocolA {
  var f = { static #^NESTED_CLOSURE_2^# }()
}
// NESTED_CLOSURE_2-NOT: Decl{{.*}}/Super
// NESTED_CLOSURE_2-NOT: {|}

class OmitKW1 : ProtocolA {
  override#^OMIT_KEYWORD1^#
}

// OMIT_KEYWORD1:        Begin completions
// OMIT_KEYWORD1-NOT:    Decl[Constructor]
// OMIT_KEYWORD1-DAG:    Decl[InstanceMethod]/Super:         func protoAFunc() {|}; name=protoAFunc(){{$}}
// OMIT_KEYWORD1-DAG:    Decl[InstanceMethod]/Super:         func protoAFuncOptional() {|}; name=protoAFuncOptional(){{$}}
// OMIT_KEYWORD1-DAG:    Decl[Subscript]/Super:              subscript(a: TagPA) -> Int {|}; name=subscript(a: TagPA) -> Int
// OMIT_KEYWORD1-DAG:    Decl[InstanceVar]/Super:            var protoAVarRW: Int{{; name=.+$}}
// OMIT_KEYWORD1-NOT:    Decl[Constructor]
// OMIT_KEYWORD1: End completions

class OmitKW2 : ProtocolA {
  override func#^OMIT_KEYWORD2^#
}

// OMIT_KEYWORD2:        Begin completions
// OMIT_KEYWORD2-NOT:    Decl[InstanceVar]/Super:            var protoAVarRW: Int{{; name=.+$}}
// OMIT_KEYWORD2-NOT:    Decl[Constructor]
// OMIT_KEYWORD2-NOT:    Decl[Subscript]
// OMIT_KEYWORD2-DAG:    Decl[InstanceMethod]/Super:         protoAFunc() {|}; name=protoAFunc(){{$}}
// OMIT_KEYWORD2-DAG:    Decl[InstanceMethod]/Super:         protoAFuncOptional() {|}; name=protoAFuncOptional(){{$}}
// OMIT_KEYWORD2-NOT:    Decl[InstanceVar]/Super:            var protoAVarRW: Int{{; name=.+$}}
// OMIT_KEYWORD2-NOT:    Decl[Constructor]
// OMIT_KEYWORD2-NOT:    Decl[Subscript]
// OMIT_KEYWORD2: End completions

class OmitKW3 : ProtocolA {
  func#^OMIT_KEYWORD3^#
}

// OMIT_KEYWORD3:        Begin completions
// FIXME: missing 'override'
// OMIT_KEYWORD3-NOT:    Decl[InstanceVar]/Super:            var protoAVarRW: Int{{; name=.+$}}
// OMIT_KEYWORD3-NOT:    Decl[Constructor]
// OMIT_KEYWORD2-NOT:    Decl[Subscript]
// OMIT_KEYWORD3-DAG:    Decl[InstanceMethod]/Super:         protoAFunc() {|}; name=protoAFunc(){{$}}
// OMIT_KEYWORD3-DAG:    Decl[InstanceMethod]/Super:         protoAFuncOptional() {|}; name=protoAFuncOptional(){{$}}
// OMIT_KEYWORD3-NOT:    Decl[InstanceVar]/Super:            var protoAVarRW: Int{{; name=.+$}}
// OMIT_KEYWORD3-NOT:    Decl[Constructor]
// OMIT_KEYWORD2-NOT:    Decl[Subscript]
// OMIT_KEYWORD3: End completions

class OmitKW4: ProtocolA {
  var #^OMIT_KEYWORD4^#
}
class OmitKW4_let: ProtocolA {
  let #^OMIT_KEYWORD4_LET^#
}

// OMIT_KEYWORD4-NOT:    Decl[Constructor]
// OMIT_KEYWORD4-NOT:    Decl[InstanceMethod]
// OMIT_KEYWORD4:        Decl[InstanceVar]/Super: protoAVarRW: Int{{; name=.+$}}
// OMIT_KEYWORD4-NOT:    Decl[InstanceMethod]
// OMIT_KEYWORD4-NOT:    Decl[Constructor]
// OMIT_KEYWORD4-NOT:    Decl[Subscript]

class OmitKW5: ProtocolA {
  override
  #^OMIT_KEYWORD5^#
// Same as OMIT_KEYWORD1
}
class OmitKW6: ProtocolA {
  override
  func
  #^OMIT_KEYWORD6^#
// Same as OMIT_KEYWORD2
}
class OmitKW7: ProtocolA {
  func
  #^OMIT_KEYWORD7^#
// Same as OMIT_KEYWORD3
}

class OmitKW8: ProtocolA {
  var
  #^OMIT_KEYWORD8^#
// Same as OMIT_KEYWORD4
}
class OmitKW8_let: ProtocolA {
  let
  #^OMIT_KEYWORD8_LET^#
}
class OmitKW9: ProtocolA {
  override
  var
  #^OMIT_KEYWORD9^#
// Same as OMIT_KEYWORD4
}
class OmitKW9_let: ProtocolA {
  override
  let
  #^OMIT_KEYWORD9_LET^#
// Same as OMIT_KEYWORD4
}
class OmitKW10: ProtocolA {
  override func protoAFunc() {}; #^OMIT_KEYWORD10^#
// WITH_PA
}

protocol SR2560Proto {
  func foo<S : Sequence>(x: S) where S.Iterator.Element == Int
}
class SR2560Class: SR2560Proto {
  #^SR2560_WHERE_CLAUSE^#
}

// SR2560_WHERE_CLAUSE: Begin completions
// SR2560_WHERE_CLAUSE: Decl[InstanceMethod]/Super: func foo<S>(x: S) where S : Sequence, S.Element == Int {|};
// SR2560_WHERE_CLAUSE: End completions

protocol HasThrowingProtocol {
  func foo() throws
}

class HasThrowing {
  func bar() throws {}
  func baz(x: @escaping () throws -> ()) rethrows {}
  init() throws {}
}
class TestClassWithThrows : HasThrowing, HasThrowingProtocol {
  #^HAS_THROWING^#
}
// HAS_THROWING: Begin completions
// HAS_THROWING-DAG: Decl[InstanceMethod]/Super:         func foo() throws {|}; name=foo() throws
// HAS_THROWING-DAG: Decl[InstanceMethod]/Super:         override func bar() throws {|}; name=bar() throws
// HAS_THROWING-DAG: Decl[InstanceMethod]/Super:         override func baz(x: @escaping () throws -> ()) rethrows {|}; name=baz(x: {{(@escaping )?}}() throws -> ()) rethrows
// HAS_THROWING-DAG: Decl[Constructor]/Super:            override init() throws {|}; name=init() throws
// HAS_THROWING: End completions

protocol P0
protocol P1 {
  associatedtype T1 = Int
  associatedtype T2 : P0
  associatedtype T3
}
class C1 : P1 {
  #^ASSOC_TYPE1^#
}

// ASSOC_TYPE1: Begin completions, 2 items
// ASSOC_TYPE1: Decl[AssociatedType]/Super:         typealias T2 = {#(Type)#}; name=T2 = Type
// ASSOC_TYPE1: Decl[AssociatedType]/Super:         typealias T3 = {#(Type)#}; name=T3 = Type

class Deprecated1 {
  @available(*, deprecated)
  func deprecated() {}
}

class Deprecated2 : Deprecated1 {
  override func #^DEPRECATED_1^#
}
// DEPRECATED_1: Decl[InstanceMethod]/Super/NotRecommended: deprecated() {|};

class EscapingBase {
  func method(_ x: @escaping (@escaping ()->()) -> (()->())) -> (@escaping (@escaping ()->() )->()) { }
  func autoclosure(arg: @autoclosure () -> Bool) {}
}
class Escaping : EscapingBase {
  override func #^ESCAPING_1^#
}
// ESCAPING_1: Decl[InstanceMethod]/Super:         method(_ x: @escaping (@escaping () -> ()) -> (() -> ())) -> ((@escaping () -> ()) -> ()) {|};
// ESCAPING_1: Decl[InstanceMethod]/Super:         autoclosure(arg: @autoclosure () -> Bool) {|};
class OverrideBase {
  static let staticLet = 0
  static var staticVar = 0
  static var staticGetOnlyVar: Int { return 0 }

  class let classLet = 0
  class var classVar = 0
  class var classGetOnlyVar: Int { return 0 }

  static func staticMethod() {}
  class func classMethod() {}

  let letDecl = 0
  var varDecl: Int = 0

  init(x: Int) {}
  convenience init(y: Int) { self.init(x: y) }
  required init(a: Int) {}
  required convenience init(b: Int) {}
  func defaultMethod() {}
  final func finalMethod() {}
  open func openMethod() {}
}
protocol OverrideP {
  associatedtype Assoc : OverrideP
  init(p: Int)
}

class Override1 : OverrideBase, OverrideP {
  #^MODIFIER1^#
}
class Override2 : OverrideBase, OverrideP {
  final #^MODIFIER2^#
}
class Override3 : OverrideBase, OverrideP {
  open #^MODIFIER3^#
  // Same as MODIFIER2.
}
class Override4 : OverrideBase, OverrideP {
  required #^MODIFIER4^#
}
class Override5 : OverrideBase, OverrideP {
  convenience #^MODIFIER5^#
}
class Override6 : OverrideBase, OverrideP {
  typealias #^MODIFIER6^#
}
class Override7 : OverrideBase, OverrideP {
  override #^MODIFIER7^#
}
class Override8 : OverrideBase, OverrideP {
  // Note: This *does* emit functions. It will result invalid decl, but fix-it
  // will do the job.
  convenience func #^MODIFIER8^#
}
class Override9 : OverrideBase, OverrideP {
  // Ditto.
  required var #^MODIFIER9^#
}
class Override10 : OverrideBase, OverrideP {
  // Ditto.
  final typealias #^MODIFIER10^#
  // Same as MODIFIER6.
}
class Override11 : OverrideBase, OverrideP {
  var #^MODIFIER11^#
  // Same as MODIFIER9.
}
class Override12 : OverrideBase, OverrideP {
  override var #^MODIFIER12^#
}
class Override13 : OverrideBase, OverrideP {
  // No completions.
  let #^MODIFIER13^#
}
class Override14 : OverrideBase, OverrideP {
  // Note: This *does* emit variables. It will result invalid decl, but a
  // diagnostic will tell the user what to do.
  override let #^MODIFIER14^#
  // Same as MODIFIER12.
}
class Override15 : OverrideBase, OverrideP {
  required static var #^MODIFIER15^#
}
class Override16 : OverrideBase, OverrideP {
  class var #^MODIFIER16^#
  // Same as MODIFIER15
}
class Override17 : OverrideBase, OverrideP {
  override class var #^MODIFIER17^#
}
class Override18 : OverrideBase, OverrideP {
  // Note: This *does* emit variables. See MODIFIER14
  override static let #^MODIFIER18^#
  // Same as MODIFIER17
}
class Override19 : OverrideBase, OverrideP {
  // No completions.
  class let #^MODIFIER19^#
}
class Override20 : OverrideBase, OverrideP {
  // No completions.
  static let #^MODIFIER20^#
}
class Override21 : OverrideBase, OverrideP {
  override class func #^MODIFIER21^#
}
class Override22 : OverrideBase, OverrideP {
  class func #^MODIFIER22^#
}
class Override23 : OverrideBase, OverrideP {
  static #^MODIFIER23^#
}
class Override24 : OverrideBase, OverrideP {
  override static #^MODIFIER24^#
}
class Override25 : OverrideBase, OverrideP {
  class #^MODIFIER25^#
  // Same as MODIFIER23
}
class Override26 : OverrideBase, OverrideP {
  class override #^MODIFIER26^#
  // Same as MODIFIER24
}

// MODIFIER1: Begin completions, 10 items
// MODIFIER1-DAG: Decl[Constructor]/Super:            required init(p: Int) {|}; name=required init(p: Int)
// MODIFIER1-DAG: Decl[StaticMethod]/Super:           override class func classMethod() {|}; name=classMethod()
// MODIFIER1-DAG: Decl[StaticVar]/Super:              override class var classVar: Int; name=classVar: Int
// MODIFIER1-DAG: Decl[StaticVar]/Super:              override class var classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER1-DAG: Decl[InstanceMethod]/Super:         override func defaultMethod() {|}; name=defaultMethod()
// MODIFIER1-DAG: Decl[InstanceMethod]/Super:         override func openMethod() {|}; name=openMethod()
// MODIFIER1-DAG: Decl[InstanceVar]/Super:            override var varDecl: Int; name=varDecl: Int
// MODIFIER1-DAG: Decl[Constructor]/Super:            override init(x: Int) {|}; name=init(x: Int)
// MODIFIER1-DAG: Decl[Constructor]/Super:            required init(a: Int) {|}; name=required init(a: Int)
// MODIFIER1-DAG: Decl[AssociatedType]/Super:         typealias Assoc = {#(Type)#}; name=Assoc = Type
// MODIFIER1: End completions

// MODIFIER2: Begin completions, 6 items
// MODIFIER2-DAG: Decl[StaticVar]/Super:              override class var classVar: Int; name=classVar: Int
// MODIFIER2-DAG: Decl[StaticVar]/Super:              override class var classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER2-DAG: Decl[StaticMethod]/Super:           override class func classMethod() {|}; name=classMethod()
// MODIFIER2-DAG: Decl[InstanceMethod]/Super:         override func defaultMethod() {|}; name=defaultMethod()
// MODIFIER2-DAG: Decl[InstanceMethod]/Super:         override func openMethod() {|}; name=openMethod()
// MODIFIER2-DAG: Decl[InstanceVar]/Super:            override var varDecl: Int; name=varDecl: Int
// MODIFIER2: End completions

// MODIFIER4: Begin completions, 3 items
// MODIFIER4-DAG: Decl[Constructor]/Super:            init(p: Int) {|}; name=init(p: Int)
// MODIFIER4-DAG: Decl[Constructor]/Super:            override init(x: Int) {|}; name=init(x: Int)
// MODIFIER4-DAG: Decl[Constructor]/Super:            init(a: Int) {|}; name=init(a: Int)
// MODIFIER4: End completions

// MODIFIER5: Begin completions, 3 items
// MODIFIER5-DAG: Decl[Constructor]/Super:            required init(p: Int) {|}; name=required init(p: Int)
// MODIFIER5-DAG: Decl[Constructor]/Super:            override init(x: Int) {|}; name=init(x: Int)
// MODIFIER5-DAG: Decl[Constructor]/Super:            required init(a: Int) {|}; name=required init(a: Int)
// MODIFIER5: End completions

// MODIFIER6: Begin completions, 1 items
// MODIFIER6-DAG: Decl[AssociatedType]/Super:         Assoc = {#(Type)#}; name=Assoc = Type
// MODIFIER6: End completions

// MODIFIER7: Begin completions, 8 items
// MODIFIER7-DAG: Decl[StaticVar]/Super:              class var classVar: Int; name=classVar: Int
// MODIFIER7-DAG: Decl[StaticVar]/Super:              class var classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER7-DAG: Decl[StaticMethod]/Super:           class func classMethod() {|}; name=classMethod()
// MODIFIER7-DAG: Decl[InstanceMethod]/Super:         func defaultMethod() {|}; name=defaultMethod()
// MODIFIER7-DAG: Decl[InstanceVar]/Super:            var varDecl: Int; name=varDecl: Int
// MODIFIER7-DAG: Decl[InstanceMethod]/Super:         func openMethod() {|}; name=openMethod()
// MODIFIER7-DAG: Decl[Constructor]/Super:            init(x: Int) {|}; name=init(x: Int)
// MODIFIER7-DAG: Decl[Constructor]/Super:            required init(a: Int) {|}; name=required init(a: Int)
// MODIFIER7: End completions

// MODIFIER8: Begin completions, 2 items
// MODIFIER8-DAG: Decl[InstanceMethod]/Super/Erase[5]: override func defaultMethod() {|}; name=defaultMethod()
// MODIFIER8-DAG: Decl[InstanceMethod]/Super/Erase[5]: override func openMethod() {|}; name=openMethod()
// MODIFIER8: End completions

// MODIFIER9: Begin completions, 1 items
// MODIFIER9-DAG: Decl[InstanceVar]/Super/Erase[4]:   override var varDecl: Int; name=varDecl: Int
// MODIFIER9: End completions

// MODIFIER12: Begin completions, 1 items
// MODIFIER12-DAG: Decl[InstanceVar]/Super:           varDecl: Int; name=varDecl: Int
// MODIFIER12: End completions

// MODIFIER13-NOT: Begin completions

// MODIFIER15: Begin completions, 2 items
// MODIFIER15-DAG: Decl[StaticVar]/Super/Erase[4]:    override var classVar: Int; name=classVar: Int
// MODIFIER15-DAG: Decl[StaticVar]/Super/Erase[4]:    override var classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER15: End completions

// MODIFIER17: Begin completions, 2 items
// MODIFIER17-DAG: Decl[StaticVar]/Super:             classVar: Int; name=classVar: Int
// MODIFIER17-DAG: Decl[StaticVar]/Super:             classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER17: End completions

// MODIFIER21: Begin completions, 1 items
// MODIFIER21: Decl[StaticMethod]/Super:              classMethod() {|}; name=classMethod()
// MODIFIER21: End completions

// MODIFIER22: Begin completions, 1 items
// MODIFIER22: Decl[StaticMethod]/Super/Erase[5]:     override func classMethod() {|}; name=classMethod()
// MODIFIER22: End completions

// MODIFIER23: Begin completions, 3 items
// MODIFIER23-DAG: Decl[StaticMethod]/Super:          override func classMethod() {|}; name=classMethod()
// MODIFIER23-DAG: Decl[StaticVar]/Super:             override var classVar: Int; name=classVar: Int
// MODIFIER23-DAG: Decl[StaticVar]/Super:             override var classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER23: End completions

// MODIFIER24: Begin completions, 3 items
// MODIFIER24-DAG: Decl[StaticMethod]/Super:          func classMethod() {|}; name=classMethod()
// MODIFIER24-DAG: Decl[StaticVar]/Super:             var classVar: Int; name=classVar: Int
// MODIFIER24-DAG: Decl[StaticVar]/Super:             var classGetOnlyVar: Int; name=classGetOnlyVar: Int
// MODIFIER24: End completions

protocol RequiredP {
  init(p: Int)
}
class RequiredClass : RequiredP {
  #^PROTOINIT_NORM^#
}
final class RequiredFinal : RequiredP {
  #^PROTOINIT_FINAL^#
}
struct RequiredS : RequiredP {
  #^PROTOINIT_STRUCT^#
}

// PROTOINIT_NORM: Begin completions, 1 items
// PROTOINIT_NORM-DAG: required init(p: Int) {|}; name=required init(p: Int)
// PROTOINIT_NORM: End completions

// PROTOINIT_FINAL: Begin completions, 1 items
// PROTOINIT_FINAL-DAG: init(p: Int) {|}; name=init(p: Int)
// PROTOINIT_FINAL: End completions

// PROTOINIT_STRUCT: Begin completions, 1 items
// PROTOINIT_STRUCT-DAG: init(p: Int) {|}; name=init(p: Int)
// PROTOINIT_STRUCT: End completions

protocol AssocAndMethod {
  associatedtype T = Int
  associatedtype U: P0
  associatedtype V

  func f1(_: T)
  func f2(_: U)
  func f3(_: V)
}

struct MissingAssoc: AssocAndMethod {
  func #^MISSING_ASSOC_1^#
}
// MISSING_ASSOC_1: Begin completions
// MISSING_ASSOC_1-DAG: Decl[InstanceMethod]/Super:         f1(_: T) {|};
// MISSING_ASSOC_1-DAG: Decl[InstanceMethod]/Super:         f2(_: U) {|};
// MISSING_ASSOC_1-DAG: Decl[InstanceMethod]/Super:         f3(_: V) {|};
// MISSING_ASSOC_1: End completions

// Test that we don't skip out on synthesized conformance members.

struct SynthesizedConformance1: Codable {
  let foo: Int
  #^OVERRIDE_SYNTHESIZED_1^#
// OVERRIDE_SYNTHESIZED_1: Begin completions,  2 items
// OVERRIDE_SYNTHESIZED_1-DAG: Decl[Constructor]/Super/IsSystem:       init(from decoder: Decoder) throws {|};
// OVERRIDE_SYNTHESIZED_1-DAG: Decl[InstanceMethod]/Super/IsSystem:    func encode(to encoder: Encoder) throws {|};
}

open class SynthesizedConformance2: Codable {
  let foo: Int
  func encode(to encoder: Encoder) throws {}
  #^OVERRIDE_SYNTHESIZED_2^#
// OVERRIDE_SYNTHESIZED_2: Begin completions, 1 items
// OVERRIDE_SYNTHESIZED_2: Decl[Constructor]/Super/IsSystem:           public required init(from decoder: Decoder) throws {|};
}

struct SynthesizedConformance3: Hashable {
  let foo: Int
  #^OVERRIDE_SYNTHESIZED_3^#
// FIXME: Where did Equatable.(==) go?
// OVERRIDE_SYNTHESIZED_3: Begin completions, 2 items
// OVERRIDE_SYNTHESIZED_3-DAG: Decl[InstanceVar]/Super/IsSystem:       var hashValue: Int; name=hashValue: Int
// OVERRIDE_SYNTHESIZED_3-DAG: Decl[InstanceMethod]/Super/IsSystem:    func hash(into hasher: inout Hasher) {|}
}

enum SynthesizedConformance4: CaseIterable {
  case a, b, c, d
  #^OVERRIDE_SYNTHESIZED_4^#
// OVERRIDE_SYNTHESIZED_4: Begin completions, 4 items
// OVERRIDE_SYNTHESIZED_4-DAG: Decl[InstanceVar]/Super/IsSystem:       var hashValue: Int
// OVERRIDE_SYNTHESIZED_4-DAG: Decl[InstanceMethod]/Super/IsSystem:    func hash(into hasher: inout Hasher) {|};
// OVERRIDE_SYNTHESIZED_4-DAG: Decl[StaticVar]/Super/IsSystem:         static var allCases: [SynthesizedConformance4];
// OVERRIDE_SYNTHESIZED_4-DAG: Decl[AssociatedType]/Super/IsSystem:    typealias AllCases = {#(Type)#};
}

class SynthesizedConformance5: SynthesizedConformance2 {
  #^OVERRIDE_SYNTHESIZED_5^#
// OVERRIDE_SYNTHESIZED_5: Begin completions, 2 items
// OVERRIDE_SYNTHESIZED_5-DAG: Decl[InstanceMethod]/Super/IsSystem:    override func encode(to encoder: Encoder) throws {|};
// OVERRIDE_SYNTHESIZED_5-DAG: Decl[Constructor]/Super/IsSystem:       required init(from decoder: Decoder) throws {|};
}
