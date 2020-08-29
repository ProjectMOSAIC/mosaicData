## Test environments

 * local
   * R Under development (unstable) (2020-08-28 r79089)
   * Platform: x86_64-apple-darwin17.0 (64-bit)
   * Running under: macOS Catalina 10.15.4
   
 * win-builder via devtools

## R CMD check results

R CMD check results
0 errors | 0 warnings | 0 notes

R CMD check succeeded

## Notes on this release

There is one error at 

   https://www.r-project.org/nosvn/R.check/r-release-macos-x86_64/mosaicData-00check.html
   
   message: there is no package called ‘stringi’
   
   Only occurs for this one platform.
