<resource schema="ouspectra">
  <meta name="title">OUSpectra</meta>
  <meta name="creationDate">2019-07-03T01:02:03</meta>
  <meta name="description">
      The Open Universe XRT Spectra timing catalog.
  </meta>
  <meta name="creator.name">Paolo Giommi</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">X-ray sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">X-ray</meta>
  </meta>

  <meta name="source">
    2019 in preparation
  </meta>

  <table id="main" onDisk="True" mixin="//scs#q3cindex" primary="ID">
    <index columns="RA,Dec"/>

    <column name="ID" type="text"
        ucd="meta.id;meta.main"
        tablehead="Source id" verbLevel="1"
        description="Object ID"
        required="True"/>

   <column name="NAME" type="text"
      ucd="meta.id.cross;meta.main"
      tablehead="Source Name" verbLevel="1"
      description="Designation"
      required="True"/>

    <column name="RA" type="double precision"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="RA" verbLevel="1"
      description="Right ascension (J2000) of the object"
      required="True"/>

    <column name="Dec" type="double precision"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="Dec" verbLevel="1"
      description="Declination (J2000) of the object"
      required="True"/>

    <column name="Flux_soft" type="real"
      unit="erg sec-1 cm-2" ucd="phot.flux.density;em.X-ray"
      tablehead="Flux_soft" verbLevel="1"
      description="Flux at 0.5-2 keV"
      required="True"/>

    <column name="Flux_err_soft" type="real"
      unit="erg sec-1 cm-2" ucd="stat.error;phot.flux.density;em.X-ray"
      tablehead="Flux_err_soft" verbLevel="1"
      description="Flux error at 0.5-2 keV"
      required="True"/>

   <column name="Flux_hard" type="real"
      unit="erg sec-1 cm-2" ucd="phot.flux.density;em.X-ray"
      tablehead="Flux_hard" verbLevel="1"
      description="Flux at 2-10 keV"
      required="True"/>

   <column name="Flux_err_hard" type="real"
      unit="erg sec-1 cm-2" ucd="stat.error;phot.flux.density;em.X-ray"
      tablehead="Flux_err_hard" verbLevel="1"
      description="Flux error at 2-10 keV"
      required="True"/>

    <column name="Observation_time" type="double precision"
      unit="MJD" ucd="time.start"
      tablehead="Observation_time" verbLevel="1"
      description="observation time"
      required="True"/>

  </table>

  <data id="import">
    <sources>ouspec.fits</sources>

    <fitsTableGrammar/>

    <make table="main">
      <rowmaker idmaps="*"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">OUSpectra</meta>
    <meta name="shortName">ouspec cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

    <!--publish render="scs.xml" sets="ivo_managed"/-->
    <publish render="form" sets="local"/>
    <outputTable verbLevel="20"/>
  </service>

</resource>
