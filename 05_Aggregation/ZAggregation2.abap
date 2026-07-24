@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for join in view entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zcds_ventity1 as select from ekpo as _item
{
    key _item.matnr as MaterialNumber,
    sum(cast(_item.menge as abap.dec(15,2))) as TotalQuantity,
    count(*) as ItemCount
    
}group by _item.matnr

having 
sum(_item.menge 
) > 500
