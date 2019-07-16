import "sub3.wdl" as subThree

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

workflow sub2 {
  Array[Int] it
  scatter (i in it) {
    call increment { input: i = i }
  }

  call subThree.sub3 as subN3 {input: iu = it}
  output {
    Array[Int] js2 = increment.j
  }
}