# Source: https://dotnet-cookbook.cfapps.io/cicd/concourse/
function Build-Solution($configuration) {

    $code = -1
    . {
        # install web.targets
        Configure-Publish

        $frameworkVer, $frameworkPath = Get-TargetFramework
		    $frameworkParam = ""
        if($frameworkVer -ne $DefaultFramework) {
            $frameworkParam = "/p`:FrameworkPathOverride=`"$frameworkPath`""
        }

        $app = "$MsBuildApp /m /v:normal /p`:Platform=$Architecture /p`:Configuration=$configuration /nr:false $publish $tools $frameworkParam"

        Write-Host "Running the build script: $app" -ForegroundColor Green
        Invoke-Expression "$app" | Write-Host
        $code = $LastExitCode
    } | Out-Null

    if($code -ne 0) {
        Write-Host "Build FAILED." -ForegroundColor Red
    }
    else{
        Write-Host "Build SUCCESS." -ForegroundColor Green
    }

    $code
}
