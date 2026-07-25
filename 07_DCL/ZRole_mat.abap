@EndUserText.label: 'Material Authorization Role'
@MappingRole: true
define role ZROLE_MAT { 
grant
        select
            on
                Zcds_dcl
                
                    where
                        MTART = 'ZCOM'
                        or MTART = 'ZRAW';
                        
}
