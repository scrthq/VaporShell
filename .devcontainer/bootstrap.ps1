if (-not (Test-Path '.devcontainer/installed.modules')) {
    Get-PackageProvider NuGet -ForceBootstrap -Verbose
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

    Install-Module PowerShellGet -Repository PSGallery -Verbose -Force
    $Dependencies = @(
        @{
            Name = 'Configuration'
        }
        @{
            Name = 'InvokeBuild'
            MinimumVersion = '5.5.2'
        }
        @{
            Name = 'PSScriptAnalyzer'
        }
        @{
            Name = 'powershell-yaml'
        }
        @{
            Name = 'PSProfile'
        }
        @{
            Name = 'AWS.Tools.CloudFormation'
        }
        @{
            Name           = 'Pester'
            MinimumVersion = '4.10.1'
            MaximumVersion = '4.99.99'
        }
        @{
            Name           = 'Assert'
            MinimumVersion = '0.9.5'
        }
    )
    foreach ($module in $Dependencies) {
        Install-Module @module -Repository PSGallery -Verbose
    }
    New-Item '.devcontainer/installed.modules' -ItemType File -Force
}