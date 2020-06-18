using namespace System
using namespace System.Collections
using namespace System.Collections.Generic
using namespace System.IO
using namespace System.Management.Automation

class UserData : FnBase64 {
    hidden [string] $_vsFunctionName = 'Add-UserData'
    hidden [string] $_awsDocumentation = 'https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/deploying.applications.html'

    static [object] Transform([UserData] $userData) {
        Write-Debug "Transforming UserData from [UserData]"
        return $userData['Fn::Base64']
    }

    static [object] Transform([FnJoin] $fnJoin) {
        Write-Debug "Transforming UserData from [FnJoin]"
        return $fnJoin
    }

    static [object] Transform([FnBase64] $fnBase64) {
        Write-Debug "Transforming UserData from [FnBase64]"
        return $fnBase64['Fn::Base64']
    }

    static [object] Transform([string] $userDataStringOrFilepath) {
        Write-Debug "Transforming UserData from [string]"
        return [UserData]::Transform($false, $false, @{}, $userDataStringOrFilepath)
    }

    static [object] Transform([string[]] $userDataStringOrFilepath) {
        Write-Debug "Transforming UserData from [string[]]"
        return [UserData]::Transform($false, $false, @{}, ($userDataStringOrFilepath -join [Environment]::NewLine))
    }

    static [object] Transform([string] $userDataStringOrFilepath, [bool] $persist) {
        Write-Debug "Transforming UserData from [string] with Persist=$persist"
        return [UserData]::Transform($persist, $false, @{}, $userDataStringOrFilepath)
    }

    static [object] Transform([bool] $useJoin, [string] $userDataStringOrFilepath) {
        Write-Debug "Transforming UserData from [string] with UseJoin=$useJoin"
        return [UserData]::Transform($false, $useJoin, @{}, $userDataStringOrFilepath)
    }

    static [object] Transform([bool] $persist, [bool] $useJoin, [IDictionary] $replaceDict, [string] $userDataStringOrFilepath) {
        $final = @()
        $startTag = $null
        $endTag = $null
        $tag = $null
        if (Test-Path $userDataStringOrFilepath) {
            Write-Debug "Extracting script from file path: $userDataStringOrFilepath"
            $item = Get-Item $userDataStringOrFilepath
            $tag = switch -RegEx ($item.Extension) {
                '^\.ps1$' {
                    "powershell"
                }
                '^\.(bat|cmd)$' {
                    "script"
                }
                default {
                    $null
                }
            }
            $fileContents = [File]::ReadAllLines($item.FullName)
            if ($tag -and ($fileContents -join [Environment]::NewLine) -notlike "<$($tag)>*") {
                if ($fileContents[0] -notlike "<$($tag)>`n*") {
                    Write-Debug "Adding missing script tags: <$tag>"
                    $final += "<$($tag)>"
                }
            }
            $final += $fileContents
            if ($tag -and ($fileContents -join [Environment]::NewLine) -notlike "*</$($tag)>*") {
                $final += "</$($tag)>"
            }
            if ($persist -and ($fileContents -join [Environment]::NewLine) -notlike "*<persist>true</persist>*") {
                Write-Debug "Adding missing script tags: <persist>"
                $final += "`n<persist>true</persist>"
            }
        }
        else {
            $final += $userDataStringOrFilepath
        }
        $replaceDict.GetEnumerator() | ForEach-Object {
            Write-Verbose "Replacing '$($_.Key)' with '$($_.Value)'"
            $final = $final.Replace($_.Key,$_.Value)
        }
        if ($null -ne $tag -and ($final -join [Environment]::NewLine) -notmatch "\<$tag\>") {
            $final.Insert(0,"<$($tag)>") | Out-Null
            $final += "</$($tag)>"
        }
        if ($useJoin) {
            return [FnJoin]::new([Environment]::NewLine,$final)
        }
        else {
            return ($final -join [Environment]::NewLine)
        }
    }

    UserData() : base() {}
    UserData([IDictionary] $props) : base($props) {}
    UserData([psobject] $props) : base($props) {}

    UserData([FnJoin] $fnJoin) {
        Write-Debug "Creating UserData from [FnJoin]"
        $this['Fn::Base64'] = $fnJoin
    }
    UserData([FnBase64] $fnBase64) {
        Write-Debug "Creating UserData from [FnBase64]"
        $this['Fn::Base64'] = $fnBase64['Fn::Base64']
    }
    UserData([string] $userDataStringOrFilepath) {
        Write-Debug "Creating UserData from [string]"
        $this['Fn::Base64'] = [UserData]::Transform($userDataStringOrFilepath)
    }
    UserData([bool] $useJoin, [string] $userDataStringOrFilepath) {
        Write-Debug "Creating UserData from [string] with UseJoin=$useJoin"
        $this['Fn::Base64'] = [UserData]::Transform($useJoin,$userDataStringOrFilepath)
    }
<#     UserData([object] $object) {
        Write-Debug "Creating UserData from [object]"
        $this['Fn::Base64'] = [FnJoin]::new([Environment]::NewLine,$object)
    } #>
    UserData([object[]] $objects) {
        Write-Debug "Creating UserData from [object[]]"
        $final = @()
        $tag = $null
        foreach ($o in $objects) {
            if ($o -is [string] -and (Test-Path $o)) {
                Write-Debug "Extracting script from file path: $o"
                $item = Get-Item $o
                $tag = switch -RegEx ($item.Extension) {
                    '^\.ps1$' {
                        "powershell"
                    }
                    '^\.(bat|cmd)$' {
                        "script"
                    }
                    default {
                        $null
                    }
                }
                [File]::ReadAllLines($item.FullName) | ForEach-Object {
                    $final += $_
                }
            }
            else {
                $final += $o
            }
        }
        if ($null -ne $tag -and ($final -join [Environment]::NewLine) -notmatch "\<$tag\>") {
            $final.Insert(0,"<$($tag)>") | Out-Null
            $final += "</$($tag)>"
        }
        $this['Fn::Base64'] = [FnJoin]::new([Environment]::NewLine,$final)
    }
    UserData([bool] $useJoin, [object[]] $objects) {
        Write-Debug "Creating UserData from [object[]] with UseJoin=$useJoin"
        if ($useJoin -or $null -ne ($objects | Where-Object {$_ -isnot [string]})) {
            $this['Fn::Base64'] = [FnJoin]::new([Environment]::NewLine,$objects)
        }
        else {
            Write-Debug "All objects are strings and UseJoin=$useJoin"
            $this['Fn::Base64'] = $objects -join [Environment]::NewLine
        }
    }
    UserData([UserData] $userData) {
        Write-Debug "Creating UserData from [UserData]"
        $this['Fn::Base64']  = $userData['Fn::Base64']
    }
}