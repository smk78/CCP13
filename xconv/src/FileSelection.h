
/*******************************************************************************
       FileSelection.h
       This header file is included by FileSelection.cc

*******************************************************************************/

#ifndef	_FILESELECTION_INCLUDED
#define	_FILESELECTION_INCLUDED

#include <stdio.h>

#ifdef MOTIF
#include <Xm/Xm.h>
#include <Xm/MwmUtil.h>
#include <Xm/DialogS.h>
#include <Xm/MenuShell.h>
#endif /* MOTIF */

#include "UxXt.h"

/*******************************************************************************
       For C++, the method macros translate a method call on an interface
       swidget into a member function call on the interface object.
*******************************************************************************/

#ifndef FileSelection_set
#define FileSelection_set( UxThis, pEnv, sw1, Filter1, title1, mustmatch, editable, type1, mult1, bsl1 ) \
	(((_UxCFileSelection *) UxGetContext(UxThis))->set( pEnv, sw1, Filter1, title1, mustmatch, editable, type1, mult1, bsl1 ))
#endif

#ifndef XKLOADDS
#define XKLOADDS
#endif /* XKLOADDS */

/*******************************************************************************
       The definition of the interface class.
       If you create multiple copies of your interface, the class
       ensures that your callbacks use the variables for the
       correct copy.

       For each swidget in the interface, each argument to the Interface
       function, and each variable in the Interface Specific section of the
       Declarations Editor, there is an entry in the class protected section.
       Additionally, methods generated by the builder are declared as 
       virtual. Wrapper functions are generated for callbacks and actions
       to call the user defined callbacks or actions. A UxDestroyContextCB()
       is also generated to ensure a proper clean up of the class after
       the toplevel is destroyed.
*******************************************************************************/

class _UxCFileSelection: public _UxCInterface
{

// Generated Class Members

public:

	// Constructor Function
	_UxCFileSelection( swidget UxParent );

	// Destructor Function
	~_UxCFileSelection();

	// Interface Function
	Widget	_create_FileSelection( void );


	// User Defined Methods
	virtual void set( Environment * pEnv, swidget *sw1, char *Filter1, char *title1, Boolean mustmatch, Boolean editable, int type1, int mult1, int bsl1 );

protected:

	// Widgets in the interface
	Widget	FileSelection;

	// Interface Specific Variables
	Widget	selection;
	Widget	filelist;
	Widget	filtertxt;
	swidget	*sw;
	int	type;
	int	mult;
	int	bsl;

	// Arg List of creation function
	swidget	UxParent;

	// Callbacks and their wrappers
	virtual void  okCallback_FileSelection(Widget, XtPointer, XtPointer);
	static void  Wrap_okCallback_FileSelection(Widget, XtPointer, XtPointer);
	virtual void  cancelCB_FileSelection(Widget, XtPointer, XtPointer);
	static void  Wrap_cancelCB_FileSelection(Widget, XtPointer, XtPointer);
	virtual void  noMatchCB_FileSelection(Widget, XtPointer, XtPointer);
	static void  Wrap_noMatchCB_FileSelection(Widget, XtPointer, XtPointer);

	// Callback function to destroy the context
	static void  UxDestroyContextCB(Widget, XtPointer, XtPointer);


	// User Defined Methods

private:
	Widget _build();
	CPLUS_ADAPT_CONTEXT(_UxCFileSelection)

	// User Defined Methods


// User Supplied Class Members

} ;


/*******************************************************************************
       Declarations of global functions.
*******************************************************************************/

Widget	create_FileSelection( swidget UxParent );

#endif	/* _FILESELECTION_INCLUDED */
