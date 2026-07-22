define view entity Zcds_ventity1 as select from mara as _mat
left outer join makt as _text
on _mat.matnr = _text.matnr
and _text.spras = $session.system_language
{
    key _mat.matnr as Material,
    _mat.mtart as MaterialType,
    _text.maktx as MaterialDesc,
    
    ltrim(_mat.matnr,'0') as MaterialNumber,
    
    case
    when _mat.mtart = 'FERT' then 'Finished Product'
    when _mat.mtart = 'ROH' then 'Raw Material'
    else 'Others'
    end as MaterialCategory,
    length(_mat.matnr) as MaterialLength
    
}
