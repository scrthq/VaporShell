class FnJoin : IntrinsicFunction {
    static [string] Help() {
        return (Get-Help -Name 'Add-FnJoin' | Out-String)
    }

    static [string] Help([string] $scope) {
        $params = @{Name = 'Add-FnJoin'}
        switch -Regex ($scope) {
            '^F(u|ull){0,1}' {
                $params["Full"] = $true
            }
            '^D(e|etail){0,1}' {
                $params["Detailed"] = $true
            }
            '^E(x|xample){0,1}' {
                $params["Examples"] = $true
            }
            '^O(n|nline){0,1}$' {
                $params["Online"] = $true
            }
        }
        return (Get-Help @params | Out-String)
    }

    static [void] Docs() {
        Start-Process 'http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html'
    }

    [string] ToString() {
        return "FnJoin($($this['Fn::Join']))"
    }

    FnJoin() {}

    FnJoin(
        [string] $delimiter,
        [object[]] $listOfValues
    ) {
        $validTypes = @([string], [int], [IntrinsicFunction], [ConditionFunction])
        foreach ($value in $listOfValues) {
            $isValid = foreach ($type in $validTypes) {
                if ($value -is $type) {
                    $true
                    break
                }
            }
            if (-not $isValid) {
                throw [VSError]::InvalidType($value, $validTypes)
            }
        }
        $this['Fn::Join'] = @($delimiter, @($listOfValues))
    }
}