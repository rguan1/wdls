import "sub2.wdl" as subTwo

workflow nested_subworkflows_3 {

  Array[Int] ts = range(3)

  call subTwo.sub2 as subN2 { input: it = ts }

  output {
    Array[Int] initial = ts
    Array[Int] result = subN2.js2
  }
}
