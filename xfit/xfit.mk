#########################################################################
#
#       MAKEFILE FOR STAND-ALONE XT CODE APPLICATION.  
#
#       EXECUTABLE      is the name of the executable to be created 
#       MAIN            is the .c file containing your main() function 
#       INTERFACES      is a list of the generated C code files
#       APP_OBJS        is a (possibly empty) list of the object code
#                       files that form the non-interface portion of
#                       your application
#
#       In the first three statements, the variables on the right 
#	of the equal sign will be replaced with their corresponding
#       values when the makefile is automatically generated.
#
#       This template is used for makefiles which do not reference 
#       the Ux runtime library.
#
#  	$Date$ 		$Revision$
#########################################################################


EXECUTABLE	= xfit
MAIN		= xfit.c
INTERFACES	= setupDialog.c \
	channelDialog.c \
	yDialog.c \
	tieDialog.c \
	confirmDialog.c \
	limitDialog.c \
	peakRowColumn.c \
	headerDialog.c \
	warningDialog.c \
	errorDialog.c \
	infoDialog.c \
	parRowColumn.c \
	continueDialog.c \
	fitShell.c 
 
LANGUAGE        = ANSI C
APPL_OBJS       = UxXt.o UxMethod.o fileSelect.o comm.o obFileSelect.o otokoFileSelect.o

SHELL		= /bin/sh

UX_DIR		= /usr/uimx2.6
UX_LIBPATH	= -L$(UX_DIR)/lib
X_LIBS		= -lXm -lXmu -lXt -lXpm -lX11

X_LIBPATH       = -L/usr/openwin/lib
MOTIF_LIBPATH   = 
X_CFLAGS        = -I/usr/openwin/include
MOTIF_CFLAGS    = -I/opt/SUNWmotif/include -DMOTIF 
KR_CC           = gcc
KR_CFLAGS       = -traditional -D_NO_PROTO 
ANSI_CC         = cc
ANSI_CFLAGS     = 
CPLUS_CC        = gcc
CPLUS_CFLAGS    = -xc++
CFLAGS          = -DSOLARIS -DXT_CODE -DXOPEN_CATALOG \
		  $(X_CFLAGS) $(MOTIF_CFLAGS) -USOLARIS_FORM_PATCH -g
UCB_LIBPATH	= /usr/ucblib
LIBPATH         = $(X_LIBPATH) $(MOTIF_LIBPATH) 
LIBS            = $(X_LIBS) -lm

OBJS = $(MAIN:.c=.o) $(INTERFACES:.c=.o) $(APPL_OBJS)

$(EXECUTABLE): $(OBJS)
	@echo Linking    $(EXECUTABLE)
	@$(ANSI_CC) $(OBJS) $(LIBPATH) $(LIBS) -o $(EXECUTABLE)
	@echo "Done"



.SUFFIXES: 
.SUFFIXES: .o .c .c

.c.o:
	@echo Compiling $< [$(LANGUAGE)] [XT-CODE]
	$(CC) -c $(CFLAGS) $< -o $@
.c.o:
	@echo Compiling $< [$(LANGUAGE)] [XT-CODE]
	$(CC) -c $(CFLAGS) $< -o $@


UxMethod.o: UxMethod.c
	@echo Compiling $< [ANSI-C] [XT-CODE]
	@$(ANSI_CC) $(ANSI_CFLAGS) $(CFLAGS) -c $< -o $@

CC = \
@`if [ "$(LANGUAGE)" = "C++" ]; then echo $(CPLUS_CC) $(CPLUS_CFLAGS);fi` \
`if [ "$(LANGUAGE)" = "ANSI C" ]; then echo $(ANSI_CC) $(ANSI_CFLAGS); fi`\
`if [ "$(LANGUAGE)" = "KR-C" ]; then echo $(KR_CC) $(KR_CFLAGS); fi`




LD = \
@`if [ "$(LANGUAGE)" = "C++" ]; then echo $(CPLUS_CC);fi` \
`if [ "$(LANGUAGE)" = "ANSI C" ]; then echo $(ANSI_CC); fi`\
`if [ "$(LANGUAGE)" = "KR-C" ]; then echo $(KR_CC); fi`

