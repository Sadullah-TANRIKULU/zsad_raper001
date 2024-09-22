@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_SAD_EMPINFO
  as select from ZSAD_EMPINFO as Empinfo
{
  key id as Id,
  firstname as Firstname,
  lastname as Lastname,
  role as Role,
  taxrate as Taxrate,
  salary as Salary,
  age as Age,
  experience as Experience,
  kids as Kids,
  cur_contract_start as CurContractStart,
  cur_contract_end as CurContractEnd,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
