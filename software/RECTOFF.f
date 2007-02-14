C     LAST UPDATE 16/03/95
C+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C
      SUBROUTINE RECTOFF(RD,ZSIG,U,V,NP)
      IMPLICIT NONE
C
C Purpose: Transforms from (R,Z) space to (U,V) film space.
C
C Calls   0:
C Called by: REFPAR
C
C-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
C Parameters:
C
      INCLUDE 'FIXPAR.COM'
C   
C Array Arguments:
C
      REAL U(4),V(4)
C 
C Scalar Arguments:
C
      REAL RD,ZSIG
      INTEGER NP
C 
C Local Scalars:
C
      DOUBLE PRECISION TEMP,SCHI,CCHI,CMU,RMU,D,Z,CTILT,STILT,SRX,CRX,
     &                 SRY,CRY,DMU,CDMU,SDMU,D1,D2,D3
      INTEGER I,J
C
C Intrinsic Functions:
C
      INTRINSIC SIN,COS,ACOS,SQRT
C
C-----------------------------------------------------------------------
C
C========Need D and Z to calculate RMU and CHI
C
      D = SQRT(RD*RD+ZSIG*ZSIG)
      Z = ZSIG
C
C========Initialize U,V, 1-cos(2theta) and sines and cosines
C
      DO 5 I=1,4
         U(I) = 0.0
         V(I) = 0.0
 5    CONTINUE
      TEMP = WAVE*WAVE*D*D/2.0D0
      STILT = SIN(TILT)
      CTILT = COS(TILT)
      SRX = SIN(ROTX)
      CRX = COS(ROTX)
      SRY = SIN(ROTY)
      CRY = COS(ROTY)
      NP = 0
C
C========Look above and below equator
C
      DO 20 I=1,2
         SCHI = (WAVE*Z-STILT*TEMP)/CTILT
         IF(ABS(SCHI).LT.1.0D0)THEN
            CCHI = SQRT(1.0D0-SCHI*SCHI)
            CMU = (1.0D0-TEMP)/CCHI
            IF(ABS(CMU).LT.1.0D0)THEN
               RMU = ACOS(CMU)
C
C========Look left and right of meridian
C
               DO 10 J=1,2
                  NP = NP + 1
C
C========Modify RMU angle of diffracted beam for Z rotation of detector
C
                  DMU = RMU - ROTZ
                  CDMU = COS(DMU)
                  SDMU = SIN(DMU)
C
C========Calculate unit vector from sample to detector in detector
C========coordinate system by rotation of unit vector along X axis
C========in laboratory coordinate system
C
                  D1 =  CRY*CDMU*CCHI + SRY*SCHI
                  D2 = -CRX*SDMU*CCHI + SRX*SRY*CDMU*CCHI - SRX*CRY*SCHI
                  D3 = -SRX*SDMU*CCHI - CRX*SRY*CDMU*CCHI + CRX*CRY*SCHI
C
C========Scale up Y and Z components to give detector U and V
C
                  U(2*(I-1)+J) = SDD*D2/D1
                  V(2*(I-1)+J) = SDD*D3/D1
                  RMU = -RMU
 10            CONTINUE
            ENDIF
         ENDIF
         Z = -Z
 20   CONTINUE
C
      RETURN
      END
