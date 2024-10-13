pragma solidity 0.7.2;

//package java.awt


import "java/awt/event.sol";

import "java/awt/geom/Path2D.sol";

import "java/awt/geom/Point2D.sol";

import "java/awt/im/InputContext.sol";

import "java/awt/image/BufferStrategy.sol";

import "java/awt/image/BufferedImage.sol";

import "java/awt/peer/ComponentPeer.sol";

import "java/awt/peer/WindowPeer.sol";

import "java/beans/PropertyChangeListener.sol";

import "java/io/IOException.sol";

import "java/io/ObjectInputStream.sol";

import "java/io/ObjectOutputStream.sol";

import "java/io/OptionalDataException.sol";

import "java/io/Serializable.sol";

import "java/lang/ref/WeakReference.sol";

import "java/lang/reflect/InvocationTargetException.sol";

import "java/security/AccessController.sol";

import "java/util/ArrayList.sol";

import "java/util/Arrays.sol";

import "java/util/EventListener.sol";

import "java/util/Locale.sol";

import "java/util/ResourceBundle.sol";

import "java/util/Set.sol";

import "java/util/Vector.sol";

import "java/util/concurrent/atomic/AtomicBoolean.sol";

import "javax/accessibility.sol";

import "sun/awt/AWTAccessor.sol";

import "sun/awt/AppContext.sol";

import "sun/awt/CausedFocusEvent.sol";

import "sun/awt/SunToolkit.sol";

import "sun/awt/util/IdentityArrayList.sol";

import "sun/java2d/Disposer.sol";

import "sun/java2d/pipe/Region.sol";

import "sun/security/action/GetPropertyAction.sol";

import "sun/security/util/SecurityConstants.sol";

import "sun/util/logging/PlatformLogger.sol";

/**
 * A {@code Window} object is a top-level window with no borders and no
 * menubar.
 * The default layout for a window is {@code BorderLayout}.
 * <p>
 * A window must have either a frame, dialog, or another window defined as its
 * owner when it's constructed.
 * <p>
 * In a multi-screen environment, you can create a {@code Window}
 * on a different screen device by constructing the {@code Window}
 * with {@link #Window(Window, GraphicsConfiguration)}.  The
 * {@code GraphicsConfiguration} object is one of the
 * {@code GraphicsConfiguration} objects of the target screen device.
 * <p>
 * In a virtual device multi-screen environment in which the desktop
 * area could span multiple physical screen devices, the bounds of all
 * configurations are relative to the virtual device coordinate system.
 * The origin of the virtual-coordinate system is at the upper left-hand
 * corner of the primary physical screen.  Depending on the location of
 * the primary screen in the virtual device, negative coordinates are
 * possible, as shown in the following figure.
 * <p>
 * <img src="doc-files/MultiScreen.gif"
 * alt="Diagram shows virtual device containing 4 physical screens. Primary physical screen shows coords (0,0), other screen shows (-80,-100)."
 * style="float:center; margin: 7px 10px;">
 * <p>
 * In such an environment, when calling {@code setLocation},
 * you must pass a virtual coordinate to this method.  Similarly,
 * calling {@code getLocationOnScreen} on a {@code Window} returns
 * virtual device coordinates.  Call the {@code getBounds} method
 * of a {@code GraphicsConfiguration} to find its origin in the virtual
 * coordinate system.
 * <p>
 * The following code sets the location of a {@code Window}
 * at (10, 10) relative to the origin of the physical screen
 * of the corresponding {@code GraphicsConfiguration}.  If the
 * bounds of the {@code GraphicsConfiguration} is not taken
 * into account, the {@code Window} location would be set
 * at (10, 10) relative to the virtual-coordinate system and would appear
 * on the primary physical screen, which might be different from the
 * physical screen of the specified {@code GraphicsConfiguration}.
 *
 * <pre>
 *      Window w = new Window(Window owner, GraphicsConfiguration gc);
 *      Rectangle bounds = gc.getBounds();
 *      w.setLocation(10 + bounds.x, 10 + bounds.y);
 * </pre>
 *
 * <p>
 * Note: the location and size of top-level windows (including
 * {@code Window}s, {@code Frame}s, and {@code Dialog}s)
 * are under the control of the desktop's window management system.
 * Calls to {@code setLocation}, {@code setSize}, and
 * {@code setBounds} are requests (not directives) which are
 * forwarded to the window management system.  Every effort will be
 * made to honor such requests.  However, in some cases the window
 * management system may ignore such requests, or modify the requested
 * geometry in order to place and size the {@code Window} in a way
 * that more closely matches the desktop settings.
 * <p>
 * Due to the asynchronous nature of native event handling, the results
 * returned by {@code getBounds}, {@code getLocation},
 * {@code getLocationOnScreen}, and {@code getSize} might not
 * reflect the actual geometry of the Window on screen until the last
 * request has been processed.  During the processing of subsequent
 * requests these values might change accordingly while the window
 * management system fulfills the requests.
 * <p>
 * An application may set the size and location of an invisible
 * {@code Window} arbitrarily, but the window management system may
 * subsequently change its size and/or location when the
 * {@code Window} is made visible. One or more {@code ComponentEvent}s
 * will be generated to indicate the new geometry.
 * <p>
 * Windows are capable of generating the following WindowEvents:
 * WindowOpened, WindowClosed, WindowGainedFocus, WindowLostFocus.
 *
 * @author      Sami Shaio
 * @author      Arthur van Hoff
 * @see WindowEvent
 * @see #addWindowListener
 * @see java.awt.BorderLayout
 * @since       JDK1.0
 */

contract Window
{
	/**
 * This represents the warning message that is
 * to be displayed in a non secure window. ie :
 * a window that has a security manager installed that denies
 * {@code AWTPermission("showWindowWithoutWarningBanner")}.
 * This message can be displayed anywhere in the window.
 *
 * @serial
 * @see #getWarningString
 */

	string warningString;

	/**
 * {@code icons} is the graphical way we can
 * represent the frames and dialogs.
 * {@code Window} can't display icon but it's
 * being inherited by owned {@code Dialog}s.
 *
 * @serial
 * @see #getIconImages
 * @see #setIconImages
 */

	List transient  icons;

	/**
 * Holds the reference to the component which last had focus in this window
 * before it lost focus.
 */

	Component transient  temporaryLostComponent;

	bool static  systemSyncLWRequests = bool(false);

	bool syncLWRequests = bool(false);

	bool transient  beforeFirstShow = bool(true);

	bool transient  disposing = bool(false);

	WindowDisposerRecord transient  disposerRecord;

	int32 static  immutable OPENED = int32(0x01);

	/**
 * An Integer value representing the Window State.
 *
 * @serial
 * @since 1.2
 * @see #show
 */

	int32 state;

	/**
 * A boolean value representing Window always-on-top state
 * @since 1.5
 * @serial
 * @see #setAlwaysOnTop
 * @see #isAlwaysOnTop
 */

	bool private  alwaysOnTop;

	/**
 * Contains all the windows that have a peer object associated,
 * i. e. between addNotify() and removeNotify() calls. The list
 * of all Window instances can be obtained from AppContext object.
 *
 * @since 1.6
 */

	IdentityArrayList static  immutable allWindows;

	/**
 * A vector containing all the windows this
 * window currently owns.
 * @since 1.2
 * @see #getOwnedWindows
 */

	Vector transient  ownedWindowList;

	/*
     * We insert a weak reference into the Vector of all Windows in AppContext
     * instead of 'this' so that garbage collection can still take place
     * correctly.
     */

	WeakReference transient  weakThis;

	bool transient  showWithParent;

	/**
 * Contains the modal dialog that blocks this window, or null
 * if the window is unblocked.
 *
 * @since 1.6
 */

	Dialog transient  modalBlocker;

	/**
 * @serial
 *
 * @see java.awt.Dialog.ModalExclusionType
 * @see #getModalExclusionType
 * @see #setModalExclusionType
 *
 * @since 1.6
 */

	ModalExclusionType modalExclusionType;

	WindowListener transient  windowListener;

	WindowStateListener transient  windowStateListener;

	WindowFocusListener transient  windowFocusListener;

	InputContext transient  inputContext;

	Object transient  inputContextLock;

	/**
 * Unused. Maintained for serialization backward-compatibility.
 *
 * @serial
 * @since 1.2
 */

	FocusManager private  focusMgr;

	/**
 * Indicates whether this Window can become the focused Window.
 *
 * @serial
 * @see #getFocusableWindowState
 * @see #setFocusableWindowState
 * @since 1.4
 */

	bool private  focusableWindowState = bool(true);

	/**
 * Indicates whether this window should receive focus on
 * subsequently being shown (with a call to {@code setVisible(true)}), or
 * being moved to the front (with a call to {@code toFront()}).
 *
 * @serial
 * @see #setAutoRequestFocus
 * @see #isAutoRequestFocus
 * @since 1.7
 */

	bool volatile  autoRequestFocus = bool(true);

	/*
     * Indicates that this window is being shown. This flag is set to true at
     * the beginning of show() and to false at the end of show().
     *
     * @see #show()
     * @see Dialog#shouldBlock
     */

	bool transient  isInShow = bool(false);

	/**
 * The opacity level of the window
 *
 * @serial
 * @see #setOpacity(float)
 * @see #getOpacity()
 * @since 1.7
 */

	int32 private  opacity = int32(1);

	/**
 * The shape assigned to this window. This field is set to {@code null} if
 * no shape is set (rectangular window).
 *
 * @serial
 * @see #getShape()
 * @see #setShape(Shape)
 * @since 1.7
 */

	Shape private  shape;

	string static  immutable base = string("win");

	int32 static  nameCounter = int32(0);

	/*
     * JDK 1.1 serialVersionUID
     */

	int64 static  immutable serialVersionUID;

	PlatformLogger static  immutable log = PlatformLogger(.getLogger("java.awt.Window"));

	bool static  immutable locationByPlatformProp;

	bool transient  isTrayIconWindow = bool(false);

	/**
 * These fields are initialized in the native peer code
 * or via AWTAccessor's WindowAccessor.
 */

	int32 volatile  securityWarningWidth = int32(0);

	int32 volatile  securityWarningHeight = int32(0);

	/**
 * These fields represent the desired location for the security
 * warning if this window is untrusted.
 * See com.sun.awt.SecurityWarning for more details.
 */

	int64 transient  securityWarningPointX = int64(2);

	int64 transient  securityWarningPointY = int64(0);

	int32 transient  securityWarningAlignmentX = int32(RIGHT_ALIGNMENT);

	int32 transient  securityWarningAlignmentY = int32(TOP_ALIGNMENT);

	/**
 * Initialize JNI field and method IDs for fields that may be
 *       accessed from C.
 */

	function initIDs() virtual external;

	Object transient  anchor;

	function initGC(GraphicsConfiguration gc) private returns(GraphicsConfiguration)
	{
			.checkHeadless();
			if()
			{
					gc = .getLocalGraphicsEnvironment().getDefaultScreenDevice().getDefaultConfiguration();
			}
			return gc;
	}

	function init(GraphicsConfiguration gc) private
	{
			.checkHeadless();
			syncLWRequests = systemSyncLWRequests;
			;
			addToWindowList();
			setWarningString();
			 = .getPredefinedCursor(Cursor.DEFAULT_CURSOR);
			 = false;
			;
			if(.getDevice().getType() != GraphicsDevice.TYPE_RASTER_SCREEN)
			{
			}
			/* and any insets                                              */

			Rectangle screenBounds = Rectangle(.getBounds());
			Insets screenInsets;
			int32 x = int32(getX() + screenBounds.x + screenInsets.left);
			int32 y = int32(getY() + screenBounds.y + screenInsets.top);
			if(x !=  || y != )
			{
					setLocation(x, y);
			}
			modalExclusionType = Dialog.ModalExclusionType.NO_EXCLUDE;
			;
	}

	function ownedInit(Window owner) private
	{
			 = owner;
			if()
			{
					.addOwnedWindow(weakThis);
					if(.isAlwaysOnTop())
					{
								//try

									setAlwaysOnTop(true);

								/* catch (SecurityException ignore) {
}*/


					}
			}
			// WindowDisposerRecord requires a proper value of parent field.

			.updateOwner();
	}

	/**
 * Construct a name for this component.  Called by getName() when the
 * name is null.
 */

	function constructComponentName() internal returns(String)
	{
	}

	/**
 * Returns the sequence of images to be displayed as the icon for this window.
 * <p>
 * This method returns a copy of the internally stored list, so all operations
 * on the returned object will not affect the window's behavior.
 *
 * @return    the copy of icon images' list for this window, or
 *            empty list if this window doesn't have icon images.
 * @see       #setIconImages
 * @see       #setIconImage(Image)
 * @since     1.6
 */

	function getIconImages() public returns(List)
	{
			List icons = List();
			if( || .size() == 0)
			{
					return 
			}
			return 
	}

	/**
 * Sets the sequence of images to be displayed as the icon
 * for this window. Subsequent calls to {@code getIconImages} will
 * always return a copy of the {@code icons} list.
 * <p>
 * Depending on the platform capabilities one or several images
 * of different dimensions will be used as the window's icon.
 * <p>
 * The {@code icons} list is scanned for the images of most
 * appropriate dimensions from the beginning. If the list contains
 * several images of the same size, the first will be used.
 * <p>
 * Ownerless windows with no icon specified use platfrom-default icon.
 * The icon of an owned window may be inherited from the owner
 * unless explicitly overridden.
 * Setting the icon to {@code null} or empty list restores
 * the default behavior.
 * <p>
 * Note : Native windowing systems may use different images of differing
 * dimensions to represent a window, depending on the context (e.g.
 * window decoration, window list, taskbar, etc.). They could also use
 * just a single image for all contexts or no image at all.
 *
 * @param     icons the list of icon images to be displayed.
 * @see       #getIconImages()
 * @see       #setIconImage(Image)
 * @since     1.6
 */

	function setIconImages(List icons) public
	{
			;
			WindowPeer peer = WindowPeer(WindowPeer());
			if()
			{
					.updateIconImages();
			}
	}

	/**
 * Sets the image to be displayed as the icon for this window.
 * <p>
 * This method can be used instead of {@link #setIconImages setIconImages()}
 * to specify a single image as a window's icon.
 * <p>
 * The following statement:
 * <pre>
 *     setIconImage(image);
 * </pre>
 * is equivalent to:
 * <pre>
 *     ArrayList&lt;Image&gt; imageList = new ArrayList&lt;Image&gt;();
 *     imageList.add(image);
 *     setIconImages(imageList);
 * </pre>
 * <p>
 * Note : Native windowing systems may use different images of differing
 * dimensions to represent a window, depending on the context (e.g.
 * window decoration, window list, taskbar, etc.). They could also use
 * just a single image for all contexts or no image at all.
 *
 * @param     image the icon image to be displayed.
 * @see       #setIconImages
 * @see       #getIconImages()
 * @since     1.6
 */

	function setIconImage(Image image) public
	{
			ArrayList imageList;
			if()
			{
			}
			setIconImages(imageList);
	}

	/**
 * Makes this Window displayable by creating the connection to its
 * native screen resource.
 * This method is called internally by the toolkit and should
 * not be called directly by programs.
 * @see Component#isDisplayable
 * @see Container#removeNotify
 * @since JDK1.0
 */

	function addNotify() public
	{
	}

	/**
 * {@inheritDoc}
 */

	function removeNotify() public
	{
	}

	/**
 * Causes this Window to be sized to fit the preferred size
 * and layouts of its subcomponents. The resulting width and
 * height of the window are automatically enlarged if either
 * of dimensions is less than the minimum size as specified
 * by the previous call to the {@code setMinimumSize} method.
 * <p>
 * If the window and/or its owner are not displayable yet,
 * both of them are made displayable before calculating
 * the preferred size. The Window is validated after its
 * size is being calculated.
 *
 * @see Component#isDisplayable
 * @see #setMinimumSize
 */

	function pack() public
	{
			Container parent = Container();
			if( && )
			{
					.addNotify();
			}
			if()
			{
					addNotify();
			}
			Dimension newSize = Dimension(getPreferredSize());
			if()
			{
					setClientSize(newSize.width, newSize.height);
			}
			if(beforeFirstShow)
			{
					isPacked = true;
			}
			validateUnconditionally();
	}

	/**
 * Sets the minimum size of this window to a constant
 * value.  Subsequent calls to {@code getMinimumSize}
 * will always return this value. If current window's
 * size is less than {@code minimumSize} the size of the
 * window is automatically enlarged to honor the minimum size.
 * <p>
 * If the {@code setSize} or {@code setBounds} methods
 * are called afterwards with a width or height less than
 * that was specified by the {@code setMinimumSize} method
 * the window is automatically enlarged to meet
 * the {@code minimumSize} value. The {@code minimumSize}
 * value also affects the behaviour of the {@code pack} method.
 * <p>
 * The default behavior is restored by setting the minimum size
 * parameter to the {@code null} value.
 * <p>
 * Resizing operation may be restricted if the user tries
 * to resize window below the {@code minimumSize} value.
 * This behaviour is platform-dependent.
 *
 * @param minimumSize the new minimum size of this window
 * @see Component#setMinimumSize
 * @see #getMinimumSize
 * @see #isMinimumSizeSet
 * @see #setSize(Dimension)
 * @see #pack
 * @since 1.6
 */

	function setMinimumSize(Dimension minimumSize) public
	{
	}

	/**
 * {@inheritDoc}
 * <p>
 * The {@code d.width} and {@code d.height} values
 * are automatically enlarged if either is less than
 * the minimum size as specified by previous call to
 * {@code setMinimumSize}.
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that corresponds closely to the desktop settings.
 *
 * @see #getSize
 * @see #setBounds
 * @see #setMinimumSize
 * @since 1.6
 */

	function setSize(Dimension d) public
	{
	}

	/**
 * {@inheritDoc}
 * <p>
 * The {@code width} and {@code height} values
 * are automatically enlarged if either is less than
 * the minimum size as specified by previous call to
 * {@code setMinimumSize}.
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that corresponds closely to the desktop settings.
 *
 * @see #getSize
 * @see #setBounds
 * @see #setMinimumSize
 * @since 1.6
 */

	function setSize(int32 width, int32 height) public
	{
	}

	/**
 * {@inheritDoc}
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that corresponds closely to the desktop settings.
 */

	function setLocation(int32 x, int32 y) public
	{
	}

	/**
 * {@inheritDoc}
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that corresponds closely to the desktop settings.
 */

	function setLocation(Point p) public
	{
	}

	/**
 * @deprecated As of JDK version 1.1,
 * replaced by {@code setBounds(int, int, int, int)}.
 */

	function reshape(int32 x, int32 y, int32 width, int32 height) public
	{
			if(isMinimumSizeSet())
			{
					Dimension minSize = Dimension(getMinimumSize());
					if(width < minSize.width)
					{
							width = minSize.width;
					}
					if(height < minSize.height)
					{
							height = minSize.height;
					}
			}
	}

	function setClientSize(int32 w, int32 h) internal
	{
	}

	AtomicBoolean private  immutable beforeFirstWindowShown;

	/**
 * Shows or hides this {@code Window} depending on the value of parameter
 * {@code b}.
 * <p>
 * If the method shows the window then the window is also made
 * focused under the following conditions:
 * <ul>
 * <li> The {@code Window} meets the requirements outlined in the
 *      {@link #isFocusableWindow} method.
 * <li> The {@code Window}'s {@code autoRequestFocus} property is of the {@code true} value.
 * <li> Native windowing system allows the {@code Window} to get focused.
 * </ul>
 * There is an exception for the second condition (the value of the
 * {@code autoRequestFocus} property). The property is not taken into account if the
 * window is a modal dialog, which blocks the currently focused window.
 * <p>
 * Developers must never assume that the window is the focused or active window
 * until it receives a WINDOW_GAINED_FOCUS or WINDOW_ACTIVATED event.
 * @param b  if {@code true}, makes the {@code Window} visible,
 * otherwise hides the {@code Window}.
 * If the {@code Window} and/or its owner
 * are not yet displayable, both are made displayable.  The
 * {@code Window} will be validated prior to being made visible.
 * If the {@code Window} is already visible, this will bring the
 * {@code Window} to the front.<p>
 * If {@code false}, hides this {@code Window}, its subcomponents, and all
 * of its owned children.
 * The {@code Window} and its subcomponents can be made visible again
 * with a call to {@code #setVisible(true)}.
 * @see java.awt.Component#isDisplayable
 * @see java.awt.Component#setVisible
 * @see java.awt.Window#toFront
 * @see java.awt.Window#dispose
 * @see java.awt.Window#setAutoRequestFocus
 * @see java.awt.Window#isFocusableWindow
 */

	function setVisible(bool b) public
	{
	}

	/**
 * Makes the Window visible. If the Window and/or its owner
 * are not yet displayable, both are made displayable.  The
 * Window will be validated prior to being made visible.
 * If the Window is already visible, this will bring the Window
 * to the front.
 * @see       Component#isDisplayable
 * @see       #toFront
 * @deprecated As of JDK version 1.5, replaced by
 * {@link #setVisible(boolean)}.
 */

	function show() public
	{
			if()
			{
					addNotify();
			}
			validateUnconditionally();
			isInShow = true;
			if(visible)
			{
					toFront();
			}
			else
			{
					beforeFirstShow = false;
					closeSplashScreen();
					for(int32 i = int32(0); i < .size(); i++)
					{
							Window child = Window(.elementAt(i).get());
							if(() && child.showWithParent)
							{
									.show();
									child.showWithParent = false;
							}
					}
					// endfor

					if(!isModalBlocked();)
					{
							updateChildrenBlocking();
					}
					else
					{
							// should be raised to front

							.toFront_NoClientCode();
					}

					if()
					{
					}
			}

			isInShow = false;
			// If first time shown, generate WindowOpened event

			if((state & OPENED) == 0)
			{
					postWindowEvent(WindowEvent.WINDOW_OPENED);
					state |= OPENED;
			}
	}

	function updateChildFocusableWindowState(Window w) internal
	{
			if( && .isShowing())
			{
					(WindowPeer(.getPeer())).updateFocusableWindowState();
			}
			for(int32 i = int32(0); i < w.ownedWindowList.size(); i++)
			{
					Window child = Window(w.ownedWindowList.elementAt(i).get());
					if()
					{
							updateChildFocusableWindowState(child);
					}
			}
	}

	/**
 * Hide this Window, its subcomponents, and all of its owned children.
 * The Window and its subcomponents can be made visible again
 * with a call to {@code show}.
 * @see #show
 * @see #dispose
 * @deprecated As of JDK version 1.5, replaced by
 * {@link #setVisible(boolean)}.
 */

	function hide() public
	{
			if(isModalBlocked())
			{
			}
	}

	/**
 * Releases all of the native screen resources used by this
 * {@code Window}, its subcomponents, and all of its owned
 * children. That is, the resources for these {@code Component}s
 * will be destroyed, any memory they consume will be returned to the
 * OS, and they will be marked as undisplayable.
 * <p>
 * The {@code Window} and its subcomponents can be made displayable
 * again by rebuilding the native resources with a subsequent call to
 * {@code pack} or {@code show}. The states of the recreated
 * {@code Window} and its subcomponents will be identical to the
 * states of these objects at the point where the {@code Window}
 * was disposed (not accounting for additional modifications between
 * those actions).
 * <p>
 * <b>Note</b>: When the last displayable window
 * within the Java virtual machine (VM) is disposed of, the VM may
 * terminate.  See <a href="doc-files/AWTThreadIssues.html#Autoshutdown">
 * AWT Threading Issues</a> for more information.
 * @see Component#isDisplayable
 * @see #pack
 * @see #show
 */

	function dispose() public
	{
			doDispose();
	}

	/*
     * Fix for 4872170.
     * If dispose() is called on parent then its children have to be disposed as well
     * as reported in javadoc. So we need to implement this functionality even if a
     * child overrides dispose() in a wrong way without calling super.dispose().
     */

	function disposeImpl() internal
	{
			dispose();
			if()
			{
					doDispose();
			}
	}

	function doDispose() internal
	{
			bool fireWindowClosedEvent = bool(isDisplayable());
			DisposeAction action;
			if(.isDispatchThread())
			{
					.run();
			}
			else
			{
						//try


						/* catch (InterruptedException e) {
    System.err.println("Disposal was interrupted:");
    e.printStackTrace();
}*/

						/* catch (InvocationTargetException e) {
    System.err.println("Exception during disposal:");
    e.printStackTrace();
}*/


			}

			// on the EventQueue anyways.

			if(fireWindowClosedEvent)
			{
					postWindowEvent(WindowEvent.WINDOW_CLOSED);
			}
	}

	/*
     * Should only be called while holding the tree lock.
     * It's overridden here because parent == owner in Window,
     * and we shouldn't adjust counter on owner
     */

	function adjustListeningChildrenOnParent(int64 mask, int32 num) internal
	{
	}

	// Should only be called while holding tree lock

	function adjustDecendantsOnParent(int32 num) internal
	{
	}

	/**
 * If this Window is visible, brings this Window to the front and may make
 * it the focused Window.
 * <p>
 * Places this Window at the top of the stacking order and shows it in
 * front of any other Windows in this VM. No action will take place if this
 * Window is not visible. Some platforms do not allow Windows which own
 * other Windows to appear on top of those owned Windows. Some platforms
 * may not permit this VM to place its Windows above windows of native
 * applications, or Windows of other VMs. This permission may depend on
 * whether a Window in this VM is already focused. Every attempt will be
 * made to move this Window as high as possible in the stacking order;
 * however, developers should not assume that this method will move this
 * Window above all other windows in every situation.
 * <p>
 * Developers must never assume that this Window is the focused or active
 * Window until this Window receives a WINDOW_GAINED_FOCUS or WINDOW_ACTIVATED
 * event. On platforms where the top-most window is the focused window, this
 * method will <b>probably</b> focus this Window (if it is not already focused)
 * under the following conditions:
 * <ul>
 * <li> The window meets the requirements outlined in the
 *      {@link #isFocusableWindow} method.
 * <li> The window's property {@code autoRequestFocus} is of the
 *      {@code true} value.
 * <li> Native windowing system allows the window to get focused.
 * </ul>
 * On platforms where the stacking order does not typically affect the focused
 * window, this method will <b>probably</b> leave the focused and active
 * Windows unchanged.
 * <p>
 * If this method causes this Window to be focused, and this Window is a
 * Frame or a Dialog, it will also become activated. If this Window is
 * focused, but it is not a Frame or a Dialog, then the first Frame or
 * Dialog that is an owner of this Window will be activated.
 * <p>
 * If this window is blocked by modal dialog, then the blocking dialog
 * is brought to the front and remains above the blocked window.
 *
 * @see       #toBack
 * @see       #setAutoRequestFocus
 * @see       #isFocusableWindow
 */

	function toFront() public
	{
			toFront_NoClientCode();
	}

	/**
 * If this Window is visible, sends this Window to the back and may cause
 * it to lose focus or activation if it is the focused or active Window.
 * <p>
 * Places this Window at the bottom of the stacking order and shows it
 * behind any other Windows in this VM. No action will take place is this
 * Window is not visible. Some platforms do not allow Windows which are
 * owned by other Windows to appear below their owners. Every attempt will
 * be made to move this Window as low as possible in the stacking order;
 * however, developers should not assume that this method will move this
 * Window below all other windows in every situation.
 * <p>
 * Because of variations in native windowing systems, no guarantees about
 * changes to the focused and active Windows can be made. Developers must
 * never assume that this Window is no longer the focused or active Window
 * until this Window receives a WINDOW_LOST_FOCUS or WINDOW_DEACTIVATED
 * event. On platforms where the top-most window is the focused window,
 * this method will <b>probably</b> cause this Window to lose focus. In
 * that case, the next highest, focusable Window in this VM will receive
 * focus. On platforms where the stacking order does not typically affect
 * the focused window, this method will <b>probably</b> leave the focused
 * and active Windows unchanged.
 *
 * @see       #toFront
 */

	function toBack() public
	{
			toBack_NoClientCode();
	}

	/**
 * Returns the toolkit of this frame.
 * @return    the toolkit of this window.
 * @see       Toolkit
 * @see       Toolkit#getDefaultToolkit
 * @see       Component#getToolkit
 */

	function getToolkit() public returns(Toolkit)
	{
			return .getDefaultToolkit();
	}

	/**
 * Gets the warning string that is displayed with this window.
 * If this window is insecure, the warning string is displayed
 * somewhere in the visible area of the window. A window is
 * insecure if there is a security manager and the security
 * manager denies
 * {@code AWTPermission("showWindowWithoutWarningBanner")}.
 * <p>
 * If the window is secure, then {@code getWarningString}
 * returns {@code null}. If the window is insecure, this
 * method checks for the system property
 * {@code awt.appletWarning}
 * and returns the string value of that property.
 * @return    the warning string for this window.
 */

	function getWarningString() public returns(String)
	{
			return warningString;
	}

	function setWarningString() private
	{
			;
			SecurityManager sm = SecurityManager(.getSecurityManager());
			if()
			{
						//try

							.checkPermission(SecurityConstants.AWT.TOPLEVEL_WINDOW_PERMISSION);

						/* catch (SecurityException se) {
    // make sure the privileged action is only
    // for getting the property! We don't want the
    // above checkPermission call to always succeed!
    warningString = AccessController.doPrivileged(new GetPropertyAction("awt.appletWarning", "Java Applet Window"));
}*/


			}
	}

	/**
 * Gets the {@code Locale} object that is associated
 * with this window, if the locale has been set.
 * If no locale has been set, then the default locale
 * is returned.
 * @return    the locale that is set for this window.
 * @see       java.util.Locale
 * @since     JDK1.1
 */

	function getLocale() public returns(Locale)
	{
			if()
			{
					return .getDefault();
			}
			return ;
	}

	/**
 * Gets the input context for this window. A window always has an input context,
 * which is shared by subcomponents unless they create and set their own.
 * @see Component#getInputContext
 * @since 1.2
 */

	function getInputContext() public returns(InputContext)
	{
			return inputContext;
	}

	/**
 * Set the cursor image to a specified cursor.
 * <p>
 * The method may have no visual effect if the Java platform
 * implementation and/or the native system do not support
 * changing the mouse cursor shape.
 * @param     cursor One of the constants defined
 *            by the {@code Cursor} class. If this parameter is null
 *            then the cursor for this window will be set to the type
 *            Cursor.DEFAULT_CURSOR.
 * @see       Component#getCursor
 * @see       Cursor
 * @since     JDK1.1
 */

	function setCursor(Cursor cursor) public
	{
			if()
			{
					cursor = .getPredefinedCursor(Cursor.DEFAULT_CURSOR);
			}
	}

	/**
 * Returns the owner of this window.
 * @since 1.2
 */

	function getOwner() public returns(Window)
	{
			return getOwner_NoClientCode();
	}

	function isModalBlocked() internal returns(bool)
	{
			return ;
	}

	function setModalBlocked(Dialog blocker, bool blocked, bool peerCall) internal
	{
			;
			if(peerCall)
			{
					WindowPeer peer = WindowPeer(WindowPeer());
					if()
					{
					}
			}
	}

	function getModalBlocker() internal returns(Dialog)
	{
			return modalBlocker;
	}

	/*
     * Returns a list of all displayable Windows, i. e. all the
     * Windows which peer is not null.
     *
     * @see #addNotify
     * @see #removeNotify
     */

	function getAllWindows() internal returns(IdentityArrayList)
	{
	}

	function getAllUnblockedWindows() internal returns(IdentityArrayList)
	{
	}

	function getDocumentRoot() internal returns(Window)
	{
	}

	/**
 * Specifies the modal exclusion type for this window. If a window is modal
 * excluded, it is not blocked by some modal dialogs. See {@link
 * java.awt.Dialog.ModalExclusionType Dialog.ModalExclusionType} for
 * possible modal exclusion types.
 * <p>
 * If the given type is not supported, {@code NO_EXCLUDE} is used.
 * <p>
 * Note: changing the modal exclusion type for a visible window may have no
 * effect until it is hidden and then shown again.
 *
 * @param exclusionType the modal exclusion type for this window; a {@code null}
 *     value is equivalent to {@link Dialog.ModalExclusionType#NO_EXCLUDE
 *     NO_EXCLUDE}
 * @throws SecurityException if the calling thread does not have permission
 *     to set the modal exclusion property to the window with the given
 *     {@code exclusionType}
 * @see java.awt.Dialog.ModalExclusionType
 * @see java.awt.Window#getModalExclusionType
 * @see java.awt.Toolkit#isModalExclusionTypeSupported
 *
 * @since 1.6
 */

	function setModalExclusionType(ModalExclusionType exclusionType) public
	{
			if()
			{
					exclusionType = Dialog.ModalExclusionType.NO_EXCLUDE;
			}
			if(
			if(modalExclusionType == exclusionType)
			{
					return 
			}
			if(exclusionType == Dialog.ModalExclusionType.TOOLKIT_EXCLUDE)
			{
					SecurityManager sm = SecurityManager(.getSecurityManager());
					if()
					{
							.checkPermission(SecurityConstants.AWT.TOOLKIT_MODALITY_PERMISSION);
					}
			}
			modalExclusionType = exclusionType;
	}

	/**
 * Returns the modal exclusion type of this window.
 *
 * @return the modal exclusion type of this window
 *
 * @see java.awt.Dialog.ModalExclusionType
 * @see java.awt.Window#setModalExclusionType
 *
 * @since 1.6
 */

	function getModalExclusionType() public returns(ModalExclusionType)
	{
			return modalExclusionType;
	}

	function isModalExcluded(ModalExclusionType exclusionType) internal returns(bool)
	{
			if(() && )
			{
					return true;
			}
			Window owner = Window(getOwner_NoClientCode());
			return ;
	}

	function updateChildrenBlocking() internal
	{
			Vector childHierarchy;
			for(int32 i = int32(0); i < ownedWindows.length; i++)
			{
					.add(ownedWindows[uint256(i)]);
			}
			int32 k = int32(0);
			while(k < .size())
			{
					Window w = Window(.get(k));
					if(.isVisible())
					{
							if(.isModalBlocked())
							{
									Dialog blocker = Dialog(.getModalBlocker());
									.unblockWindow(w);
							}
							.checkShouldBeBlocked(w);
							for(int32 j = int32(0); j < wOwned.length; j++)
							{
									.add(wOwned[uint256(j)]);
							}
					}
					k++;

			}
	}

	/**
 * Adds the specified window listener to receive window events from
 * this window.
 * If l is null, no exception is thrown and no action is performed.
 * <p>Refer to <a href="doc-files/AWTThreadIssues.html#ListenersThreads"
 * >AWT Threading Issues</a> for details on AWT's threading model.
 *
 * @param   l the window listener
 * @see #removeWindowListener
 * @see #getWindowListeners
 */

	function addWindowListener(WindowListener l) public
	{
			if()
			{
					return 
			}
			newEventsOnly = true;
			;
	}

	/**
 * Adds the specified window state listener to receive window
 * events from this window.  If {@code l} is {@code null},
 * no exception is thrown and no action is performed.
 * <p>Refer to <a href="doc-files/AWTThreadIssues.html#ListenersThreads"
 * >AWT Threading Issues</a> for details on AWT's threading model.
 *
 * @param   l the window state listener
 * @see #removeWindowStateListener
 * @see #getWindowStateListeners
 * @since 1.4
 */

	function addWindowStateListener(WindowStateListener l) public
	{
			if()
			{
					return 
			}
			;
			newEventsOnly = true;
	}

	/**
 * Adds the specified window focus listener to receive window events
 * from this window.
 * If l is null, no exception is thrown and no action is performed.
 * <p>Refer to <a href="doc-files/AWTThreadIssues.html#ListenersThreads"
 * >AWT Threading Issues</a> for details on AWT's threading model.
 *
 * @param   l the window focus listener
 * @see #removeWindowFocusListener
 * @see #getWindowFocusListeners
 * @since 1.4
 */

	function addWindowFocusListener(WindowFocusListener l) public
	{
			if()
			{
					return 
			}
			;
			newEventsOnly = true;
	}

	/**
 * Removes the specified window listener so that it no longer
 * receives window events from this window.
 * If l is null, no exception is thrown and no action is performed.
 * <p>Refer to <a href="doc-files/AWTThreadIssues.html#ListenersThreads"
 * >AWT Threading Issues</a> for details on AWT's threading model.
 *
 * @param   l the window listener
 * @see #addWindowListener
 * @see #getWindowListeners
 */

	function removeWindowListener(WindowListener l) public
	{
			if()
			{
					return 
			}
			;
	}

	/**
 * Removes the specified window state listener so that it no
 * longer receives window events from this window.  If
 * {@code l} is {@code null}, no exception is thrown and
 * no action is performed.
 * <p>Refer to <a href="doc-files/AWTThreadIssues.html#ListenersThreads"
 * >AWT Threading Issues</a> for details on AWT's threading model.
 *
 * @param   l the window state listener
 * @see #addWindowStateListener
 * @see #getWindowStateListeners
 * @since 1.4
 */

	function removeWindowStateListener(WindowStateListener l) public
	{
			if()
			{
					return 
			}
			;
	}

	/**
 * Removes the specified window focus listener so that it no longer
 * receives window events from this window.
 * If l is null, no exception is thrown and no action is performed.
 * <p>Refer to <a href="doc-files/AWTThreadIssues.html#ListenersThreads"
 * >AWT Threading Issues</a> for details on AWT's threading model.
 *
 * @param   l the window focus listener
 * @see #addWindowFocusListener
 * @see #getWindowFocusListeners
 * @since 1.4
 */

	function removeWindowFocusListener(WindowFocusListener l) public
	{
			if()
			{
					return 
			}
			;
	}

	// REMIND: remove when filtering is handled at lower level

	function eventEnabled(AWTEvent e) internal returns(bool)
	{
			do
			{
					bool void = bool(false);
					if(void || (e.id == WindowEvent.WINDOW_OPENED))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_CLOSING))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_CLOSED))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_ICONIFIED))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_DEICONIFIED))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_ACTIVATED))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_DEACTIVATED))
					{
							void = true;
							if((eventMask & AWTEvent.WINDOW_EVENT_MASK) != 0 || )
							{
									return true;
							}
							return false;
					}
					if(void || (e.id == WindowEvent.WINDOW_GAINED_FOCUS))
					{
							void = true;
					}
					if(void || (e.id == WindowEvent.WINDOW_LOST_FOCUS))
					{
							void = true;
							if((eventMask & AWTEvent.WINDOW_FOCUS_EVENT_MASK) != 0 || )
							{
									return true;
							}
							return false;
					}
					if(void || (e.id == WindowEvent.WINDOW_STATE_CHANGED))
					{
							void = true;
							if((eventMask & AWTEvent.WINDOW_STATE_EVENT_MASK) != 0 || )
							{
									return true;
							}
							return false;
					}
						break;


			}while(false);
			return 
	}

	/**
 * Processes events on this window. If the event is an
 * {@code WindowEvent}, it invokes the
 * {@code processWindowEvent} method, else it invokes its
 * superclass's {@code processEvent}.
 * <p>Note that if the event parameter is {@code null}
 * the behavior is unspecified and may result in an
 * exception.
 *
 * @param e the event
 */

	function processEvent(AWTEvent e) internal
	{
	}

	/**
 * Processes window events occurring on this window by
 * dispatching them to any registered WindowListener objects.
 * NOTE: This method will not be called unless window events
 * are enabled for this component; this happens when one of the
 * following occurs:
 * <ul>
 * <li>A WindowListener object is registered via
 *     {@code addWindowListener}
 * <li>Window events are enabled via {@code enableEvents}
 * </ul>
 * <p>Note that if the event parameter is {@code null}
 * the behavior is unspecified and may result in an
 * exception.
 *
 * @param e the window event
 * @see Component#enableEvents
 */

	function processWindowEvent(WindowEvent e) internal
	{
			WindowListener listener = WindowListener(windowListener);
			if()
			{
					do
					{
							bool void = bool(false);
							if(void || (.getID() == WindowEvent.WINDOW_OPENED))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_CLOSING))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_CLOSED))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_ICONIFIED))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_DEICONIFIED))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_ACTIVATED))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_DEACTIVATED))
							{
									void = true;
									break;
							}
								break;


					}while(false);
			}
	}

	/**
 * Processes window focus event occurring on this window by
 * dispatching them to any registered WindowFocusListener objects.
 * NOTE: this method will not be called unless window focus events
 * are enabled for this window. This happens when one of the
 * following occurs:
 * <ul>
 * <li>a WindowFocusListener is registered via
 *     {@code addWindowFocusListener}
 * <li>Window focus events are enabled via {@code enableEvents}
 * </ul>
 * <p>Note that if the event parameter is {@code null}
 * the behavior is unspecified and may result in an
 * exception.
 *
 * @param e the window focus event
 * @see Component#enableEvents
 * @since 1.4
 */

	function processWindowFocusEvent(WindowEvent e) internal
	{
			WindowFocusListener listener = WindowFocusListener(windowFocusListener);
			if()
			{
					do
					{
							bool void = bool(false);
							if(void || (.getID() == WindowEvent.WINDOW_GAINED_FOCUS))
							{
									void = true;
									break;
							}
							if(void || (.getID() == WindowEvent.WINDOW_LOST_FOCUS))
							{
									void = true;
									break;
							}
								break;


					}while(false);
			}
	}

	/**
 * Processes window state event occurring on this window by
 * dispatching them to any registered {@code WindowStateListener}
 * objects.
 * NOTE: this method will not be called unless window state events
 * are enabled for this window.  This happens when one of the
 * following occurs:
 * <ul>
 * <li>a {@code WindowStateListener} is registered via
 *    {@code addWindowStateListener}
 * <li>window state events are enabled via {@code enableEvents}
 * </ul>
 * <p>Note that if the event parameter is {@code null}
 * the behavior is unspecified and may result in an
 * exception.
 *
 * @param e the window state event
 * @see java.awt.Component#enableEvents
 * @since 1.4
 */

	function processWindowStateEvent(WindowEvent e) internal
	{
			WindowStateListener listener = WindowStateListener(windowStateListener);
			if()
			{
					do
					{
							bool void = bool(false);
							if(void || (.getID() == WindowEvent.WINDOW_STATE_CHANGED))
							{
									void = true;
									break;
							}
								break;


					}while(false);
			}
	}

	/**
 * Implements a debugging hook -- checks to see if
 * the user has typed <i>control-shift-F1</i>.  If so,
 * the list of child windows is dumped to {@code System.out}.
 * @param e  the keyboard event
 */

	function preProcessKeyEvent(KeyEvent e) internal
	{
			// Dump the list of child windows to System.out.

			if(.isActionKey() && .getKeyCode() == KeyEvent.VK_F1 && .isControlDown() && .isShiftDown() && .getID() == KeyEvent.KEY_PRESSED)
			{
					list(System.out, 0);
			}
	}

	function postProcessKeyEvent(KeyEvent e) internal
	{
	}

	/**
 * Sets whether this window should always be above other windows.  If
 * there are multiple always-on-top windows, their relative order is
 * unspecified and platform dependent.
 * <p>
 * If some other window is already always-on-top then the
 * relative order between these windows is unspecified (depends on
 * platform).  No window can be brought to be over the always-on-top
 * window except maybe another always-on-top window.
 * <p>
 * All windows owned by an always-on-top window inherit this state and
 * automatically become always-on-top.  If a window ceases to be
 * always-on-top, the windows that it owns will no longer be
 * always-on-top.  When an always-on-top window is sent {@link #toBack
 * toBack}, its always-on-top state is set to {@code false}.
 *
 * <p> When this method is called on a window with a value of
 * {@code true}, and the window is visible and the platform
 * supports always-on-top for this window, the window is immediately
 * brought forward, "sticking" it in the top-most position. If the
 * window isn`t currently visible, this method sets the always-on-top
 * state to {@code true} but does not bring the window forward.
 * When the window is later shown, it will be always-on-top.
 *
 * <p> When this method is called on a window with a value of
 * {@code false} the always-on-top state is set to normal. It may also
 * cause an unspecified, platform-dependent change in the z-order of
 * top-level windows, but other always-on-top windows will remain in
 * top-most position. Calling this method with a value of {@code false}
 * on a window that has a normal state has no effect.
 *
 * <p><b>Note</b>: some platforms might not support always-on-top
 * windows.  To detect if always-on-top windows are supported by the
 * current platform, use {@link Toolkit#isAlwaysOnTopSupported()} and
 * {@link Window#isAlwaysOnTopSupported()}.  If always-on-top mode
 * isn't supported for this window or this window's toolkit does not
 * support always-on-top windows, calling this method has no effect.
 * <p>
 * If a SecurityManager is installed, the calling thread must be
 * granted the AWTPermission "setWindowAlwaysOnTop" in
 * order to set the value of this property. If this
 * permission is not granted, this method will throw a
 * SecurityException, and the current value of the property will
 * be left unchanged.
 *
 * @param alwaysOnTop true if the window should always be above other
 *        windows
 * @throws SecurityException if the calling thread does not have
 *         permission to set the value of always-on-top property
 *
 * @see #isAlwaysOnTop
 * @see #toFront
 * @see #toBack
 * @see AWTPermission
 * @see #isAlwaysOnTopSupported
 * @see #getToolkit
 * @see Toolkit#isAlwaysOnTopSupported
 * @since 1.5
 */

	function setAlwaysOnTop(bool alwaysOnTop) public
	{
			SecurityManager security = SecurityManager(.getSecurityManager());
			if()
			{
					.checkPermission(SecurityConstants.AWT.SET_WINDOW_ALWAYS_ON_TOP_PERMISSION);
			}
			bool oldAlwaysOnTop;
			if(oldAlwaysOnTop != alwaysOnTop)
			{
					if(isAlwaysOnTopSupported())
					{
							WindowPeer peer = WindowPeer(WindowPeer());
					}
			}
			for(uint256 iterator_var = uint256(0); iterator_var < ownedWindowList.length; iterator_var++)
			{
					WeakReference ref = WeakReference(ownedWindowList[uint256(iterator_var)]);
					Window window = Window(.get());
					if()
					{
								//try


								/* catch (SecurityException ignore) {
}*/


					}
			}
	}

	/**
 * Returns whether the always-on-top mode is supported for this
 * window. Some platforms may not support always-on-top windows, some
 * may support only some kinds of top-level windows; for example,
 * a platform may not support always-on-top modal dialogs.
 *
 * @return {@code true}, if the always-on-top mode is supported for
 *         this window and this window's toolkit supports always-on-top windows,
 *         {@code false} otherwise
 *
 * @see #setAlwaysOnTop(boolean)
 * @see #getToolkit
 * @see Toolkit#isAlwaysOnTopSupported
 * @since 1.6
 */

	function isAlwaysOnTopSupported() public returns(bool)
	{
			return .getDefaultToolkit().isAlwaysOnTopSupported();
	}

	/**
 * Returns whether this window is an always-on-top window.
 * @return {@code true}, if the window is in always-on-top state,
 *         {@code false} otherwise
 * @see #setAlwaysOnTop
 * @since 1.5
 */

	function isAlwaysOnTop() public returns(bool)
	{
			return alwaysOnTop;
	}

	/**
 * Returns the child Component of this Window that has focus if this Window
 * is focused; returns null otherwise.
 *
 * @return the child Component with focus, or null if this Window is not
 *         focused
 * @see #getMostRecentFocusOwner
 * @see #isFocused
 */

	function getFocusOwner() public returns(Component)
	{
			return 
	}

	/**
 * Returns the child Component of this Window that will receive the focus
 * when this Window is focused. If this Window is currently focused, this
 * method returns the same Component as {@code getFocusOwner()}. If
 * this Window is not focused, then the child Component that most recently
 * requested focus will be returned. If no child Component has ever
 * requested focus, and this is a focusable Window, then this Window's
 * initial focusable Component is returned. If no child Component has ever
 * requested focus, and this is a non-focusable Window, null is returned.
 *
 * @return the child Component that will receive focus when this Window is
 *         focused
 * @see #getFocusOwner
 * @see #isFocused
 * @see #isFocusableWindow
 * @since 1.4
 */

	function getMostRecentFocusOwner() public returns(Component)
	{
			if(isFocused())
			{
					return getFocusOwner();
			}
			else
			{
					Component mostRecent;
					if()
					{
							return mostRecent;
					}
					else
					{
							return 
					}

			}

	}

	/**
 * Returns whether this Window is active. Only a Frame or a Dialog may be
 * active. The native windowing system may denote the active Window or its
 * children with special decorations, such as a highlighted title bar. The
 * active Window is always either the focused Window, or the first Frame or
 * Dialog that is an owner of the focused Window.
 *
 * @return whether this is the active Window.
 * @see #isFocused
 * @since 1.4
 */

	function isActive() public returns(bool)
	{
			return ();
	}

	/**
 * Returns whether this Window is focused. If there exists a focus owner,
 * the focused Window is the Window that is, or contains, that focus owner.
 * If there is no focus owner, then no Window is focused.
 * <p>
 * If the focused Window is a Frame or a Dialog it is also the active
 * Window. Otherwise, the active Window is the first Frame or Dialog that
 * is an owner of the focused Window.
 *
 * @return whether this is the focused Window.
 * @see #isActive
 * @since 1.4
 */

	function isFocused() public returns(bool)
	{
			return ();
	}

	/**
 * Gets a focus traversal key for this Window. (See {@code
 * setFocusTraversalKeys} for a full description of each key.)
 * <p>
 * If the traversal key has not been explicitly set for this Window,
 * then this Window's parent's traversal key is returned. If the
 * traversal key has not been explicitly set for any of this Window's
 * ancestors, then the current KeyboardFocusManager's default traversal key
 * is returned.
 *
 * @param id one of KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS,
 *         KeyboardFocusManager.BACKWARD_TRAVERSAL_KEYS,
 *         KeyboardFocusManager.UP_CYCLE_TRAVERSAL_KEYS, or
 *         KeyboardFocusManager.DOWN_CYCLE_TRAVERSAL_KEYS
 * @return the AWTKeyStroke for the specified key
 * @see Container#setFocusTraversalKeys
 * @see KeyboardFocusManager#FORWARD_TRAVERSAL_KEYS
 * @see KeyboardFocusManager#BACKWARD_TRAVERSAL_KEYS
 * @see KeyboardFocusManager#UP_CYCLE_TRAVERSAL_KEYS
 * @see KeyboardFocusManager#DOWN_CYCLE_TRAVERSAL_KEYS
 * @throws IllegalArgumentException if id is not one of
 *         KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS,
 *         KeyboardFocusManager.BACKWARD_TRAVERSAL_KEYS,
 *         KeyboardFocusManager.UP_CYCLE_TRAVERSAL_KEYS, or
 *         KeyboardFocusManager.DOWN_CYCLE_TRAVERSAL_KEYS
 * @since 1.4
 */

	function getFocusTraversalKeys(int32 id) public returns(Set)
	{
			if(id < 0 || id >= KeyboardFocusManager.TRAVERSAL_KEY_LENGTH)
			{
			}
			// Okay to return Set directly because it is an unmodifiable view

			Set keystrokes;
			if()
			{
					return keystrokes;
			}
			else
			{
					return 
			}

	}

	/**
 * Does nothing because Windows must always be roots of a focus traversal
 * cycle. The passed-in value is ignored.
 *
 * @param focusCycleRoot this value is ignored
 * @see #isFocusCycleRoot
 * @see Container#setFocusTraversalPolicy
 * @see Container#getFocusTraversalPolicy
 * @since 1.4
 */

	function setFocusCycleRoot(bool focusCycleRoot) public
	{
	}

	/**
 * Always returns {@code true} because all Windows must be roots of a
 * focus traversal cycle.
 *
 * @return {@code true}
 * @see #setFocusCycleRoot
 * @see Container#setFocusTraversalPolicy
 * @see Container#getFocusTraversalPolicy
 * @since 1.4
 */

	function isFocusCycleRoot() public returns(bool)
	{
			return true;
	}

	/**
 * Always returns {@code null} because Windows have no ancestors; they
 * represent the top of the Component hierarchy.
 *
 * @return {@code null}
 * @see Container#isFocusCycleRoot()
 * @since 1.4
 */

	function getFocusCycleRootAncestor() public returns(Container)
	{
			return 
	}

	/**
 * Returns whether this Window can become the focused Window, that is,
 * whether this Window or any of its subcomponents can become the focus
 * owner. For a Frame or Dialog to be focusable, its focusable Window state
 * must be set to {@code true}. For a Window which is not a Frame or
 * Dialog to be focusable, its focusable Window state must be set to
 * {@code true}, its nearest owning Frame or Dialog must be
 * showing on the screen, and it must contain at least one Component in
 * its focus traversal cycle. If any of these conditions is not met, then
 * neither this Window nor any of its subcomponents can become the focus
 * owner.
 *
 * @return {@code true} if this Window can be the focused Window;
 *         {@code false} otherwise
 * @see #getFocusableWindowState
 * @see #setFocusableWindowState
 * @see #isShowing
 * @see Component#isFocusable
 * @since 1.4
 */

	function isFocusableWindow() public returns(bool)
	{
			// non-focusable.

			if(!getFocusableWindowState();)
			{
					return false;
			}
			// All other tests apply only to Windows.

			if()
			{
					return true;
			}
			// traversal cycle to be focusable.

			if()
			{
					return false;
			}
			// screen.

			for(Window owner = Window(getOwner()); ; owner = .getOwner())
			{
					if()
					{
							return .isShowing();
					}
			}
			return false;
	}

	/**
 * Returns whether this Window can become the focused Window if it meets
 * the other requirements outlined in {@code isFocusableWindow}. If
 * this method returns {@code false}, then
 * {@code isFocusableWindow} will return {@code false} as well.
 * If this method returns {@code true}, then
 * {@code isFocusableWindow} may return {@code true} or
 * {@code false} depending upon the other requirements which must be
 * met in order for a Window to be focusable.
 * <p>
 * By default, all Windows have a focusable Window state of
 * {@code true}.
 *
 * @return whether this Window can be the focused Window
 * @see #isFocusableWindow
 * @see #setFocusableWindowState
 * @see #isShowing
 * @see Component#setFocusable
 * @since 1.4
 */

	function getFocusableWindowState() public returns(bool)
	{
			return focusableWindowState;
	}

	/**
 * Sets whether this Window can become the focused Window if it meets
 * the other requirements outlined in {@code isFocusableWindow}. If
 * this Window's focusable Window state is set to {@code false}, then
 * {@code isFocusableWindow} will return {@code false}. If this
 * Window's focusable Window state is set to {@code true}, then
 * {@code isFocusableWindow} may return {@code true} or
 * {@code false} depending upon the other requirements which must be
 * met in order for a Window to be focusable.
 * <p>
 * Setting a Window's focusability state to {@code false} is the
 * standard mechanism for an application to identify to the AWT a Window
 * which will be used as a floating palette or toolbar, and thus should be
 * a non-focusable Window.
 *
 * Setting the focusability state on a visible {@code Window}
 * can have a delayed effect on some platforms &#151; the actual
 * change may happen only when the {@code Window} becomes
 * hidden and then visible again.  To ensure consistent behavior
 * across platforms, set the {@code Window}'s focusable state
 * when the {@code Window} is invisible and then show it.
 *
 * @param focusableWindowState whether this Window can be the focused
 *        Window
 * @see #isFocusableWindow
 * @see #getFocusableWindowState
 * @see #isShowing
 * @see Component#setFocusable
 * @since 1.4
 */

	function setFocusableWindowState(bool focusableWindowState) public
	{
			bool oldFocusableWindowState;
			WindowPeer peer = WindowPeer(WindowPeer());
			if()
			{
					.updateFocusableWindowState();
			}
			if(oldFocusableWindowState && !focusableWindowState; && isFocused())
			{
					for(Window owner = Window(getOwner()); ; owner = .getOwner())
					{
							Component toFocus = Component(.getMostRecentFocusOwner(owner));
							if( && .requestFocus(false, CausedFocusEvent.Cause.ACTIVATION))
							{
									return 
							}
					}
					.getCurrentKeyboardFocusManager().clearGlobalFocusOwnerPriv();
			}
	}

	/**
 * Sets whether this window should receive focus on
 * subsequently being shown (with a call to {@link #setVisible setVisible(true)}),
 * or being moved to the front (with a call to {@link #toFront}).
 * <p>
 * Note that {@link #setVisible setVisible(true)} may be called indirectly
 * (e.g. when showing an owner of the window makes the window to be shown).
 * {@link #toFront} may also be called indirectly (e.g. when
 * {@link #setVisible setVisible(true)} is called on already visible window).
 * In all such cases this property takes effect as well.
 * <p>
 * The value of the property is not inherited by owned windows.
 *
 * @param autoRequestFocus whether this window should be focused on
 *        subsequently being shown or being moved to the front
 * @see #isAutoRequestFocus
 * @see #isFocusableWindow
 * @see #setVisible
 * @see #toFront
 * @since 1.7
 */

	function setAutoRequestFocus(bool autoRequestFocus) public
	{
			 = autoRequestFocus;
	}

	/**
 * Returns whether this window should receive focus on subsequently being shown
 * (with a call to {@link #setVisible setVisible(true)}), or being moved to the front
 * (with a call to {@link #toFront}).
 * <p>
 * By default, the window has {@code autoRequestFocus} value of {@code true}.
 *
 * @return {@code autoRequestFocus} value
 * @see #setAutoRequestFocus
 * @since 1.7
 */

	function isAutoRequestFocus() public returns(bool)
	{
			return autoRequestFocus;
	}

	/**
 * Adds a PropertyChangeListener to the listener list. The listener is
 * registered for all bound properties of this class, including the
 * following:
 * <ul>
 *    <li>this Window's font ("font")</li>
 *    <li>this Window's background color ("background")</li>
 *    <li>this Window's foreground color ("foreground")</li>
 *    <li>this Window's focusability ("focusable")</li>
 *    <li>this Window's focus traversal keys enabled state
 *        ("focusTraversalKeysEnabled")</li>
 *    <li>this Window's Set of FORWARD_TRAVERSAL_KEYS
 *        ("forwardFocusTraversalKeys")</li>
 *    <li>this Window's Set of BACKWARD_TRAVERSAL_KEYS
 *        ("backwardFocusTraversalKeys")</li>
 *    <li>this Window's Set of UP_CYCLE_TRAVERSAL_KEYS
 *        ("upCycleFocusTraversalKeys")</li>
 *    <li>this Window's Set of DOWN_CYCLE_TRAVERSAL_KEYS
 *        ("downCycleFocusTraversalKeys")</li>
 *    <li>this Window's focus traversal policy ("focusTraversalPolicy")
 *        </li>
 *    <li>this Window's focusable Window state ("focusableWindowState")
 *        </li>
 *    <li>this Window's always-on-top state("alwaysOnTop")</li>
 * </ul>
 * Note that if this Window is inheriting a bound property, then no
 * event will be fired in response to a change in the inherited property.
 * <p>
 * If listener is null, no exception is thrown and no action is performed.
 *
 * @param    listener  the PropertyChangeListener to be added
 *
 * @see Component#removePropertyChangeListener
 * @see #addPropertyChangeListener(java.lang.String,java.beans.PropertyChangeListener)
 */

	function addPropertyChangeListener(PropertyChangeListener listener) public
	{
	}

	/**
 * Adds a PropertyChangeListener to the listener list for a specific
 * property. The specified property may be user-defined, or one of the
 * following:
 * <ul>
 *    <li>this Window's font ("font")</li>
 *    <li>this Window's background color ("background")</li>
 *    <li>this Window's foreground color ("foreground")</li>
 *    <li>this Window's focusability ("focusable")</li>
 *    <li>this Window's focus traversal keys enabled state
 *        ("focusTraversalKeysEnabled")</li>
 *    <li>this Window's Set of FORWARD_TRAVERSAL_KEYS
 *        ("forwardFocusTraversalKeys")</li>
 *    <li>this Window's Set of BACKWARD_TRAVERSAL_KEYS
 *        ("backwardFocusTraversalKeys")</li>
 *    <li>this Window's Set of UP_CYCLE_TRAVERSAL_KEYS
 *        ("upCycleFocusTraversalKeys")</li>
 *    <li>this Window's Set of DOWN_CYCLE_TRAVERSAL_KEYS
 *        ("downCycleFocusTraversalKeys")</li>
 *    <li>this Window's focus traversal policy ("focusTraversalPolicy")
 *        </li>
 *    <li>this Window's focusable Window state ("focusableWindowState")
 *        </li>
 *    <li>this Window's always-on-top state("alwaysOnTop")</li>
 * </ul>
 * Note that if this Window is inheriting a bound property, then no
 * event will be fired in response to a change in the inherited property.
 * <p>
 * If listener is null, no exception is thrown and no action is performed.
 *
 * @param propertyName one of the property names listed above
 * @param listener the PropertyChangeListener to be added
 *
 * @see #addPropertyChangeListener(java.beans.PropertyChangeListener)
 * @see Component#removePropertyChangeListener
 */

	function addPropertyChangeListener(string propertyName, PropertyChangeListener listener) public
	{
	}

	/**
 * Indicates if this container is a validate root.
 * <p>
 * {@code Window} objects are the validate roots, and, therefore, they
 * override this method to return {@code true}.
 *
 * @return {@code true}
 * @since 1.7
 * @see java.awt.Container#isValidateRoot
 */

	function isValidateRoot() public returns(bool)
	{
			return true;
	}

	/**
 * Dispatches an event to this window or one of its sub components.
 * @param e the event
 */

	function dispatchEventImpl(AWTEvent e) internal
	{
			if(.getID() == ComponentEvent.COMPONENT_RESIZED)
			{
					invalidate();
					validate();
			}
	}

	/**
 * @deprecated As of JDK version 1.1
 * replaced by {@code dispatchEvent(AWTEvent)}.
 */

	function postEvent(Event e) public returns(bool)
	{
			return false;
	}

	/**
 * Checks if this Window is showing on screen.
 * @see Component#setVisible
 */

	function isShowing() public returns(bool)
	{
			return visible;
	}

	function isDisposing() internal returns(bool)
	{
			return disposing;
	}

	/**
 * @deprecated As of J2SE 1.4, replaced by
 * {@link Component#applyComponentOrientation Component.applyComponentOrientation}.
 */

	function applyResourceBundle(ResourceBundle rb) public
	{
	}

	/**
 * @deprecated As of J2SE 1.4, replaced by
 * {@link Component#applyComponentOrientation Component.applyComponentOrientation}.
 */

	function applyResourceBundle(string rbName) public
	{
	}

	/*
    * Support for tracking all windows owned by this window
    */

	function addOwnedWindow(WeakReference weakWindow) internal
	{
			if()
			{
			}
	}

	function removeOwnedWindow(WeakReference weakWindow) internal
	{
			if()
			{
			}
	}

	function connectOwnedWindow(Window child) internal
	{
			;
			addOwnedWindow(child.weakThis);
			child.disposerRecord.updateOwner();
	}

	function addToWindowList() private
	{
	}

	function removeFromWindowList(AppContext context, WeakReference weakThis) private
	{
	}

	function removeFromWindowList() private
	{
	}

	/**
 * Window type.
 *
 * Synchronization: ObjectLock
 */

	Type private  type = Type(Type.NORMAL);

	/**
 * Sets the type of the window.
 *
 * This method can only be called while the window is not displayable.
 *
 * @throws IllegalComponentStateException if the window
 *         is displayable.
 * @throws IllegalArgumentException if the type is {@code null}
 * @see    Component#isDisplayable
 * @see    #getType
 * @since 1.7
 */

	function setType(Type type) public
	{
			if()
			{
			}
	}

	/**
 * Returns the type of the window.
 *
 * @see   #setType
 * @since 1.7
 */

	function getType() public returns(Type)
	{
	}

	/**
 * The window serialized data version.
 *
 * @serial
 */

	int32 private  windowSerializedDataVersion = int32(2);

	/**
 * Writes default serializable fields to stream.  Writes
 * a list of serializable {@code WindowListener}s and
 * {@code WindowFocusListener}s as optional data.
 * Writes a list of child windows as optional data.
 * Writes a list of icon images as optional data
 *
 * @param s the {@code ObjectOutputStream} to write
 * @serialData {@code null} terminated sequence of
 *    0 or more pairs; the pair consists of a {@code String}
 *    and {@code Object}; the {@code String}
 *    indicates the type of object and is one of the following:
 *    {@code windowListenerK} indicating a
 *      {@code WindowListener} object;
 *    {@code windowFocusWindowK} indicating a
 *      {@code WindowFocusListener} object;
 *    {@code ownedWindowK} indicating a child
 *      {@code Window} object
 *
 * @see AWTEventMulticaster#save(java.io.ObjectOutputStream, java.lang.String, java.util.EventListener)
 * @see Component#windowListenerK
 * @see Component#windowFocusListenerK
 * @see Component#ownedWindowK
 * @see #readObject(ObjectInputStream)
 */

	function writeObject(ObjectOutputStream s) private
	{
			// write icon array

			if()
			{
					for(uint256 iterator_var = uint256(0); iterator_var < icons.length; iterator_var++)
					{
							Image i = Image(icons[uint256(iterator_var)]);
					}
			}
	}

	// 

	function initDeserializedWindow() private
	{
			setWarningString();
			;
			// Deserialized Windows are not yet visible.

			visible = false;
			;
			;
			;
			addToWindowList();
			;
	}

	function deserializeResources(ObjectInputStream s) private
	{
			if(windowSerializedDataVersion < 2)
			{
					// Component.

					if()
					{
							if()
							{
							}
					}
					// it explicitly for object data streams prior to 1.4.

					focusableWindowState = true;
			}
			Object keyOrNull;
			while()
			{
					string memory key = string((string(keyOrNull)).intern());
					if(keccak256(abi.encode(windowListenerK)) == keccak256(abi.encode(key)))
					{
							addWindowListener(WindowListener((.readObject())));
					}
					else
					{
						if(keccak256(abi.encode(windowFocusListenerK)) == keccak256(abi.encode(key)))
						{
								addWindowFocusListener(WindowFocusListener((.readObject())));
						}
						else
						{
							if(keccak256(abi.encode(windowStateListenerK)) == keccak256(abi.encode(key)))
							{
									addWindowStateListener(WindowStateListener((.readObject())));
							}
							else
							{
								// skip value for unrecognized key

								.readObject();							}
						}
					}


			}
				//try

					while()
					{
							string memory key = string((string(keyOrNull)).intern());
							if(keccak256(abi.encode(ownedWindowK)) == keccak256(abi.encode(key)));
							else
							{
								// skip value for unrecognized key

								.readObject();							}


					}
					// Throws OptionalDataException

					Object obj = Object(.readObject());
					// Frame.readObject() assumes

					;
					// pre1.6 version if icons is null.

					while()
					{
							obj = .readObject();

					}

				/* catch (OptionalDataException e) {
// 1.1 serialized form
// ownedWindowList will be updated by Frame.readObject
}*/


	}

	/**
 * Reads the {@code ObjectInputStream} and an optional
 * list of listeners to receive various events fired by
 * the component; also reads a list of
 * (possibly {@code null}) child windows.
 * Unrecognized keys or values will be ignored.
 *
 * @param s the {@code ObjectInputStream} to read
 * @exception HeadlessException if
 *   {@code GraphicsEnvironment.isHeadless} returns
 *   {@code true}
 * @see java.awt.GraphicsEnvironment#isHeadless
 * @see #writeObject
 */

	function readObject(ObjectInputStream s) private
	{
			.checkHeadless();
			initDeserializedWindow();
			GetField f = GetField(.readFields());
			;
			state = .get("state", 0);
			focusableWindowState = .get("focusableWindowState", true);
			windowSerializedDataVersion = .get("windowSerializedDataVersion", 1);
			;
			// Note: 1.4 (or later) doesn't use focusMgr

			focusMgr = FocusManager();
			ModalExclusionType et = ModalExclusionType(ModalExclusionType(.get("modalExclusionType", Dialog.ModalExclusionType.NO_EXCLUDE)));
			// since 6.0

			setModalExclusionType(et);
			bool aot = bool(.get("alwaysOnTop", false));
			if(aot)
			{
					// since 1.5; subject to permission check

					setAlwaysOnTop(aot)
			}
			shape = Shape();
			opacity = Float(.get("opacity", 1));
			 = 0;
			 = 0;
			 = 2;
			 = 0;
			 = RIGHT_ALIGNMENT;
			 = TOP_ALIGNMENT;
	}

	/**
 * Gets the AccessibleContext associated with this Window.
 * For windows, the AccessibleContext takes the form of an
 * AccessibleAWTWindow.
 * A new AccessibleAWTWindow instance is created if necessary.
 *
 * @return an AccessibleAWTWindow that serves as the
 *         AccessibleContext of this Window
 * @since 1.3
 */

	function getAccessibleContext() public returns(AccessibleContext)
	{
			if()
			{
					;
			}
			return accessibleContext;
	}

	function setGraphicsConfiguration(GraphicsConfiguration gc) internal
	{
			if()
			{
					gc = .getLocalGraphicsEnvironment().getDefaultScreenDevice().getDefaultConfiguration();
			}
	}

	/**
 * Sets the location of the window relative to the specified
 * component according to the following scenarios.
 * <p>
 * The target screen mentioned below is a screen to which
 * the window should be placed after the setLocationRelativeTo
 * method is called.
 * <ul>
 * <li>If the component is {@code null}, or the {@code
 * GraphicsConfiguration} associated with this component is
 * {@code null}, the window is placed in the center of the
 * screen. The center point can be obtained with the {@link
 * GraphicsEnvironment#getCenterPoint
 * GraphicsEnvironment.getCenterPoint} method.
 * <li>If the component is not {@code null}, but it is not
 * currently showing, the window is placed in the center of
 * the target screen defined by the {@code
 * GraphicsConfiguration} associated with this component.
 * <li>If the component is not {@code null} and is shown on
 * the screen, then the window is located in such a way that
 * the center of the window coincides with the center of the
 * component.
 * </ul>
 * <p>
 * If the screens configuration does not allow the window to
 * be moved from one screen to another, then the window is
 * only placed at the location determined according to the
 * above conditions and its {@code GraphicsConfiguration} is
 * not changed.
 * <p>
 * <b>Note</b>: If the lower edge of the window is out of the screen,
 * then the window is placed to the side of the {@code Component}
 * that is closest to the center of the screen. So if the
 * component is on the right part of the screen, the window
 * is placed to its left, and vice versa.
 * <p>
 * If after the window location has been calculated, the upper,
 * left, or right edge of the window is out of the screen,
 * then the window is located in such a way that the upper,
 * left, or right edge of the window coincides with the
 * corresponding edge of the screen. If both left and right
 * edges of the window are out of the screen, the window is
 * placed at the left side of the screen. The similar placement
 * will occur if both top and bottom edges are out of the screen.
 * In that case, the window is placed at the top side of the screen.
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that correspon                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ds closely to the desktop settings.
 *
 * @param c  the component in relation to which the window's location
 *           is determined
 * @see java.awt.GraphicsEnvironment#getCenterPoint
 * @since 1.4
 */

	function setLocationRelativeTo(Component c) public
	{
			// target location

			int32 dx = int32(0);
			// target GC

			GraphicsConfiguration gc = GraphicsConfiguration(getGraphicsConfiguration_NoClientCode());
			Rectangle gcBounds = Rectangle(.getBounds());
			Dimension windowSize = Dimension(getSize());
			// search a top-level of c

			Window componentWindow;
			if(() || ())
			{
					GraphicsEnvironment ge = GraphicsEnvironment(.getLocalGraphicsEnvironment());
					gc = .getDefaultScreenDevice().getDefaultConfiguration();
					gcBounds = .getBounds();
					Point centerPoint = Point(.getCenterPoint());
					dx = centerPoint.x - windowSize.width / 2;
					dy = centerPoint.y - windowSize.height / 2;
			}
			else
			{
				if(!.isShowing();)
				{
						gc = .getGraphicsConfiguration();
						gcBounds = .getBounds();
						dx = gcBounds.x + (gcBounds.width - windowSize.width) / 2;
						dy = gcBounds.y + (gcBounds.height - windowSize.height) / 2;
				}
				else
				{
						gc = .getGraphicsConfiguration();
						gcBounds = .getBounds();
						Dimension compSize = Dimension(.getSize());
						Point compLocation = Point(.getLocationOnScreen());
						dx = compLocation.x + ((compSize.width - windowSize.width) / 2);
						dy = compLocation.y + ((compSize.height - windowSize.height) / 2);
						// Adjust for bottom edge being offscreen

						if(dy + windowSize.height > gcBounds.y + gcBounds.height)
						{
								dy = gcBounds.y + gcBounds.height - windowSize.height;
								if(compLocation.x - gcBounds.x + compSize.width / 2 < gcBounds.width / 2)
								{
										dx = compLocation.x + compSize.width;
								}
								else
								{
										dx = compLocation.x - windowSize.width;
								}

						}
				}
			}

			// bottom

			if(dy + windowSize.height > gcBounds.y + gcBounds.height)
			{
					dy = gcBounds.y + gcBounds.height - windowSize.height;
			}
			// top

			if(dy < gcBounds.y)
			{
					dy = gcBounds.y;
			}
			// right

			if(dx + windowSize.width > gcBounds.x + gcBounds.width)
			{
					dx = gcBounds.x + gcBounds.width - windowSize.width;
			}
			// left

			if(dx < gcBounds.x)
			{
					dx = gcBounds.x;
			}
	}

	/**
 * Overridden from Component.  Top-level Windows should not propagate a
 * MouseWheelEvent beyond themselves into their owning Windows.
 */

	function deliverMouseWheelToAncestor(MouseWheelEvent e) internal
	{
	}

	/**
 * Overridden from Component.  Top-level Windows don't dispatch to ancestors
 */

	function dispatchMouseWheelToAncestor(MouseWheelEvent e) internal returns(bool)
	{
			return false;
	}

	/**
 * Creates a new strategy for multi-buffering on this component.
 * Multi-buffering is useful for rendering performance.  This method
 * attempts to create the best strategy available with the number of
 * buffers supplied.  It will always create a {@code BufferStrategy}
 * with that number of buffers.
 * A page-flipping strategy is attempted first, then a blitting strategy
 * using accelerated buffers.  Finally, an unaccelerated blitting
 * strategy is used.
 * <p>
 * Each time this method is called,
 * the existing buffer strategy for this component is discarded.
 * @param numBuffers number of buffers to create
 * @exception IllegalArgumentException if numBuffers is less than 1.
 * @exception IllegalStateException if the component is not displayable
 * @see #isDisplayable
 * @see #getBufferStrategy
 * @since 1.4
 */

	function createBufferStrategy(int32 numBuffers) public
	{
	}

	/**
 * Creates a new strategy for multi-buffering on this component with the
 * required buffer capabilities.  This is useful, for example, if only
 * accelerated memory or page flipping is desired (as specified by the
 * buffer capabilities).
 * <p>
 * Each time this method
 * is called, the existing buffer strategy for this component is discarded.
 * @param numBuffers number of buffers to create, including the front buffer
 * @param caps the required capabilities for creating the buffer strategy;
 * cannot be {@code null}
 * @exception AWTException if the capabilities supplied could not be
 * supported or met; this may happen, for example, if there is not enough
 * accelerated memory currently available, or if page flipping is specified
 * but not possible.
 * @exception IllegalArgumentException if numBuffers is less than 1, or if
 * caps is {@code null}
 * @see #getBufferStrategy
 * @since 1.4
 */

	function createBufferStrategy(int32 numBuffers, BufferCapabilities caps) public
	{
	}

	/**
 * Returns the {@code BufferStrategy} used by this component.  This
 * method will return null if a {@code BufferStrategy} has not yet
 * been created or has been disposed.
 *
 * @return the buffer strategy used by this component
 * @see #createBufferStrategy
 * @since 1.4
 */

	function getBufferStrategy() public returns(BufferStrategy)
	{
			return 
	}

	function getTemporaryLostComponent() internal returns(Component)
	{
			return temporaryLostComponent;
	}

	function setTemporaryLostComponent(Component component) internal returns(Component)
	{
			Component previousComp = Component(temporaryLostComponent);
			// - or later we will have problems with opposite while handling  WINDOW_GAINED_FOCUS

			if( || .canBeFocusOwner())
			{
					temporaryLostComponent = component;
			}
			else
			{
					;
			}

			return previousComp;
	}

	/**
 * Checks whether this window can contain focus owner.
 * Verifies that it is focusable and as container it can container focus owner.
 * @since 1.5
 */

	function canContainFocusOwner(Component focusOwnerCandidate) internal returns(bool)
	{
			return ;
	}

	bool private  locationByPlatform = bool(locationByPlatformProp);

	/**
 * Sets whether this Window should appear at the default location for the
 * native windowing system or at the current location (returned by
 * {@code getLocation}) the next time the Window is made visible.
 * This behavior resembles a native window shown without programmatically
 * setting its location.  Most windowing systems cascade windows if their
 * locations are not explicitly set. The actual location is determined once the
 * window is shown on the screen.
 * <p>
 * This behavior can also be enabled by setting the System Property
 * "java.awt.Window.locationByPlatform" to "true", though calls to this method
 * take precedence.
 * <p>
 * Calls to {@code setVisible}, {@code setLocation} and
 * {@code setBounds} after calling {@code setLocationByPlatform} clear
 * this property of the Window.
 * <p>
 * For example, after the following code is executed:
 * <pre>
 * setLocationByPlatform(true);
 * setVisible(true);
 * boolean flag = isLocationByPlatform();
 * </pre>
 * The window will be shown at platform's default location and
 * {@code flag} will be {@code false}.
 * <p>
 * In the following sample:
 * <pre>
 * setLocationByPlatform(true);
 * setLocation(10, 10);
 * boolean flag = isLocationByPlatform();
 * setVisible(true);
 * </pre>
 * The window will be shown at (10, 10) and {@code flag} will be
 * {@code false}.
 *
 * @param locationByPlatform {@code true} if this Window should appear
 *        at the default location, {@code false} if at the current location
 * @throws IllegalComponentStateException if the window
 *         is showing on screen and locationByPlatform is {@code true}.
 * @see #setLocation
 * @see #isShowing
 * @see #setVisible
 * @see #isLocationByPlatform
 * @see java.lang.System#getProperty(String)
 * @since 1.5
 */

	function setLocationByPlatform(bool locationByPlatform) public
	{
	}

	/**
 * Returns {@code true} if this Window will appear at the default location
 * for the native windowing system the next time this Window is made visible.
 * This method always returns {@code false} if the Window is showing on the
 * screen.
 *
 * @return whether this Window will appear at the default location
 * @see #setLocationByPlatform
 * @see #isShowing
 * @since 1.5
 */

	function isLocationByPlatform() public returns(bool)
	{
	}

	/**
 * {@inheritDoc}
 * <p>
 * The {@code width} or {@code height} values
 * are automatically enlarged if either is less than
 * the minimum size as specified by previous call to
 * {@code setMinimumSize}.
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that corresponds closely to the desktop settings.
 *
 * @see #getBounds
 * @see #setLocation(int, int)
 * @see #setLocation(Point)
 * @see #setSize(int, int)
 * @see #setSize(Dimension)
 * @see #setMinimumSize
 * @see #setLocationByPlatform
 * @see #isLocationByPlatform
 * @since 1.6
 */

	function setBounds(int32 x, int32 y, int32 width, int32 height) public
	{
	}

	/**
 * {@inheritDoc}
 * <p>
 * The {@code r.width} or {@code r.height} values
 * will be automatically enlarged if either is less than
 * the minimum size as specified by previous call to
 * {@code setMinimumSize}.
 * <p>
 * The method changes the geometry-related data. Therefore,
 * the native windowing system may ignore such requests, or it may modify
 * the requested data, so that the {@code Window} object is placed and sized
 * in a way that corresponds closely to the desktop settings.
 *
 * @see #getBounds
 * @see #setLocation(int, int)
 * @see #setLocation(Point)
 * @see #setSize(int, int)
 * @see #setSize(Dimension)
 * @see #setMinimumSize
 * @see #setLocationByPlatform
 * @see #isLocationByPlatform
 * @since 1.6
 */

	function setBounds(Rectangle r) public
	{
			setBounds(r.x, r.y, r.width, r.height);
	}

	/**
 * Determines whether this component will be displayed on the screen.
 * @return {@code true} if the component and all of its ancestors
 *          until a toplevel window are visible, {@code false} otherwise
 */

	function isRecursivelyVisible() internal returns(bool)
	{
			// We're overriding isRecursivelyVisible to implement this policy.

			return visible;
	}

	/**
 * Returns the opacity of the window.
 *
 * @return the opacity of the window
 *
 * @see Window#setOpacity(float)
 * @see GraphicsDevice.WindowTranslucency
 *
 * @since 1.7
 */

	function getOpacity() public returns(int32)
	{
	}

	/**
 * Sets the opacity of the window.
 * <p>
 * The opacity value is in the range [0..1]. Note that setting the opacity
 * level of 0 may or may not disable the mouse event handling on this
 * window. This is a platform-dependent behavior.
 * <p>
 * The following conditions must be met in order to set the opacity value
 * less than {@code 1.0f}:
 * <ul>
 * <li>The {@link GraphicsDevice.WindowTranslucency#TRANSLUCENT TRANSLUCENT}
 * translucency must be supported by the underlying system
 * <li>The window must be undecorated (see {@link Frame#setUndecorated}
 * and {@link Dialog#setUndecorated})
 * <li>The window must not be in full-screen mode (see {@link
 * GraphicsDevice#setFullScreenWindow(Window)})
 * </ul>
 * <p>
 * If the requested opacity value is less than {@code 1.0f}, and any of the
 * above conditions are not met, the window opacity will not change,
 * and the {@code IllegalComponentStateException} will be thrown.
 * <p>
 * The translucency levels of individual pixels may also be effected by the
 * alpha component of their color (see {@link Window#setBackground(Color)}) and the
 * current shape of this window (see {@link #setShape(Shape)}).
 *
 * @param opacity the opacity level to set to the window
 *
 * @throws IllegalArgumentException if the opacity is out of the range
 *     [0..1]
 * @throws IllegalComponentStateException if the window is decorated and
 *     the opacity is less than {@code 1.0f}
 * @throws IllegalComponentStateException if the window is in full screen
 *     mode, and the opacity is less than {@code 1.0f}
 * @throws UnsupportedOperationException if the {@code
 *     GraphicsDevice.WindowTranslucency#TRANSLUCENT TRANSLUCENT}
 *     translucency is not supported and the opacity is less than
 *     {@code 1.0f}
 *
 * @see Window#getOpacity
 * @see Window#setBackground(Color)
 * @see Window#setShape(Shape)
 * @see Frame#isUndecorated
 * @see Dialog#isUndecorated
 * @see GraphicsDevice.WindowTranslucency
 * @see GraphicsDevice#isWindowTranslucencySupported(GraphicsDevice.WindowTranslucency)
 *
 * @since 1.7
 */

	function setOpacity(int32 opacity) public
	{
	}

	/**
 * Returns the shape of the window.
 *
 * The value returned by this method may not be the same as
 * previously set with {@code setShape(shape)}, but it is guaranteed
 * to represent the same shape.
 *
 * @return the shape of the window or {@code null} if no
 *     shape is specified for the window
 *
 * @see Window#setShape(Shape)
 * @see GraphicsDevice.WindowTranslucency
 *
 * @since 1.7
 */

	function getShape() public returns(Shape)
	{
	}

	/**
 * Sets the shape of the window.
 * <p>
 * Setting a shape cuts off some parts of the window. Only the parts that
 * belong to the given {@link Shape} remain visible and clickable. If
 * the shape argument is {@code null}, this method restores the default
 * shape, making the window rectangular on most platforms.
 * <p>
 * The following conditions must be met to set a non-null shape:
 * <ul>
 * <li>The {@link GraphicsDevice.WindowTranslucency#PERPIXEL_TRANSPARENT
 * PERPIXEL_TRANSPARENT} translucency must be supported by the
 * underlying system
 * <li>The window must be undecorated (see {@link Frame#setUndecorated}
 * and {@link Dialog#setUndecorated})
 * <li>The window must not be in full-screen mode (see {@link
 * GraphicsDevice#setFullScreenWindow(Window)})
 * </ul>
 * <p>
 * If the requested shape is not {@code null}, and any of the above
 * conditions are not met, the shape of this window will not change,
 * and either the {@code UnsupportedOperationException} or {@code
 * IllegalComponentStateException} will be thrown.
 * <p>
 * The translucency levels of individual pixels may also be effected by the
 * alpha component of their color (see {@link Window#setBackground(Color)}) and the
 * opacity value (see {@link #setOpacity(float)}). See {@link
 * GraphicsDevice.WindowTranslucency} for more details.
 *
 * @param shape the shape to set to the window
 *
 * @throws IllegalComponentStateException if the shape is not {@code
 *     null} and the window is decorated
 * @throws IllegalComponentStateException if the shape is not {@code
 *     null} and the window is in full-screen mode
 * @throws UnsupportedOperationException if the shape is not {@code
 *     null} and {@link GraphicsDevice.WindowTranslucency#PERPIXEL_TRANSPARENT
 *     PERPIXEL_TRANSPARENT} translucency is not supported
 *
 * @see Window#getShape()
 * @see Window#setBackground(Color)
 * @see Window#setOpacity(float)
 * @see Frame#isUndecorated
 * @see Dialog#isUndecorated
 * @see GraphicsDevice.WindowTranslucency
 * @see GraphicsDevice#isWindowTranslucencySupported(GraphicsDevice.WindowTranslucency)
 *
 * @since 1.7
 */

	function setShape(Shape shape) public
	{
	}

	/**
 * Gets the background color of this window.
 * <p>
 * Note that the alpha component of the returned color indicates whether
 * the window is in the non-opaque (per-pixel translucent) mode.
 *
 * @return this component's background color
 *
 * @see Window#setBackground(Color)
 * @see Window#isOpaque
 * @see GraphicsDevice.WindowTranslucency
 */

	function getBackground() public returns(Color)
	{
			return 
	}

	/**
 * Sets the background color of this window.
 * <p>
 * If the windowing system supports the {@link
 * GraphicsDevice.WindowTranslucency#PERPIXEL_TRANSLUCENT PERPIXEL_TRANSLUCENT}
 * translucency, the alpha component of the given background color
 * may effect the mode of operation for this window: it indicates whether
 * this window must be opaque (alpha equals {@code 1.0f}) or per-pixel translucent
 * (alpha is less than {@code 1.0f}). If the given background color is
 * {@code null}, the window is considered completely opaque.
 * <p>
 * All the following conditions must be met to enable the per-pixel
 * transparency mode for this window:
 * <ul>
 * <li>The {@link GraphicsDevice.WindowTranslucency#PERPIXEL_TRANSLUCENT
 * PERPIXEL_TRANSLUCENT} translucency must be supported by the graphics
 * device where this window is located
 * <li>The window must be undecorated (see {@link Frame#setUndecorated}
 * and {@link Dialog#setUndecorated})
 * <li>The window must not be in full-screen mode (see {@link
 * GraphicsDevice#setFullScreenWindow(Window)})
 * </ul>
 * <p>
 * If the alpha component of the requested background color is less than
 * {@code 1.0f}, and any of the above conditions are not met, the background
 * color of this window will not change, the alpha component of the given
 * background color will not affect the mode of operation for this window,
 * and either the {@code UnsupportedOperationException} or {@code
 * IllegalComponentStateException} will be thrown.
 * <p>
 * When the window is per-pixel translucent, the drawing sub-system
 * respects the alpha value of each individual pixel. If a pixel gets
 * painted with the alpha color component equal to zero, it becomes
 * visually transparent. If the alpha of the pixel is equal to 1.0f, the
 * pixel is fully opaque. Interim values of the alpha color component make
 * the pixel semi-transparent. In this mode, the background of the window
 * gets painted with the alpha value of the given background color. If the
 * alpha value of the argument of this method is equal to {@code 0}, the
 * background is not painted at all.
 * <p>
 * The actual level of translucency of a given pixel also depends on window
 * opacity (see {@link #setOpacity(float)}), as well as the current shape of
 * this window (see {@link #setShape(Shape)}).
 * <p>
 * Note that painting a pixel with the alpha value of {@code 0} may or may
 * not disable the mouse event handling on this pixel. This is a
 * platform-dependent behavior. To make sure the mouse events do not get
 * dispatched to a particular pixel, the pixel must be excluded from the
 * shape of the window.
 * <p>
 * Enabling the per-pixel translucency mode may change the graphics
 * configuration of this window due to the native platform requirements.
 *
 * @param bgColor the color to become this window's background color.
 *
 * @throws IllegalComponentStateException if the alpha value of the given
 *     background color is less than {@code 1.0f} and the window is decorated
 * @throws IllegalComponentStateException if the alpha value of the given
 *     background color is less than {@code 1.0f} and the window is in
 *     full-screen mode
 * @throws UnsupportedOperationException if the alpha value of the given
 *     background color is less than {@code 1.0f} and {@link
 *     GraphicsDevice.WindowTranslucency#PERPIXEL_TRANSLUCENT
 *     PERPIXEL_TRANSLUCENT} translucency is not supported
 *
 * @see Window#getBackground
 * @see Window#isOpaque
 * @see Window#setOpacity(float)
 * @see Window#setShape(Shape)
 * @see Frame#isUndecorated
 * @see Dialog#isUndecorated
 * @see GraphicsDevice.WindowTranslucency
 * @see GraphicsDevice#isWindowTranslucencySupported(GraphicsDevice.WindowTranslucency)
 * @see GraphicsConfiguration#isTranslucencyCapable()
 */

	function setBackground(Color bgColor) public
	{
			Color oldBg = Color(getBackground());
			if()
			{
					return 
			}
			int32 oldAlpha = int32( ? 255 : .getAlpha());
			int32 alpha = int32( ? 255 : .getAlpha());
			if((oldAlpha == 255) && (alpha < 255))
			{
					// non-opaque window

					GraphicsConfiguration gc = GraphicsConfiguration(getGraphicsConfiguration());
					GraphicsDevice gd = GraphicsDevice(.getDevice());
					if()
					{
					}
					if(!.isTranslucencyCapable();)
					{
							GraphicsConfiguration capableGC = GraphicsConfiguration(.getTranslucencyCapableGC());
							if()
							{
							}
							setGraphicsConfiguration(capableGC);
					}
			}
			else
			{
				if((oldAlpha < 255) && (alpha == 255))
				{
				}			}

			WindowPeer peer = WindowPeer(WindowPeer(getPeer()));
			if()
			{
					.setOpaque(alpha == 255);
			}
	}

	/**
 * Indicates if the window is currently opaque.
 * <p>
 * The method returns {@code false} if the background color of the window
 * is not {@code null} and the alpha component of the color is less than
 * {@code 1.0f}. The method returns {@code true} otherwise.
 *
 * @return {@code true} if the window is opaque, {@code false} otherwise
 *
 * @see Window#getBackground
 * @see Window#setBackground(Color)
 * @since 1.7
 */

	function isOpaque() public returns(bool)
	{
			Color bg = Color(getBackground());
			return  ? true : .getAlpha() == 255;
	}

	function updateWindow() private
	{
	}

	/**
 * {@inheritDoc}
 *
 * @since 1.7
 */

	function paint(Graphics g) public
	{
			if(!isOpaque();)
			{
					Graphics gg = Graphics(.create());
						//try


						//finally

							.dispose();


			}
	}

	function setLayersOpaque(Component component, bool isOpaque) private
	{
	}

	/**
 * Limit the given double value with the given range.
 */

	function limit(int64 value, int64 min, int64 max) private returns(int64)
	{
			;
			;
			return value;
	}

	/**
 * Calculate the position of the security warning.
 *
 * This method gets the window location/size as reported by the native
 * system since the locally cached values may represent outdated data.
 *
 * The method is used from the native code, or via AWTAccessor.
 *
 * NOTE: this method is invoked on the toolkit thread, and therefore is not
 * supposed to become public/user-overridable.
 */

	function calculateSecurityWarningPosition(int64 x, int64 y, int64 w, int64 h) private returns(Point2D)
	{
			// The position according to the spec of SecurityWarning.setPosition()

			int64 wx = int64(x + w * securityWarningAlignmentX + securityWarningPointX); //Converted from DOUBLE TYPE of Java
			int64 wy = int64(y + h * securityWarningAlignmentY + securityWarningPointY); //Converted from DOUBLE TYPE of Java
			// First, make sure the warning is not too far from the window bounds

			;
			;
			// Now make sure the warning window is visible on the screen

			GraphicsConfiguration graphicsConfig = GraphicsConfiguration(getGraphicsConfiguration_NoClientCode());
			Rectangle screenBounds = Rectangle(.getBounds());
			Insets screenInsets = Insets(.getDefaultToolkit().getScreenInsets(graphicsConfig));
			;
			;
			return 
	}

	// a window doesn't need to be updated in the Z-order.

	function updateZOrder() internal
	{
	}

	int private oc_id;

	bool private oc_status;

	constructor(int _oc_id) public
	{
			oc_id = _oc_id;
			oc_status = false;
	}

	modifier overloadedConstructor(int _oc_id)
	{
			require(oc_id == _oc_id, "Restricted for Overloaded Constructor");
			require(oc_status == false, "Restricted for only One Time Execution");
			_;
			oc_status = true;
	}

	/**
 * Constructs a new, initially invisible window in default size with the
 * specified {@code GraphicsConfiguration}.
 * <p>
 * If there is a security manager, then it is invoked to check
 * {@code AWTPermission("showWindowWithoutWarningBanner")}
 * to determine whether or not the window must be displayed with
 * a warning banner.
 *
 * @param gc the {@code GraphicsConfiguration} of the target screen
 *     device. If {@code gc} is {@code null}, the system default
 *     {@code GraphicsConfiguration} is assumed
 * @exception IllegalArgumentException if {@code gc}
 *    is not from a screen device
 * @exception HeadlessException when
 *     {@code GraphicsEnvironment.isHeadless()} returns {@code true}
 *
 * @see java.awt.GraphicsEnvironment#isHeadless
 */

	function constructor1(GraphicsConfiguration gc) internal	overloadedConstructor( 1 )
	{
	}

	function constructor2(AppContext context, Window victim) internal	overloadedConstructor( 2 )
	{
			weakThis = victim.weakThis;
			;
	}

	/**
 * Constructs a new, initially invisible window in the default size.
 * <p>
 * If there is a security manager set, it is invoked to check
 * {@code AWTPermission("showWindowWithoutWarningBanner")}.
 * If that check fails with a {@code SecurityException} then a warning
 * banner is created.
 *
 * @exception HeadlessException when
 *     {@code GraphicsEnvironment.isHeadless()} returns {@code true}
 *
 * @see java.awt.GraphicsEnvironment#isHeadless
 */

	function constructor3() internal	overloadedConstructor( 3 )
	{
			.checkHeadless();
			init(GraphicsConfiguration());
	}

	/**
 * Constructs a new, initially invisible window with the specified
 * {@code Frame} as its owner. The window will not be focusable
 * unless its owner is showing on the screen.
 * <p>
 * If there is a security manager set, it is invoked to check
 * {@code AWTPermission("showWindowWithoutWarningBanner")}.
 * If that check fails with a {@code SecurityException} then a warning
 * banner is created.
 *
 * @param owner the {@code Frame} to act as owner or {@code null}
 *    if this window has no owner
 * @exception IllegalArgumentException if the {@code owner}'s
 *    {@code GraphicsConfiguration} is not from a screen device
 * @exception HeadlessException when
 *    {@code GraphicsEnvironment.isHeadless} returns {@code true}
 *
 * @see java.awt.GraphicsEnvironment#isHeadless
 * @see #isShowing
 */

	function constructor4(Frame owner) public	overloadedConstructor( 4 )
	{
			ownedInit(owner);
	}

	/**
 * Constructs a new, initially invisible window with the specified
 * {@code Window} as its owner. This window will not be focusable
 * unless its nearest owning {@code Frame} or {@code Dialog}
 * is showing on the screen.
 * <p>
 * If there is a security manager set, it is invoked to check
 * {@code AWTPermission("showWindowWithoutWarningBanner")}.
 * If that check fails with a {@code SecurityException} then a
 * warning banner is created.
 *
 * @param owner the {@code Window} to act as owner or
 *     {@code null} if this window has no owner
 * @exception IllegalArgumentException if the {@code owner}'s
 *     {@code GraphicsConfiguration} is not from a screen device
 * @exception HeadlessException when
 *     {@code GraphicsEnvironment.isHeadless()} returns
 *     {@code true}
 *
 * @see       java.awt.GraphicsEnvironment#isHeadless
 * @see       #isShowing
 *
 * @since     1.2
 */

	function constructor5(Window owner) public	overloadedConstructor( 5 )
	{
			ownedInit(owner);
	}

	/**
 * Constructs a new, initially invisible window with the specified owner
 * {@code Window} and a {@code GraphicsConfiguration}
 * of a screen device. The Window will not be focusable unless
 * its nearest owning {@code Frame} or {@code Dialog}
 * is showing on the screen.
 * <p>
 * If there is a security manager set, it is invoked to check
 * {@code AWTPermission("showWindowWithoutWarningBanner")}. If that
 * check fails with a {@code SecurityException} then a warning banner
 * is created.
 *
 * @param owner the window to act as owner or {@code null}
 *     if this window has no owner
 * @param gc the {@code GraphicsConfiguration} of the target
 *     screen device; if {@code gc} is {@code null},
 *     the system default {@code GraphicsConfiguration} is assumed
 * @exception IllegalArgumentException if {@code gc}
 *     is not from a screen device
 * @exception HeadlessException when
 *     {@code GraphicsEnvironment.isHeadless()} returns
 *     {@code true}
 *
 * @see       java.awt.GraphicsEnvironment#isHeadless
 * @see       GraphicsConfiguration#getBounds
 * @see       #isShowing
 * @since     1.3
 */

	function constructor6(Window owner, GraphicsConfiguration gc) public	overloadedConstructor( 6 )
	{
			ownedInit(owner);
	}

}

library Window_Library
{
	/**
 * Initialize JNI field and method IDs for fields that may be
 *       accessed from C.
 */

	function initIDs() virtual external;

	function updateChildFocusableWindowState(Window w) internal
	{
			if( && .isShowing())
			{
					(WindowPeer(.getPeer())).updateFocusableWindowState();
			}
			for(int32 i = int32(0); i < w.ownedWindowList.size(); i++)
			{
					Window child = Window(w.ownedWindowList.elementAt(i).get());
					if()
					{
							updateChildFocusableWindowState(child);
					}
			}
	}

	/*
     * Returns a list of all displayable Windows, i. e. all the
     * Windows which peer is not null.
     *
     * @see #addNotify
     * @see #removeNotify
     */

	function getAllWindows() internal returns(IdentityArrayList)
	{
	}

	function getAllUnblockedWindows() internal returns(IdentityArrayList)
	{
	}

	function removeFromWindowList(AppContext context, WeakReference weakThis) private
	{
	}

	function setLayersOpaque(Component component, bool isOpaque) private
	{
	}

	/**
 * Limit the given double value with the given range.
 */

	function limit(int64 value, int64 min, int64 max) private returns(int64)
	{
			;
			;
			return value;
	}

}

//Optional.empty


