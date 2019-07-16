import "https://raw.githubusercontent.com/rguan1/wdls/master/sub2.wdl?token=AE2VPQAMP347FOWU4WJ2BKS5G4TZW" as subTwo

workflow nested_subworkflows_3 {

  Array[Int] ts = range(3)

  call subTwo.sub2 as subN2 { input: it = ts }

  output {
    Array[Int] initial = ts
    Array[Int] result = subN2.js2
  }
}
