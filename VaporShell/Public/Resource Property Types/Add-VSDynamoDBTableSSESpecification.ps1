﻿function Add-VSDynamoDBTableSSESpecification {
    <#
    .SYNOPSIS
        Adds an AWS::DynamoDB::Table.SSESpecification resource property to the template

    .DESCRIPTION
        Adds an AWS::DynamoDB::Table.SSESpecification resource property to the template

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dynamodb-table-ssespecification.html

    .PARAMETER SSEEnabled
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dynamodb-table-ssespecification.html#cfn-dynamodb-table-ssespecification-sseenabled    
		PrimitiveType: Boolean    
		Required: True    
		UpdateType: Mutable    

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.DynamoDB.Table.SSESpecification')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $true)]
        [System.Boolean]
        $SSEEnabled
    )
    Begin {
        $obj = [PSCustomObject]@{}
    }
    Process {
        foreach ($key in $PSBoundParameters.Keys) {
            $obj | Add-Member -MemberType NoteProperty -Name $key -Value $PSBoundParameters.$key
        }
    }
    End {
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.DynamoDB.Table.SSESpecification'
    }
}