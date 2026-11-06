@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZJGMG_CLD'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_RAP_EMPL
  as select from zjgmg_cld
{
  key empid                 as Empid,
      fname                 as Fname,
      lname                 as Lname,
      cntry_key             as CntryKey,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt
}
