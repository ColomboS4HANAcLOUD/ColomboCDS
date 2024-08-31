@EndUserText.label: 'Saldos iniciales por cuenta'
define view entity Z_SALDOS_INICIALES
  with parameters
    FechaInicial : z_fechaini
  as select from I_JournalEntry     as EncabezadoAsiento
    inner join   I_JournalEntryItem as lineaAsiento on EncabezadoAsiento.AccountingDocument = lineaAsiento.AccountingDocument

{

  key EncabezadoAsiento.CompanyCode,

  key EncabezadoAsiento.FiscalYear,
  key lineaAsiento.LedgerGLLineItem,
      lineaAsiento.GLAccount,
      EncabezadoAsiento.PostingDate,
      case when lineaAsiento.DebitCreditCode = 'S' then sum(cast( lineaAsiento.AmountInTransactionCurrency as abap.dec(18,2) ) )
      else 0
      end as Debito,

      case when lineaAsiento.DebitCreditCode = 'H' then sum(cast( lineaAsiento.AmountInTransactionCurrency as abap.dec(18,2) ) )
      else 0
      end as Credito




}
where
  EncabezadoAsiento.PostingDate <= $parameters.FechaInicial
    and lineaAsiento.Ledger = '0L'
group by
  EncabezadoAsiento.AccountingDocument,
  EncabezadoAsiento.CompanyCode,

  EncabezadoAsiento.FiscalYear,
  lineaAsiento.LedgerGLLineItem,
  lineaAsiento.GLAccount,
  lineaAsiento.DebitCreditCode,
  EncabezadoAsiento.PostingDate
