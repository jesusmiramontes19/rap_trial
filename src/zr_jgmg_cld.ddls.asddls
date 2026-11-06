@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZJGMG_CLD'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_JGMG_CLD
  as select from ZJGMG_CLD
{
  key empid as Empid,
  fname as Fname,
  lname as Lname,
  cntry_key as CntryKey,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
