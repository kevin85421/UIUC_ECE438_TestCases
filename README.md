# UIUC_ECE438_TestCases
* The repository aims to provide test scripts and test cases to help you pass the autograder.

## MP1
* **test_server.sh**: Use wget to retrieve files from your HTTP server
  * The script will iterate through all files in the directory mp1/test/input/.
  * Step1: Put testcases into the directory mp1/test/input, and I strongly recommended that the files must include text, image, pdf, and video. In addition, put a file larger than 1GB into the directory (to pass the "medium size testcase").
  * Step2: `./test_server.sh`
* **test_client_server.sh**: Use your HTTP client to retrieve files from your HTTP server
  * The script will iterate through all files in the directory mp1/test/input/.
  * Step1: Put testcases into the directory mp1/test/input, and I strongly recommended that the files must include text, image, pdf, and video. In addition, put a file larger than 1GB into the directory (to pass the "medium size testcase").
  * Step2: `./test_client_server.sh`  

* Tips:
  * Use `fread`/`fwrite` (for binary) instead of `fgets`/`fprintf` (for string)
  * `GET /somedir/somefile.txt` -> `fopen(somedir/somefile.txt)` (relative path)