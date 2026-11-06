@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_RAP_EMPL'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_EMPL
  provider contract transactional_query
  as projection on ZR_RAP_EMPL
{
  key Empid,
      Fname,
      Lname,
      CntryKey,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt
}
