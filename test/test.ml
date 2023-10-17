(* use alcotest to test run all the test suites *)
let () =
  Alcotest.run "oci"
    [
      ("annotate", Test_annotate.suite);
      ("config", Test_config.suite);
      ("descriptor", Test_descriptor.suite);
      ("index", Test_index.suite);
    ]