[CmdletBinding()]
Param()

Start-BuildScript -Project VaporShell -Task BuildSubmodules

$buildOutputPath = (Resolve-Path ([System.IO.Path]::Combine($PSScriptRoot, '..', "BuildOutput"))).Path

if (($env:PSModulePath -split ';') -notcontains $buildOutputPath) {
    $env:PSModulePath = @($buildOutputPath, $env:PSModulePath) -join [System.IO.Path]::PathSeparator
}

try {
    <#
    $modPath = (Get-ChildItem "$PSScriptRoot/../BuildOutput/VaporShell.Common/*/VaporShell.Common.psm1").FullName | Sort-Object FullName | Select-Object -Last 1
    $scriptBody = [System.IO.File]::ReadAllText($modPath)
    $script = [ScriptBlock]::Create($scriptBody)
    . $script
    #>
    Import-Module VaporShell.S3 -Verbose

    $t = [VSTemplate]@{
        Description = "My template"
        Resources   = @(
            [S3Bucket]@{
                LogicalId      = 'MyBucket'
                DeletionPolicy = 'RETAIN'
                BucketName     = 'my-test-bucket'
            }
            [S3Bucket]@{
                LogicalId      = 'MyOtherBucket'
                DeletionPolicy = 'RETAIN'
                BucketName     = [FnBase64][FnRef]'BucketName'
                Tags           = ([PSCustomObject]@{
                    Name        = 'MyOtherBucket'
                    environment = 'development'
                    application = 'VaporShell'
                })
            }
        )
    }

    $t2Hash = @{
        Description = "My template"
        Resources   = @(
            [S3Bucket]@{
                LogicalId      = 'MyBucket'
                DeletionPolicy = 'RETAIN'
                BucketName     = 'my-test-bucket'
            }
            [S3Bucket]@{
                LogicalId      = 'MyOtherBucket'
                DeletionPolicy = 'RETAIN'
                BucketName     = [FnBase64][FnRef]'BucketName'
            }
        )
    }
    $t2 = [VSTemplate]::new($t2Hash)

    $resource = [S3Bucket]@{
        LogicalId           = 'MyFancyBucket'
        DeletionPolicy      = 'RETAIN'
        UpdateReplacePolicy = [FnRef]'ReplacePolicyParam'
        BucketName          = [FnBase64][FnRef]'BucketName'
    }


    $res2PropHash = @{
        BucketName = [FnBase64][FnRef]'BucketName'
    }

    $res2Hash = @{
        LogicalId           = 'MyBucket'
        DeletionPolicy      = 'RETAIN'
        UpdateReplacePolicy = 'RETAIN'
        BucketName          = [FnBase64][FnRef]'BucketName'
    }
    $res2 = [S3Bucket]$res2Hash

    $res3 = [S3Bucket]@{
        LogicalId           = 'My3rdBucket'
        DeletionPolicy      = 'RETAIN'
        UpdateReplacePolicy = 'RETAIN'
        BucketName          = [FnBase64][FnRef]'BucketName'
    }
    $t.AddResource($resource)

    $t.ToYaml()
    $resource.ToJson()
    $resource.ToYaml()
    $res2.Properties | Format-List
    $res3.Properties | Format-List
}
catch {
    $_
}
