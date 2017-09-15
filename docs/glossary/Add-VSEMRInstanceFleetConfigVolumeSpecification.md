---
layout: glossary
title: Add-VSEMRInstanceFleetConfigVolumeSpecification
categories: glossary
label1: Category
data1: Documentation
label2: Depth
data2: Deep
---

# Add-VSEMRInstanceFleetConfigVolumeSpecification

## SYNOPSIS
Adds an AWS::EMR::InstanceFleetConfig.VolumeSpecification resource property to the template

## SYNTAX

```
Add-VSEMRInstanceFleetConfigVolumeSpecification [[-Iops] <Int32>] [-SizeInGB] <Int32> [-VolumeType] <Object>
```

## DESCRIPTION
Adds an AWS::EMR::InstanceFleetConfig.VolumeSpecification resource property to the template

## PARAMETERS

### -Iops
Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-instancefleetconfig-volumespecification.html#cfn-elasticmapreduce-instancefleetconfig-volumespecification-iops    
PrimitiveType: Integer    
Required: False    
UpdateType: Immutable

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SizeInGB
Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-instancefleetconfig-volumespecification.html#cfn-elasticmapreduce-instancefleetconfig-volumespecification-sizeingb    
PrimitiveType: Integer    
Required: True    
UpdateType: Immutable

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -VolumeType
Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-instancefleetconfig-volumespecification.html#cfn-elasticmapreduce-instancefleetconfig-volumespecification-volumetype    
PrimitiveType: String    
Required: True    
UpdateType: Immutable

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### VaporShell.Resource.EMR.InstanceFleetConfig.VolumeSpecification

## NOTES

## RELATED LINKS

[http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-instancefleetconfig-volumespecification.html](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-instancefleetconfig-volumespecification.html)
