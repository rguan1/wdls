import "sub2.wdl" as subTwo

task increment {
  Int i
  command {
    echo $(( ${i} + 1 ))
  }
  output {
    Int j = read_int(stdout())
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow sub1 {
  Array[Int] is
  scatter (i in is) {
    call increment { input: i = i }
  }

  call subTwo.sub2 as subN2 { input: it = is }
  output {
    Array[Int] js = increment.j
  }
}