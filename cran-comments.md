## Test environments
 * local
   * R version 3.3.0 Patched (2016-06-02 r70706)
   * Platform: x86_64-apple-darwin13.4.0 (64-bit)
   * Running under: OS X 10.11.5 (El Capitan)
   
 * win-builder via devtools

## R CMD check results

R CMD check results
0 errors | 0 warnings | 0 notes

R CMD check succeeded

## Downstream dependencies

The only reported issue from revdep_check() was with the mosaic package, but that will go away with the version submitted to CRAN earlier today.

## Note

Modified DESCRIPTION file to remove reference to mosaic-web.org from title and add
http:// in description.