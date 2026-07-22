@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for join in view entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zcds_ventity1 as select from ekko as _header
inner join ekpo as _item
on _header.ebeln = _item.ebeln

inner join mara as _mat
on _item.matnr = _mat.matnr
{
    key _header.ebeln as DocNumber,
    key _item.ebelp as ItemNumber,
    _header.lifnr as VendorNumber,
    _item.matnr as Material,
    _mat.mtart as MaterialType,
    cast(_item.menge as abap.dec(15,2)) as quantity,
    
    ltrim(_item.matnr,'0') as MaterialNumber,
    case _mat.mtart
    when 'FERT' then 'Finished Product'
    when 'ROH' then 'Raw Material'
    else 'Others'
    end as MaterailCategory,
    
    case 
    when cast(_item.menge as abap.dec(15,2)) > 100 then 'Bulk'
    else 'Regular'
    end as QuantityCategory  
    
}
