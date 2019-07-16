import "subworkflow.wdl" as subworkflow
import "scattergather.wdl" as scatterGatherSubworkflow

workflow two_imports {

  Array[Int] ts = range(3)
  call subworkflow.subwf as subwfT { input: is = ts }

  Array[Int] fs = subwfT.js
  call subworkflow.subwf as subwfF { input: is = fs }

  call scatterGatherSubworkflow.scattergather as sg

  output {
    Array[Int] initial = ts
    Array[Int] intermediate = subwfT.js
    Array[Int] result = subwfF.js
  }
}
