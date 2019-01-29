// RUN: %empty-directory(%t)

// RUN: %target-build-swift -emit-module -emit-executable %s -g -I %S/Inputs/bridging-header-first/ -import-objc-header %S/Inputs/bridging-header-first/bridging.h -o %t/main
// RUN: llvm-bcanalyzer -dump %t/main.swiftmodule | %FileCheck -check-prefix CHECK-DUMP %s
// RUN: %lldb-moduleimport-test %t/main -type-from-mangled-old %S/Inputs/bridging-header-first/mangled.txt 2>&1 | %FileCheck -check-prefix CHECK-RESOLVED-TYPE %s

// RUN: %target-build-swift -emit-module -emit-executable %s -g -I %S/Inputs/bridging-header-first/ -import-objc-header %S/Inputs/bridging-header-first/bridging.h -o %t/main -whole-module-optimization
// RUN: llvm-bcanalyzer -dump %t/main.swiftmodule | %FileCheck -check-prefix CHECK-DUMP %s
// RUN: %lldb-moduleimport-test %t/main -type-from-mangled-old %S/Inputs/bridging-header-first/mangled.txt 2>&1 | %FileCheck -check-prefix CHECK-RESOLVED-TYPE %s

// REQUIRES: objc_interop

// CHECK-DUMP-LABEL: CONTROL_BLOCK
// CHECK-DUMP: MODULE_NAME
// CHECK-DUMP-SAME: 'main'

// CHECK-DUMP-LABEL: INPUT_BLOCK
// CHECK-DUMP: IMPORTED_HEADER
// CHECK-DUMP-SAME: '{{.+}}/bridging.h'
// CHECK-DUMP: IMPORTED_MODULE
// CHECK-DUMP-SAME: 'Module'
// CHECK-DUMP: IMPORTED_MODULE
// CHECK-DUMP-SAME: 'Swift'


// CHECK-RESOLVED-TYPE: @convention(method) (C.Type) -> () -> C

import Module
class C {}
extension C: AmbivalentProtocol {
  func f() {}
}
