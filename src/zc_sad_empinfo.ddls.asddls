@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_SAD_EMPINFO
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_SAD_EMPINFO
{
  key Id,
  Firstname,
  Lastname,
  Role,
  Taxrate,
  Salary,
  Age,
  Experience,
  Kids,
  CurContractStart,
  CurContractEnd,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt
  
}
