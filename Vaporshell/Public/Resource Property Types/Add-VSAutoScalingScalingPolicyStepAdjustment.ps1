function Add-VSAutoScalingScalingPolicyStepAdjustment {
    <#
    .SYNOPSIS
        Adds an AWS::AutoScaling::ScalingPolicy.StepAdjustment resource property to the template

    .DESCRIPTION
        Adds an AWS::AutoScaling::ScalingPolicy.StepAdjustment resource property to the template

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-stepadjustments.html

    .PARAMETER MetricIntervalLowerBound
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-stepadjustments.html#cfn-autoscaling-scalingpolicy-stepadjustment-metricintervallowerbound
		PrimitiveType: Double
		Required: False
		UpdateType: Mutable

    .PARAMETER MetricIntervalUpperBound
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-stepadjustments.html#cfn-autoscaling-scalingpolicy-stepadjustment-metricintervalupperbound
		PrimitiveType: Double
		Required: False
		UpdateType: Mutable

    .PARAMETER ScalingAdjustment
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-stepadjustments.html#cfn-autoscaling-scalingpolicy-stepadjustment-scalingadjustment
		PrimitiveType: Integer
		Required: True
		UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.AutoScaling.ScalingPolicy.StepAdjustment')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        [System.Double]
        $MetricIntervalLowerBound,
        [parameter(Mandatory = $false)]
        [System.Double]
        $MetricIntervalUpperBound,
        [parameter(Mandatory = $true)]
        [Int]
        $ScalingAdjustment
    )
    Begin {
        $obj = [PSCustomObject]@{}
    }
    Process {
        foreach ($key in $PSBoundParameters.Keys) {
            $val = $((Get-Variable $key).Value)
            if ($val -eq "True") {
                $val = "true"
            }
            elseif ($val -eq "False") {
                $val = "false"
            }
            $obj | Add-Member -MemberType NoteProperty -Name $key -Value $val
        }
    }
    End {
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.AutoScaling.ScalingPolicy.StepAdjustment'
    }
}