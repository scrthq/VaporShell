---
layout: glossary
title: Get-VSS3ObjectMetadata
categories: glossary
label1: Category
data1: Documentation
label2: Depth
data2: Deep
---

# Get-VSS3ObjectMetadata

## SYNOPSIS
Gets an S3 object's metadata

## SYNTAX

```
Get-VSS3ObjectMetadata [-BucketName] <String> [-Key] <String> [-ProfileName <String>]
```

## DESCRIPTION
{{Fill in the Description}}

## PARAMETERS

### -BucketName
The name of the bucket containing the object.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Key
The name (including prefix, if applicable) of the object.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProfileName
The name of the configuration profile to deploy the stack with.
Defaults to $env:AWS_PROFILE, if set.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: $env:AWS_PROFILE
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
