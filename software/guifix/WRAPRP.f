      REAL FUNCTION WRAPRP(P)
      REAL P(10)
      INTEGER*4 LBUF
      COMMON /DITTO/ LBUF
      REAL REFPAR
      EXTERNAL REFPAR

      WRAPRP = REFPAR(P,%val(LBUF))
      RETURN
      END