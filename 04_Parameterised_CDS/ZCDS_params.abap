@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters concept'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_assoc 
with parameters p_mtart : mtart
as select from mara as _mat
{
  key _mat.matnr as Material,
  _mat.mtart as MaterialType,
  _mat.meins as UnitOfMeasurement,
  ltrim(_mat.matnr,'0') as MaterialNumber,
  
  case 
  when _mat.mtart = 'FERT' then 'Finished Product'
  else 'Other'
  end as MaterialCategory
}where _mat.mtart = $parameters.p_mtart
