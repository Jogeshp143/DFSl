#!/usr/bin/env bash
set -euo pipefail

echo "=== DFSl environment hello-world verification ==="

python3 -c "print('Hello from Python')"
node -e "console.log('Hello from Node.js')"

cat >/tmp/dfsl_hello.go <<'EOF'
package main
import "fmt"
func main() { fmt.Println("Hello from Go") }
EOF
go run /tmp/dfsl_hello.go

cat >/tmp/dfsl_hello.rs <<'EOF'
fn main() { println!("Hello from Rust"); }
EOF
rustc /tmp/dfsl_hello.rs -o /tmp/dfsl_hello && /tmp/dfsl_hello

cat >/tmp/dfsl_hello.java <<'EOF'
public class dfsl_hello {
  public static void main(String[] args) { System.out.println("Hello from Java"); }
}
EOF
javac /tmp/dfsl_hello.java -d /tmp && java -cp /tmp dfsl_hello

cat >/tmp/dfsl_hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("Hello from C"); return 0; }
EOF
gcc /tmp/dfsl_hello.c -o /tmp/dfsl_hello_c && /tmp/dfsl_hello_c

echo "=== All toolchain checks passed ==="
