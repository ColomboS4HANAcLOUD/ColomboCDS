@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista extrae el nit del socio'
define view entity Z_SOCIOS_BALANCE as select from I_Businesspartnertaxnumber as BPT
inner join I_BusinessPartner  as BP on BP.BusinessPartner = BPT.BusinessPartner
{
    key right( BPT.BusinessPartner,8 ) as Socio ,
    key BPT.BPTaxType,
    BPT.BPTaxNumber as NitSN,
    BPT.BPTaxLongNumber,
    BPT.AuthorizationGroup,
    BPT.BusinessPartner,
    BP.BPLastNameSearchHelp as NombreSN,
    BP.BusinessPartner as SocioBP

}
