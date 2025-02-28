# Anti-pattern: build-time options - these will be converted to runtime options in the future

# String description for each option
set( description "(no description added - see define_options.cmake)" )
set( GITR_USE_CUDA 1 CACHE STRING "${description}" )
set( GITR_USE_MPI 0 CACHE STRING "${description}" )
set( GITR_USE_DOUBLE 1 CACHE STRING "${description}" )
set( GITR_USE_IONIZATION 1 CACHE STRING "${description}" ) # if ionization is on, recombination on
set( GITR_USE_RECOMBINATION 1 CACHE STRING "${description}" )
set( GITR_USE_PERP_DIFFUSION 1 CACHE STRING "${description}" )
set( GITR_USE_COULOMB_COLLISIONS 1 CACHE STRING "${description}" ) # if collisions are on, friction, scattering, heating
set( GITR_USE_FRICTION 1 CACHE STRING "${description}" )
set( GITR_USE_ANGLE_SCATTERING 1 CACHE STRING "${description}" )
set( GITR_USE_HEATING 1 CACHE STRING "${description}" )
set( GITR_USE_THERMAL_FORCE 0 CACHE STRING "${description}" )
set( GITR_USE_SURFACE_MODEL 1 CACHE STRING "${description}" ) 
set( GITR_USE_SHEATH_EFIELD 1 CACHE STRING "${description}" )
set( GITR_BIASED_SURFACE 0 CACHE STRING "${description}" )
set( GITR_USE_SURFACE_POTENTIAL 0 CACHE STRING "${description}" )
set( GITR_USE_PRE_SHEATH_EFIELD 0 CACHE STRING "${description}" )
set( GITR_BFIELD_INTERP 0 CACHE STRING "${description}" )
set( GITR_LC_INTERP 0 CACHE STRING "${description}" )
set( GITR_GENERATE_LC 0 CACHE STRING "${description}" )
set( GITR_EFIELD_INTERP 0 CACHE STRING "${description}" )
set( GITR_PRE_SHEATH_INTERP 0 CACHE STRING "${description}" )
set( GITR_DENSITY_INTERP 0 CACHE STRING "${description}" )
set( GITR_TEMP_INTERP 0 CACHE STRING "${description}" )
set( GITR_FLOWV_INTERP 0 CACHE STRING "${description}" )
set( GITR_GRADT_INTERP 0 CACHE STRING "${description}" )
set( GITR_ODE_INT 0 CACHE STRING "${description}" )
set( GITR_FIXED_SEEDS 1 CACHE STRING "${description}" )
set( GITR_PARTICLE_SEEDS 1 CACHE STRING "${description}" )
set( GITR_GEOM_TRACE 0 CACHE STRING "${description}" )
set( GITR_GEOM_HASH 0 CACHE STRING "${description}" )
set( GITR_GEOM_HASH_SHEATH 0 CACHE STRING "${description}" )
set( GITR_PARTICLE_TRACKS 1 CACHE STRING "${description}" )
set( GITR_PARTICLE_SOURCE 0 CACHE STRING "${description}" )
set( GITR_PARTICLE_SOURCE_SPACE 0 CACHE STRING "${description}" )
set( GITR_PARTICLE_SOURCE_ENERGY 0 CACHE STRING "${description}" )
set( GITR_PARTICLE_SOURCE_ANGLE 0 CACHE STRING "${description}" )
set( GITR_PARTICLE_SOURCE_FILE 0 CACHE STRING "${description}" )
set( GITR_SPECTROSCOPY 2 CACHE STRING "${description}" )
set( GITR_USE_3DTET_GEOM 0 CACHE STRING "${description}" )
set( GITR_USE_CYLSYMM 0 CACHE STRING "${description}" )
set( GITR_USE_FIELD_ALIGNED_VALUES 0 CACHE STRING "${description}" )
set( GITR_FLUX_EA 1 CACHE STRING "${description}" )
set( GITR_FORCE_EVAL 0 CACHE STRING "${description}" )
set( GITR_USE_SORT 0 CACHE STRING "${description}" )
set( GITR_CHECK_COMPATIBILITY 1 CACHE STRING "${description}" )

add_compile_definitions( 
        USE_CUDA=${GITR_USE_CUDA}
        USE_MPI=${GITR_USE_MPI}
	USE_DOUBLE=${GITR_USE_DOUBLE}
        USEIONIZATION=${GITR_USE_IONIZATION}
        USERECOMBINATION=${GITR_USE_RECOMBINATION}
        USEPERPDIFFUSION=${GITR_USE_PERP_DIFFUSION}
        USECOULOMBCOLLISIONS=${GITR_USE_COULOMB_COLLISIONS}
        USEFRICTION=${GITR_USE_FRICTION}
        USEANGLESCATTERING=${GITR_USE_ANGLE_SCATTERING}
        USEHEATING=${GITR_USE_HEATING}
        USETHERMALFORCE=${GITR_USE_THERMAL_FORCE}
        USESURFACEMODEL=${GITR_USE_SURFACE_MODEL}
        USESHEATHEFIELD=${GITR_USE_SHEATH_EFIELD}
        BIASED_SURFACE=${GITR_BIASED_SURFACE}
        USE_SURFACE_POTENTIAL=${GITR_USE_SURFACE_POTENTIAL}
        USEPRESHEATHEFIELD=${GITR_USE_PRE_SHEATH_EFIELD}
        BFIELD_INTERP=${GITR_BFIELD_INTERP}
        LC_INTERP=${GITR_LC_INTERP}
        GENERATE_LC=${GITR_GENERATE_LC}
        EFIELD_INTERP=${GITR_EFIELD_INTERP}
        PRESHEATH_INTERP=${GITR_PRE_SHEATH_INTERP}
        DENSITY_INTERP=${GITR_DENSITY_INTERP}
        TEMP_INTERP=${GITR_TEMP_INTERP}
        FLOWV_INTERP=${GITR_FLOWV_INTERP}
        GRADT_INTERP=${GITR_GRADT_INTERP}
        ODEINT=${GITR_ODE_INT}
        FIXEDSEEDS=${GITR_FIXED_SEEDS}
        PARTICLESEEDS=${GITR_PARTICLE_SEEDS}
        GEOM_TRACE=${GITR_GEOM_TRACE}
        GEOM_HASH=${GITR_GEOM_HASH}
        GEOM_HASH_SHEATH=${GITR_GEOM_HASH_SHEATH}
        PARTICLE_TRACKS=${GITR_PARTICLE_TRACKS}
        PARTICLE_SOURCE=${GITR_PARTICLE_SOURCE}
        PARTICLE_SOURCE_SPACE=${GITR_PARTICLE_SOURCE_SPACE}
        PARTICLE_SOURCE_ENERGY=${GITR_PARTICLE_SOURCE_ENERGY}
        PARTICLE_SOURCE_ANGLE=${GITR_PARTICLE_SOURCE_ANGLE}
        PARTICLE_SOURCE_FILE=${GITR_PARTICLE_SOURCE_FILE}
        SPECTROSCOPY=${GITR_SPECTROSCOPY}
        USE3DTETGEOM=${GITR_USE_3DTET_GEOM}
        USECYLSYMM=${GITR_USE_CYLSYMM}
        USEFIELDALIGNEDVALUES=${GITR_USE_FIELD_ALIGNED_VALUES}
        FLUX_EA=${GITR_FLUX_EA}
        FORCE_EVAL=${GITR_FORCE_EVAL}
        USE_SORT=${GITR_USE_SORT}
        CHECK_COMPATIBILITY=${GITR_CHECK_COMPATIBILITY})
