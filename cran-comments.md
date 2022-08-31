## Test environments

* local

  * R version 4.0.3 (2020-10-10)
  * Platform: x86_64-apple-darwin17.0 (64-bit)
  * Running under: macOS Catalina 10.15.6
  * devtools::check(env_vars = c(`_R_CHECK_DEPENDS_ONLY_` = "true"))

* win-builder (devtools::check_win_devel())

  * complaints about https://onlinelibrary.wiley.com/doi/abs/10.2307/3180348,
  but that link works fine for me.


## devtools::revdep_check()

No problems reported.

|package    |old    |new    |Δ  |
|:----------|:------|:------|:--|
|mosaicData |0.20.2 |0.20.3 |*  |


