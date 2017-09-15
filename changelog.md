---
layout: page 
title: Change Log
description: Changes within each release of VaporShell and plans/ideas for the future 
---
<!-- TOC -->

- [Upcoming](#upcoming)
    - [In-Progress](#in-progress)
    - [Long-Term](#long-term)
- [Historical](#historical)
    - [1.2.2](#122)
    - [1.2.0](#120)
    - [1.1.5](#115)
    - [1.1.0](#110)
    - [1.0.0](#100)
    - [0.7.10](#0710)
    - [0.7.9](#079)
    - [0.7.8](#078)
    - [0.7.7](#077)
    - [0.7.6](#076)
    - [0.7.5](#075)
    - [0.7.4](#074)
    - [0.7.3](#073)
    - [0.7.2](#072)

<!-- /TOC -->

***

## Upcoming

### In-Progress

- [Issue #3](https://github.com/scrthq/VaporShell/issues/3): Enable external config files for template reuse across environments

### Long-Term

- Add support for other Cloud Providers such as Google Cloud Platform, Azure


***

## Historical

### 1.2.2

- Updated module manifest description for PSGallery
- Updated Resource and Property Types to include new entries from AWS Specifications
- Updated Convert-SpecToFunction to clean up bool attribute addition (intermittent conversion from bool to string) and also leverage $PSBoundParameters (slight speed and cleanliness boost)


### 1.2.0

- Restored Coveralls coverage in Pester tests
- Adjusted Export-VaporShell -ValidateTemplate to use file:// for the templateBody vs fileb:// (errors during Travis tests on Linux)


### 1.1.5

- Fixed default Powershell JSON output formatting when using ConvertTo-Json; default formatting caused a large template to exceed CloudFormation's limits due to the extra spacing. Added in the private function `Format-Json` and set the default output to be cleaned up in `Export-VaporShell`


### 1.1.0

- Added `Update-VSResourceFunctions`
- Updated all Resource and Property Type functions

### 1.0.0

- Added full YAML support for import and export via leveraging `cfn-flip` from awslabs
- All functional issues resolved, ready to declare v1!  


### 0.7.10

- Added full Serverless coverage
- Expanded `Add-UserData` functionality to detect ps1, bat & cmd files and tag them if needed


### 0.7.9

- Fixed issue where List parameters with single values were being cast as a single string/object instead of an array with a single string/object


### 0.7.8

- Added `-ValidateTemplate` parameter to leverage `aws cloudformation validate-template` for syntax validation


### 0.7.7

- AppVeyor config updates


### 0.7.6 

- Added in FunctionBuilder and finished building all resource and resource property types


### 0.7.5 

- Added `Add-UserData`


### 0.7.4 

- Added Coveralls.io code coverage grading to CI process


### 0.7.3

- Expanded AppVeyor tests


### 0.7.2

- Updated module minor version to 7