SET BIN=Y:\Downloads\concourse_windows_amd64.exe

"%BIN%" worker --work-dir C:\tmp\worker --tsa-host 10.211.55.2:2222 --tsa-public-key tsa_host_key.pub --tsa-worker-private-key worker_key
