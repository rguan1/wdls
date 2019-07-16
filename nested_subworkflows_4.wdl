import "sub1.wdl" as subOne

workflow nested_subworkflows_4 {

  Array[Int] ts = range(3)

  call subOne.sub1 as subN1 { input: is = ts }

  output {
    Array[Int] initial = ts
    Array[Int] result = subN1.js
  }
}
