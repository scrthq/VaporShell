function Convert-TemplateToVaporShellScript {
    [CmdletBinding()]
    Param
    (
        [parameter(Mandatory = $true,Position = 0,ValueFromPipeline = $true,ValueFromPipelineByPropertyName = $true)]
        [ValidateScript( {Test-Path $_})]
        [Alias('FullName')]
        [String[]]
        $Path
    )
    Begin {
        $funcHash = @{
            'Ref'             = 'Add-FnRef'
            'Fn::Base64'      = 'Add-FnBase64'
            'Fn::Cidr'        = 'Add-FnCidr'
            'Fn::FindInMap'   = 'Add-FnFindInMap'
            'Fn::GetAtt'      = 'Add-FnGetAtt'
            'Fn::GetAZs'      = 'Add-FnGetAZs'
            'Fn::ImportValue' = 'Add-FnImportValue'
            'Fn::Join'        = 'Add-FnJoin'
            'Fn::Select'      = 'Add-FnSelect'
            'Fn::Split'       = 'Add-FnSplit'
            'Fn::Sub'         = 'Add-FnSub'
        }
        $typeDictPath = Join-Path (Resolve-Path "$script:VaporshellPath\bin") "TypeToFunctionDict.ps1"
        $typeDict = . $typeDictPath
        $varDict = . "$VaporshellPath\Private\PseudoParams.ps1"
    }
    Process {
        foreach ($tempPath in $Path) {
            $tempFull = Import-Vaporshell -Path $tempPath

            $final = @('#region Initialize VaporShell template object')
            
            $tempInit = '$template = Initialize-Vaporshell'
            if ($tempFull.Description) {
                $tempInit += " -Description `"$($tempFull.Description)`""
            }
            $final += $tempInit
            $final += "#endregion Initialize VaporShell template object"
            $final += ""

            if ($tempFull.Outputs) {
                $final += "#region Add Outputs to template"
                foreach ($prop in $tempFull.Outputs.PSObject.Properties.Name) {
                    $command = "New-VaporOutput -LogicalId `"$($prop)`""
                    if ($tempFull.Outputs.$prop.Description) {
                        $command += " -Description `"$($tempFull.Outputs.$prop.Description)`""
                    }
                    $command += " -Value "
                    if ($tempFull.Outputs.$prop.Value -is 'System.Management.Automation.PSCustomObject') {

                    }

                    $final += $command
                }
                $final += "#endregion Add Outputs to template"
                $final += ""
            }
        }
    }
}