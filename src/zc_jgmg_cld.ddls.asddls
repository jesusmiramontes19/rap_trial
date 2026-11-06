@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZJGMG_CLD'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_JGMG_CLD
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_JGMG_CLD
  association [1..1] to ZR_JGMG_CLD as _BaseEntity on $projection.EMPID = _BaseEntity.EMPID
{
  key Empid,
  Fname,
  Lname,
  CntryKey,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
