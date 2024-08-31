@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Final Balance HBT'
define view entity Z_INFORME_BALANCE_TERCEROS_HBT 
with parameters
     FechaInicio : z_fechaini,
    FechaFin    : z_fechafin as
     select from Z_BALANCE_PRUEBA_TERCEROS_HBT( FechaInicio: $parameters.FechaInicio , FechaFin: $parameters.FechaFin ) 
    --as select from Z_BALANCE_PRUEBA_TERCEROS_HBT( FechaInicio: '20240101' , FechaFin: '20240522' ) 
{
   key Cuenta,
    --DigitoC,
    --Longitud,
    --Nivel_Cuenta,
    
    Nombre_Cajon as NombreCuenta,
    SaldoInicial,
    Debito,
    Credito,
    (SaldoInicial + Debito - Credito ) as SaldoFinal,
    AccountingDocument,
    substring(Linea,5,6) as Linea,    
    NIT,
    Codigo,
    substring(Nombre,1,18) as Nombre,
    PostingDate as FechaContabilizacion,
    CompanyCode,
    --FiscalYear,
    --FiscalPeriod,
    --TransactionCurrency,
    Centro,
    ProfitCenter as CentroBeneficio,
    --PartnerProfitCenter,
    CostCenter as CentroCosto,
    TaxCode as CodigoImpuesto
    --ReferenceDocumentItem
    
    
}

where Longitud != 8 and Longitud != 10
