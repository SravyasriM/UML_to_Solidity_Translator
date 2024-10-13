pragma solidity 0.7.2;

//package java.lang


import "java/lang/reflect/AnnotatedElement.sol";

import "java/lang/reflect/Array.sol";

import "java/lang/reflect/GenericArrayType.sol";

import "java/lang/reflect/GenericDeclaration.sol";

import "java/lang/reflect/Member.sol";

import "java/lang/reflect/Field.sol";

import "java/lang/reflect/Executable.sol";

import "java/lang/reflect/Method.sol";

import "java/lang/reflect/Constructor.sol";

import "java/lang/reflect/Modifier.sol";

import "java/lang/reflect/Type.sol";

import "java/lang/reflect/TypeVariable.sol";

import "java/lang/reflect/InvocationTargetException.sol";

import "java/lang/reflect/AnnotatedType.sol";

import "java/lang/ref/SoftReference.sol";

import "java/io/InputStream.sol";

import "java/io/ObjectStreamField.sol";

import "java/security/AccessController.sol";

import "java/security/PrivilegedAction.sol";

import "java/util/ArrayList.sol";

import "java/util/Arrays.sol";

import "java/util/Collection.sol";

import "java/util/HashSet.sol";

import "java/util/LinkedHashMap.sol";

import "java/util/List.sol";

import "java/util/Set.sol";

import "java/util/Map.sol";

import "java/util/HashMap.sol";

import "java/util/Objects.sol";

import "sun/misc/Unsafe.sol";

import "sun/reflect/CallerSensitive.sol";

import "sun/reflect/ConstantPool.sol";

import "sun/reflect/Reflection.sol";

import "sun/reflect/ReflectionFactory.sol";

import "sun/reflect/generics/factory/CoreReflectionFactory.sol";

import "sun/reflect/generics/factory/GenericsFactory.sol";

import "sun/reflect/generics/repository/ClassRepository.sol";

import "sun/reflect/generics/repository/MethodRepository.sol";

import "sun/reflect/generics/repository/ConstructorRepository.sol";

import "sun/reflect/generics/scope/ClassScope.sol";

import "sun/security/util/SecurityConstants.sol";

import "java/lang/annotation/Annotation.sol";

import "java/lang/reflect/Proxy.sol";

import "sun/reflect/annotation.sol";

import "sun/reflect/misc/ReflectUtil.sol";

/**
 * Instances of the class {@code Class} represent classes and
 * interfaces in a running Java application.  An enum is a kind of
 * class and an annotation is a kind of interface.  Every array also
 * belongs to a class that is reflected as a {@code Class} object
 * that is shared by all arrays with the same element type and number
 * of dimensions.  The primitive Java types ({@code boolean},
 * {@code byte}, {@code char}, {@code short},
 * {@code int}, {@code long}, {@code float}, and
 * {@code double}), and the keyword {@code void} are also
 * represented as {@code Class} objects.
 *
 * <p> {@code Class} has no public constructor. Instead {@code Class}
 * objects are constructed automatically by the Java Virtual Machine as classes
 * are loaded and by calls to the {@code defineClass} method in the class
 * loader.
 *
 * <p> The following example uses a {@code Class} object to print the
 * class name of an object:
 *
 * <blockquote><pre>
 *     void printClassName(Object obj) {
 *         System.out.println("The class of " + obj +
 *                            " is " + obj.getClass().getName());
 *     }
 * </pre></blockquote>
 *
 * <p> It is also possible to get the {@code Class} object for a named
 * type (or for void) using a class literal.  See Section 15.8.2 of
 * <cite>The Java&trade; Language Specification</cite>.
 * For example:
 *
 * <blockquote>
 *     {@code System.out.println("The name of class Foo is: "+Foo.class.getName());}
 * </blockquote>
 *
 * @param <T> the type of the class modeled by this {@code Class}
 * object.  For example, the type of {@code String.class} is {@code
 * Class<String>}.  Use {@code Class<?>} if the class being modeled is
 * unknown.
 *
 * @author  unascribed
 * @see     java.lang.ClassLoader#defineClass(byte[], int, int)
 * @since   JDK1.0
 */

contract Class
{
	/*<T> implements java.io.Serializable,
                              GenericDeclaration,
                              Type,
                              AnnotatedElement */

	int32 static  immutable ANNOTATION = int32(0x00002000);

	int32 static  immutable ENUM = int32(0x00004000);

	int32 static  immutable SYNTHETIC = int32(0x00001000);

	function registerNatives() virtual external;

	/**
 * Converts the object to a string. The string representation is the
 * string "class" or "interface", followed by a space, and then by the
 * fully qualified name of the class in the format returned by
 * {@code getName}.  If this {@code Class} object represents a
 * primitive type, this method returns the name of the primitive type.  If
 * this {@code Class} object represents void this method returns
 * "void".
 *
 * @return a string representation of this class object.
 */

	function toString() public returns(String)
	{
			return (isInterface() ? (isPrimitive() ? "class " : "") : "interface ") + getName();
	}

	/**
 * Returns a string describing this {@code Class}, including
 * information about modifiers and type parameters.
 *
 * The string is formatted as a list of type modifiers, if any,
 * followed by the kind of type (empty string for primitive types
 * and {@code class}, {@code enum}, {@code interface}, or
 * <code>&#64;</code>{@code interface}, as appropriate), followed
 * by the type's name, followed by an angle-bracketed
 * comma-separated list of the type's type parameters, if any.
 *
 * A space is used to separate modifiers from one another and to
 * separate any modifiers from the kind of type. The modifiers
 * occur in canonical order. If there are no type parameters, the
 * type parameter list is elided.
 *
 * <p>Note that since information about the runtime representation
 * of a type is being generated, modifiers not present on the
 * originating source code or illegal on the originating source
 * code may be present.
 *
 * @return a string describing this {@code Class}, including
 * information about modifiers and type parameters
 *
 * @since 1.8
 */

	function toGenericString() public returns(String)
	{
			if(isPrimitive())
			{
					return toString();
			}
			else
			{
					StringBuilder sb;
					// Class modifiers are a superset of interface modifiers

					int32 modifiers = int32(getModifiers() & .classModifiers());
					if(modifiers != 0)
					{
							.append(Integer_Library.toString(modifiers));
							.append(" ");
					}
					if(isAnnotation())
					{
							.append("@");
					}
					if(isInterface())
					{
							// Note: all annotation types are interfaces

							.append("interface");
					}
					else
					{
							if(isEnum());
							else
							{
								.append("class");							}

					}

					.append(" ");
					.append(getName());
					if(typeparms.length > 0)
					{
							bool first = bool(true);
							.append("<");
							for(uint256 iterator_var = uint256(0); iterator_var < typeparms.length; iterator_var++)
							{
									TypeVariable typeparm = TypeVariable(typeparms[uint256(iterator_var)]);
									if(!first;);
									.append(.getTypeName());
									first = false;
							}
							.append(">");
					}
					return .toString();
			}

	}

	/**
 * Returns the {@code Class} object associated with the class or
 * interface with the given string name.  Invoking this method is
 * equivalent to:
 *
 * <blockquote>
 *  {@code Class.forName(className, true, currentLoader)}
 * </blockquote>
 *
 * where {@code currentLoader} denotes the defining class loader of
 * the current class.
 *
 * <p> For example, the following code fragment returns the
 * runtime {@code Class} descriptor for the class named
 * {@code java.lang.Thread}:
 *
 * <blockquote>
 *   {@code Class t = Class.forName("java.lang.Thread")}
 * </blockquote>
 * <p>
 * A call to {@code forName("X")} causes the class named
 * {@code X} to be initialized.
 *
 * @param      className   the fully qualified name of the desired class.
 * @return     the {@code Class} object for the class with the
 *             specified name.
 * @exception LinkageError if the linkage fails
 * @exception ExceptionInInitializerError if the initialization provoked
 *            by this method fails
 * @exception ClassNotFoundException if the class cannot be located
 */

	function forName(string className) public returns(Class)
	{
			return 
	}

	/**
 * Returns the {@code Class} object associated with the class or
 * interface with the given string name, using the given class loader.
 * Given the fully qualified name for a class or interface (in the same
 * format returned by {@code getName}) this method attempts to
 * locate, load, and link the class or interface.  The specified class
 * loader is used to load the class or interface.  If the parameter
 * {@code loader} is null, the class is loaded through the bootstrap
 * class loader.  The class is initialized only if the
 * {@code initialize} parameter is {@code true} and if it has
 * not been initialized earlier.
 *
 * <p> If {@code name} denotes a primitive type or void, an attempt
 * will be made to locate a user-defined class in the unnamed package whose
 * name is {@code name}. Therefore, this method cannot be used to
 * obtain any of the {@code Class} objects representing primitive
 * types or void.
 *
 * <p> If {@code name} denotes an array class, the component type of
 * the array class is loaded but not initialized.
 *
 * <p> For example, in an instance method the expression:
 *
 * <blockquote>
 *  {@code Class.forName("Foo")}
 * </blockquote>
 *
 * is equivalent to:
 *
 * <blockquote>
 *  {@code Class.forName("Foo", true, this.getClass().getClassLoader())}
 * </blockquote>
 *
 * Note that this method throws errors related to loading, linking or
 * initializing as specified in Sections 12.2, 12.3 and 12.4 of <em>The
 * Java Language Specification</em>.
 * Note that this method does not check whether the requested class
 * is accessible to its caller.
 *
 * <p> If the {@code loader} is {@code null}, and a security
 * manager is present, and the caller's class loader is not null, then this
 * method calls the security manager's {@code checkPermission} method
 * with a {@code RuntimePermission("getClassLoader")} permission to
 * ensure it's ok to access the bootstrap class loader.
 *
 * @param name       fully qualified name of the desired class
 * @param initialize if {@code true} the class will be initialized.
 *                   See Section 12.4 of <em>The Java Languag                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      e Specification</em>.
 * @param loader     class loader from which the class must be loaded
 * @return           class object representing the desired class
 *
 * @exception LinkageError if the linkage fails
 * @exception ExceptionInInitializerError if the initialization provoked
 *            by this method fails
 * @exception ClassNotFoundException if the class cannot be located by
 *            the specified class loader
 *
 * @see       java.lang.Class#forName(String)
 * @see       java.lang.ClassLoader
 * @since     1.2
 */

	function forName(string name, bool initialize, ClassLoader loader) public returns(Class)
	{
			return 
	}

	/**
 * Called after security checks have been made.
 */

	function forName0(string name, bool initialize, ClassLoader loader) virtual external returns(Class);

	/**
 * Creates a new instance of the class represented by this {@code Class}
 * object.  The class is instantiated as if by a {@code new}
 * expression with an empty argument list.  The class is initialized if it
 * has not already been initialized.
 *
 * <p>Note that this method propagates any exception thrown by the
 * nullary constructor, including a checked exception.  Use of
 * this method effectively bypasses the compile-time exception
 * checking that would otherwise be performed by the compiler.
 * The {@link
 * java.lang.reflect.Constructor#newInstance(java.lang.Object...)
 * Constructor.newInstance} method avoids this problem by wrapping
 * any exception thrown by the constructor in a (checked) {@link
 * java.lang.reflect.InvocationTargetException}.
 *
 * @return  a newly allocated instance of the class represented by this
 *          object.
 * @throws  IllegalAccessException  if the class or its nullary
 *          constructor is not accessible.
 * @throws  InstantiationException
 *          if this {@code Class} represents an abstract class,
 *          an interface, an array class, a primitive type, or void;
 *          or if the class has no nullary constructor;
 *          or if the instantiation fails for some other reason.
 * @throws  ExceptionInInitializerError if the initialization
 *          provoked by this method fails.
 * @throws  SecurityException
 *          If a security manager, <i>s</i>, is present and
 *          the caller's class loader is not the same as or an
 *          ancestor of the class loader for the current class and
 *          invocation of {@link SecurityManager#checkPackageAccess
 *          s.checkPackageAccess()} denies access to the package
 *          of this class.
 */

	function newInstance() public returns(T)
	{
			if()
			{
					checkMemberAccess(Member.PUBLIC, .getCallerClass(), false);
			}
			// Constructor lookup

			if()
			{
					if()
					{
					}
						//try

							Constructor c;
							cachedConstructor = c;

						/* catch (NoSuchMethodException e) {
    throw (InstantiationException) new InstantiationException(getName()).initCause(e);
}*/


			}
			Constructor tmpConstructor = Constructor(cachedConstructor);
			// Security check (same as in java.lang.reflect.Constructor)

			int32 modifiers = int32(.getModifiers());
			if(
				//try

					return .newInstance();

				/* catch (InvocationTargetException e) {
    Unsafe.getUnsafe().throwException(e.getTargetException());
    // Not reached
    return null;
}*/


	}

	Constructor transient  cachedConstructor;

	Class transient  newInstanceCallerCache;

	/**
 * Determines if the specified {@code Object} is assignment-compatible
 * with the object represented by this {@code Class}.  This method is
 * the dynamic equivalent of the Java language {@code instanceof}
 * operator. The method returns {@code true} if the specified
 * {@code Object} argument is non-null and can be cast to the
 * reference type represented by this {@code Class} object without
 * raising a {@code ClassCastException.} It returns {@code false}
 * otherwise.
 *
 * <p> Specifically, if this {@code Class} object represents a
 * declared class, this method returns {@code true} if the specified
 * {@code Object} argument is an instance of the represented class (or
 * of any of its subclasses); it returns {@code false} otherwise. If
 * this {@code Class} object represents an array class, this method
 * returns {@code true} if the specified {@code Object} argument
 * can be converted to an object of the array class by an identity
 * conversion or by a widening reference conversion; it returns
 * {@code false} otherwise. If this {@code Class} object
 * represents an interface, this method returns {@code true} if the
 * class or any superclass of the specified {@code Object} argument
 * implements this interface; it returns {@code false} otherwise. If
 * this {@code Class} object represents a primitive type, this method
 * returns {@code false}.
 *
 * @param   obj the object to check
 * @return  true if {@code obj} is an instance of this class
 *
 * @since JDK1.1
 */

	function isInstance(Object obj) virtual external returns(bool);

	/**
 * Determines if the class or interface represented by this
 * {@code Class} object is either the same as, or is a superclass or
 * superinterface of, the class or interface represented by the specified
 * {@code Class} parameter. It returns {@code true} if so;
 * otherwise it returns {@code false}. If this {@code Class}
 * object represents a primitive type, this method returns
 * {@code true} if the specified {@code Class} parameter is
 * exactly this {@code Class} object; otherwise it returns
 * {@code false}.
 *
 * <p> Specifically, this method tests whether the type represented by the
 * specified {@code Class} parameter can be converted to the type
 * represented by this {@code Class} object via an identity conversion
 * or via a widening reference conversion. See <em>The Java Language
 * Specification</em>, sections 5.1.1 and 5.1.4 , for details.
 *
 * @param cls the {@code Class} object to be checked
 * @return the {@code boolean} value indicating whether objects of the
 * type {@code cls} can be assigned to objects of this class
 * @exception NullPointerException if the specified Class parameter is
 *            null.
 * @since JDK1.1
 */

	function isAssignableFrom(Class cls) virtual external returns(bool);

	/**
 * Determines if the specified {@code Class} object represents an
 * interface type.
 *
 * @return  {@code true} if this object represents an interface;
 *          {@code false} otherwise.
 */

	function isInterface() virtual external returns(bool);

	/**
 * Determines if this {@code Class} object represents an array class.
 *
 * @return  {@code true} if this object represents an array class;
 *          {@code false} otherwise.
 * @since   JDK1.1
 */

	function isArray() virtual external returns(bool);

	/**
 * Determines if the specified {@code Class} object represents a
 * primitive type.
 *
 * <p> There are nine predefined {@code Class} objects to represent
 * the eight primitive types and void.  These are created by the Java
 * Virtual Machine, and have the same names as the primitive types that
 * they represent, namely {@code boolean}, {@code byte},
 * {@code char}, {@code short}, {@code int},
 * {@code long}, {@code float}, and {@code double}.
 *
 * <p> These objects may only be accessed via the following public static
 * final variables, and are the only {@code Class} objects for which
 * this method returns {@code true}.
 *
 * @return true if and only if this class represents a primitive type
 *
 * @see     java.lang.Boolean#TYPE
 * @see     java.lang.Character#TYPE
 * @see     java.lang.Byte#TYPE
 * @see     java.lang.Short#TYPE
 * @see     java.lang.Integer#TYPE
 * @see     java.lang.Long#TYPE
 * @see     java.lang.Float#TYPE
 * @see     java.lang.Double#TYPE
 * @see     java.lang.Void#TYPE
 * @since JDK1.1
 */

	function isPrimitive() virtual external returns(bool);

	/**
 * Returns true if this {@code Class} object represents an annotation
 * type.  Note that if this method returns true, {@link #isInterface()}
 * would also return true, as all annotation types are also interfaces.
 *
 * @return {@code true} if this class object represents an annotation
 *      type; {@code false} otherwise
 * @since 1.5
 */

	function isAnnotation() public returns(bool)
	{
			return (getModifiers() & ANNOTATION) != 0;
	}

	/**
 * Returns {@code true} if this class is a synthetic class;
 * returns {@code false} otherwise.
 * @return {@code true} if and only if this class is a synthetic class as
 *         defined by the Java Language Specification.
 * @jls 13.1 The Form of a Binary
 * @since 1.5
 */

	function isSynthetic() public returns(bool)
	{
			return (getModifiers() & SYNTHETIC) != 0;
	}

	/**
 * Returns the  name of the entity (class, interface, array class,
 * primitive type, or void) represented by this {@code Class} object,
 * as a {@code String}.
 *
 * <p> If this class object represents a reference type that is not an
 * array type then the binary name of the class is returned, as specified
 * by
 * <cite>The Java&trade; Language Specification</cite>.
 *
 * <p> If this class object represents a primitive type or void, then the
 * name returned is a {@code String} equal to the Java language
 * keyword corresponding to the primitive type or void.
 *
 * <p> If this class object represents a class of arrays, then the internal
 * form of the name consists of the name of the element type preceded by
 * one or more '{@code [}' characters representing the depth of the array
 * nesting.  The encoding of element type names is as follows:
 *
 * <blockquote><table summary="Element types and encodings">
 * <tr><th> Element Type <th> &nbsp;&nbsp;&nbsp; <th> Encoding
 * <tr><td> boolean      <td> &nbsp;&nbsp;&nbsp; <td align=center> Z
 * <tr><td> byte         <td> &nbsp;&nbsp;&nbsp; <td align=center> B
 * <tr><td> char         <td> &nbsp;&nbsp;&nbsp; <td align=center> C
 * <tr><td> class or interface
 *                       <td> &nbsp;&nbsp;&nbsp; <td align=center> L<i>classname</i>;
 * <tr><td> double       <td> &nbsp;&nbsp;&nbsp; <td align=center> D
 * <tr><td> float        <td> &nbsp;&nbsp;&nbsp; <td align=center> F
 * <tr><td> int          <td> &nbsp;&nbsp;&nbsp; <td align=center> I
 * <tr><td> long         <td> &nbsp;&nbsp;&nbsp; <td align=center> J
 * <tr><td> short        <td> &nbsp;&nbsp;&nbsp; <td align=center> S
 * </table></blockquote>
 *
 * <p> The class or interface name <i>classname</i> is the binary name of
 * the class specified above.
 *
 * <p> Examples:
 * <blockquote><pre>
 * String.class.getName()
 *     returns "java.lang.String"
 * byte.class.getName()
 *     returns "byte"
 * (new Object[3]).getClass().getName()
 *     returns "[Ljava.lang.Object;"
 * (new int[3][4][5][6][7][8][9]).getClass().getName()
 *     returns "[[[[[[[I"
 * </pre></blockquote>
 *
 * @return  the name of the class or interface
 *          represented by this object.
 */

	function getName() public returns(String)
	{
			string memory name = string();
			if();
			return name;
	}

	// cache the name to reduce the number of calls into the VM

	string transient  name;

	function getName0() virtual external returns(String);

	/**
 * Returns the class loader for the class.  Some implementations may use
 * null to represent the bootstrap class loader. This method will return
 * null in such implementations if this class was loaded by the bootstrap
 * class loader.
 *
 * <p> If a security manager is present, and the caller's class loader is
 * not null and the caller's class loader is not the same as or an ancestor of
 * the class loader for the class whose class loader is requested, then
 * this method calls the security manager's {@code checkPermission}
 * method with a {@code RuntimePermission("getClassLoader")}
 * permission to ensure it's ok to access the class loader for the class.
 *
 * <p>If this object
 * represents a primitive type or void, null is returned.
 *
 * @return  the class loader that loaded the class or interface
 *          represented by this object.
 * @throws SecurityException
 *    if a security manager exists and its
 *    {@code checkPermission} method denies
 *    access to the class loader for the class.
 * @see java.lang.ClassLoader
 * @see SecurityManager#checkPermission
 * @see java.lang.RuntimePermission
 */

	function getClassLoader() public returns(ClassLoader)
	{
			ClassLoader cl = ClassLoader(getClassLoader0());
			if();
			SecurityManager sm = SecurityManager(.getSecurityManager());
			if()
			{
					.checkClassLoaderPermission(cl, .getCallerClass());
			}
			return cl;
	}

	/**
 * Returns the {@code Class} representing the superclass of the entity
 * (class, interface, primitive type or void) represented by this
 * {@code Class}.  If this {@code Class} represents either the
 * {@code Object} class, an interface, a primitive type, or void, then
 * null is returned.  If this object represents an array class then the
 * {@code Class} object representing the {@code Object} class is
 * returned.
 *
 * @return the superclass of the class represented by this object.
 */

	function getSuperclass() virtual external returns(Class);

	/**
 * Returns the {@code Type} representing the direct superclass of
 * the entity (class, interface, primitive type or void) represented by
 * this {@code Class}.
 *
 * <p>If the superclass is a parameterized type, the {@code Type}
 * object returned must accurately reflect the actual type
 * parameters used in the source code. The parameterized type
 * representing the superclass is created if it had not been
 * created before. See the declaration of {@link
 * java.lang.reflect.ParameterizedType ParameterizedType} for the
 * semantics of the creation process for parameterized types.  If
 * this {@code Class} represents either the {@code Object}
 * class, an interface, a primitive type, or void, then null is
 * returned.  If this object represents an array class then the
 * {@code Class} object representing the {@code Object} class is
 * returned.
 *
 * @throws java.lang.reflect.GenericSignatureFormatError if the generic
 *     class signature does not conform to the format specified in
 *     <cite>The Java&trade; Virtual Machine Specification</cite>
 * @throws TypeNotPresentException if the generic superclass
 *     refers to a non-existent type declaration
 * @throws java.lang.reflect.MalformedParameterizedTypeException if the
 *     generic superclass refers to a parameterized type that cannot be
 *     instantiated  for any reason
 * @return the superclass of the class represented by this object
 * @since 1.5
 */

	function getGenericSuperclass() public returns(Type)
	{
			ClassRepository info = ClassRepository(getGenericInfo());
			if()
			{
					return getSuperclass();
			}
			// but this API returns null for interfaces

			if(isInterface())
			{
					return 
			}
			return .getSuperclass();
	}

	/**
 * Gets the package for this class.  The class loader of this class is used
 * to find the package.  If the class was loaded by the bootstrap class
 * loader the set of packages loaded from CLASSPATH is searched to find the
 * package of the class. Null is returned if no package object was created
 * by the class loader of this class.
 *
 * <p> Packages have attributes for versions and specifications only if the
 * information was defined in the manifests that accompany the classes, and
 * if the class loader created the package instance with the attributes
 * from the manifest.
 *
 * @return the package of the class, or null if no package
 *         information is available from the archive or codebase.
 */

	function getPackage() public returns(Package)
	{
			return 
	}

	/**
 * Returns the {@code Class} representing the component type of an
 * array.  If this class does not represent an array class this method
 * returns null.
 *
 * @return the {@code Class} representing the component type of this
 * class if this class is an array
 * @see     java.lang.reflect.Array
 * @since JDK1.1
 */

	function getComponentType() virtual external returns(Class);

	/**
 * Returns the Java language modifiers for this class or interface, encoded
 * in an integer. The modifiers consist of the Java Virtual Machine's
 * constants for {@code public}, {@code protected},
 * {@code private}, {@code final}, {@code static},
 * {@code abstract} and {@code interface}; they should be decoded
 * using the methods of class {@code Modifier}.
 *
 * <p> If the underlying class is an array class, then its
 * {@code public}, {@code private} and {@code protected}
 * modifiers are the same as those of its component type.  If this
 * {@code Class} represents a primitive type or void, its
 * {@code public} modifier is always {@code true}, and its
 * {@code protected} and {@code private} modifiers are always
 * {@code false}. If this object represents an array class, a
 * primitive type or void, then its {@code final} modifier is always
 * {@code true} and its interface modifier is always
 * {@code false}. The values of its other modifiers are not determined
 * by this specification.
 *
 * <p> The modifier encodings are defined in <em>The Java Virtual Machine
 * Specification</em>, table 4.1.
 *
 * @return the {@code int} representing the modifiers for this class
 * @see     java.lang.reflect.Modifier
 * @since JDK1.1
 */

	function getModifiers() virtual external returns(int32);

	/**
 * If this {@code Class} object represents a local or anonymous
 * class within a method, returns a {@link
 * java.lang.reflect.Method Method} object representing the
 * immediately enclosing method of the underlying class. Returns
 * {@code null} otherwise.
 *
 * In particular, this method returns {@code null} if the underlying
 * class is a local or anonymous class immediately enclosed by a type
 * declaration, instance initializer or static initializer.
 *
 * @return the immediately enclosing method of the underlying class, if
 *     that class is a local or anonymous class; otherwise {@code null}.
 *
 * @throws SecurityException
 *         If a security manager, <i>s</i>, is present and any of the
 *         following conditions is met:
 *
 *         <ul>
 *
 *         <li> the caller's class loader is not the same as the
 *         class loader of the enclosing class and invocation of
 *         {@link SecurityManager#checkPermission
 *         s.checkPermission} method with
 *         {@code RuntimePermission("accessDeclaredMembers")}
 *         denies access to the methods within the enclosing class
 *
 *         <li> the caller's class loader is not the same as or an
 *         ancestor of the class loader for the enclosing class and
 *         invocation of {@link SecurityManager#checkPackageAccess
 *         s.checkPackageAccess()} denies access to the package
 *         of the enclosing class
 *
 *         </ul>
 * @since 1.5
 */

	function getEnclosingMethod() public returns(Method)
	{
			EnclosingMethodInfo enclosingInfo = EnclosingMethodInfo(getEnclosingMethodInfo());
			if();
			else
			{
					if(!.isMethod(););
					MethodRepository typeInfo = MethodRepository(.make(.getDescriptor(), getFactory()));
					Class returnType = Class(toClass(.getReturnType()));
					// don't have generics information

					for(int32 i = int32(0); i < parameterClasses.length; i++)
					{
						parameterClasses[uint256(i)] = toClass(parameterTypes[uint256(i)]);					}
					// Perform access check

					Class enclosingCandidate = Class(.getEnclosingClass());
					.checkMemberAccess(Member.DECLARED, .getCallerClass(), true);
			}

	}

	function getEnclosingMethodInfo() private returns(EnclosingMethodInfo)
	{
			if();
			else
			{
					return 
			}

	}

	function toClass(Type o) private returns(Class)
	{
			return Class(o);
	}

	/**
 * If this {@code Class} object represents a local or anonymous
 * class within a constructor, returns a {@link
 * java.lang.reflect.Constructor Constructor} object representing
 * the immediately enclosing constructor of the underlying
 * class. Returns {@code null} otherwise.  In particular, this
 * method returns {@code null} if the underlying class is a local
 * or anonymous class immediately enclosed by a type declaration,
 * instance initializer or static initializer.
 *
 * @return the immediately enclosing constructor of the underlying class, if
 *     that class is a local or anonymous class; otherwise {@code null}.
 * @throws SecurityException
 *         If a security manager, <i>s</i>, is present and any of the
 *         following conditions is met:
 *
 *         <ul>
 *
 *         <li> the caller's class loader is not the same as the
 *         class loader of the enclosing class and invocation of
 *         {@link SecurityManager#checkPermission
 *         s.checkPermission} method with
 *         {@code RuntimePermission("accessDeclaredMembers")}
 *         denies access to the constructors within the enclosing class
 *
 *         <li> the caller's class loader is not the same as or an
 *         ancestor of the class loader for the enclosing class and
 *         invocation of {@link SecurityManager#checkPackageAccess
 *         s.checkPackageAccess()} denies access to the package
 *         of the enclosing class
 *
 *         </ul>
 * @since 1.5
 */

	function getEnclosingConstructor() public returns(Constructor)
	{
			EnclosingMethodInfo enclosingInfo = EnclosingMethodInfo(getEnclosingMethodInfo());
			if();
			else
			{
					if(!.isConstructor(););
					ConstructorRepository typeInfo = ConstructorRepository(.make(.getDescriptor(), getFactory()));
					// don't have generics information

					for(int32 i = int32(0); i < parameterClasses.length; i++)
					{
						parameterClasses[uint256(i)] = toClass(parameterTypes[uint256(i)]);					}
					// Perform access check

					Class enclosingCandidate = Class(.getEnclosingClass());
					.checkMemberAccess(Member.DECLARED, .getCallerClass(), true);
			}

	}

	/**
 * If the class or interface represented by this {@code Class} object
 * is a member of another class, returns the {@code Class} object
 * representing the class in which it was declared.  This method returns
 * null if this class or interface is not a member of any other class.  If
 * this {@code Class} object represents an array class, a primitive
 * type, or void,then this method returns null.
 *
 * @return the declaring class for this class
 * @throws SecurityException
 *         If a security manager, <i>s</i>, is present and the caller's
 *         class loader is not the same as or an ancestor of the class
 *         loader for the declaring class and invocation of {@link
 *         SecurityManager#checkPackageAccess s.checkPackageAccess()}
 *         denies access to the package of the declaring class
 * @since JDK1.1
 */

	function getDeclaringClass() public returns(Class)
	{
			Class candidate = Class(getDeclaringClass0());
			if();
			return candidate;
	}

	function getDeclaringClass0() virtual external returns(Class);

	/**
 * Returns the immediately enclosing class of the underlying
 * class.  If the underlying class is a top level class this
 * method returns {@code null}.
 * @return the immediately enclosing class of the underlying class
 * @exception  SecurityException
 *             If a security manager, <i>s</i>, is present and the caller's
 *             class loader is not the same as or an ancestor of the class
 *             loader for the enclosing class and invocation of {@link
 *             SecurityManager#checkPackageAccess s.checkPackageAccess()}
 *             denies access to the package of the enclosing class
 * @since 1.5
 */

	function getEnclosingClass() public returns(Class)
	{
			// anonymous class.

			EnclosingMethodInfo enclosingInfo = EnclosingMethodInfo(getEnclosingMethodInfo());
			Class enclosingCandidate;
			if()
			{
					// This is a top level or a nested class or an inner class (a, b, or c)

					enclosingCandidate = getDeclaringClass();
			}
			else
			{
					Class enclosingClass = Class(.getEnclosingClass());
					// This is a local class or an anonymous class (d or e)

					if( || );
					else
					{
						enclosingCandidate = enclosingClass;					}

			}

			if();
			return enclosingCandidate;
	}

	/**
 * Returns the simple name of the underlying class as given in the
 * source code. Returns an empty string if the underlying class is
 * anonymous.
 *
 * <p>The simple name of an array is the simple name of the
 * component type with "[]" appended.  In particular the simple
 * name of an array whose component type is anonymous is "[]".
 *
 * @return the simple name of the underlying class
 * @since 1.5
 */

	function getSimpleName() public returns(String)
	{
			if(isArray());
			string memory simpleName = string(getSimpleBinaryName());
			if()
			{
					// top level class

					simpleName = getName();
					// strip the package name

					return .substring(.lastIndexOf(".") + 1);
			}
			// Remove leading "\$[0-9]*" from the name

			int32 length = int32(.length());
			if(length < 1 || .charAt(0) != "$");
			int32 index = int32(1);
			while(index < length && isAsciiDigit(.charAt(index)))
			{
				index++;
			}
			// Eventually, this is the empty string iff this is an anonymous class

			return .substring(index);
	}

	/**
 * Return an informative string for the name of this type.
 *
 * @return an informative string for the name of this type
 * @since 1.8
 */

	function getTypeName() public returns(String)
	{
			if(isArray())
			{
						//try

							Class cl;
							int32 dimensions = int32(0);
							while(.isArray())
							{
									dimensions++;
									cl = .getComponentType();

							}
							StringBuilder sb;
							.append(.getName());
							for(int32 i = int32(0); i < dimensions; i++)
							{
									.append("[]");
							}
							return .toString();

						/* catch (Throwable e) {
/*FALLTHRU*/
}*/


			}
			return getName();
	}

	/**
 * Character.isDigit answers {@code true} to some non-ascii
 * digits.  This one does not.
 */

	function isAsciiDigit(byte c) private returns(bool)
	{
			return "0" <= c && c <= "9";
	}

	/**
 * Returns the canonical name of the underlying class as
 * defined by the Java Language Specification.  Returns null if
 * the underlying class does not have a canonical name (i.e., if
 * it is a local or anonymous class or an array whose component
 * type does not have a canonical name).
 * @return the canonical name of the underlying class if it exists, and
 * {@code null} otherwise.
 * @since 1.5
 */

	function getCanonicalName() public returns(String)
	{
			if(isArray())
			{
					string memory canonicalName = string(getComponentType().getCanonicalName());
					if();
					else
					{
						return 					}

			}
			if(isLocalOrAnonymousClass());
			Class enclosingClass = Class(getEnclosingClass());
			if()
			{
					// top level class

					return getName();
			}
			else
			{
					string memory enclosingName = string(.getCanonicalName());
					if();
					return enclosingName + "." + getSimpleName();
			}

	}

	/**
 * Returns {@code true} if and only if the underlying class
 * is an anonymous class.
 *
 * @return {@code true} if and only if this class is an anonymous class.
 * @since 1.5
 */

	function isAnonymousClass() public returns(bool)
	{
			return "".equals(getSimpleName());
	}

	/**
 * Returns {@code true} if and only if the underlying class
 * is a local class.
 *
 * @return {@code true} if and only if this class is a local class.
 * @since 1.5
 */

	function isLocalClass() public returns(bool)
	{
			return isLocalOrAnonymousClass() && !isAnonymousClass();
	}

	/**
 * Returns {@code true} if and only if the underlying class
 * is a member class.
 *
 * @return {@code true} if and only if this class is a member class.
 * @since 1.5
 */

	function isMemberClass() public returns(bool)
	{
			return  && !isLocalOrAnonymousClass();
	}

	/**
 * Returns the "simple binary name" of the underlying class, i.e.,
 * the binary name without the leading enclosing class name.
 * Returns {@code null} if the underlying class is a top level
 * class.
 */

	function getSimpleBinaryName() private returns(String)
	{
			Class enclosingClass = Class(getEnclosingClass());
			if(// top level class

);
				//try

					return getName().substring(.getName().length());

				/* catch (IndexOutOfBoundsException ex) {
    throw new InternalError("Malformed class name", ex);
}*/


	}

	/**
 * Returns {@code true} if this is a local class or an anonymous
 * class.  Returns {@code false} otherwise.
 */

	function isLocalOrAnonymousClass() private returns(bool)
	{
			// anonymous class.

			return ;
	}

	/**
 * Returns a {@code Field} object that reflects the specified public member
 * field of the class or interface represented by this {@code Class}
 * object. The {@code name} parameter is a {@code String} specifying the
 * simple name of the desired field.
 *
 * <p> The field to be reflected is determined by the algorithm that
 * follows.  Let C be the class or interface represented by this object:
 *
 * <OL>
 * <LI> If C declares a public field with the name specified, that is the
 *      field to be reflected.</LI>
 * <LI> If no field was found in step 1 above, this algorithm is applied
 *      recursively to each direct superinterface of C. The direct
 *      superinterfaces are searched in the order they were declared.</LI>
 * <LI> If no field was found in steps 1 and 2 above, and C has a
 *      superclass S, then this algorithm is invoked recursively upon S.
 *      If C has no superclass, then a {@code NoSuchFieldException}
 *      is thrown.</LI>
 * </OL>
 *
 * <p> If this {@code Class} object represents an array type, then this
 * method does not find the {@code length} field of the array type.
 *
 * @param name the field name
 * @return the {@code Field} object of this class specified by
 *         {@code name}
 * @throws NoSuchFieldException if a field with the specified name is
 *         not found.
 * @throws NullPointerException if {@code name} is {@code null}
 * @throws SecurityException
 *         If a security manager, <i>s</i>, is present and
 *         the caller's class loader is not the same as or an
 *         ancestor of the class loader for the current class and
 *         invocation of {@link SecurityManager#checkPackageAccess
 *         s.checkPackageAccess()} denies access to the package
 *         of this class.
 *
 * @since JDK1.1
 * @jls 8.2 Class Members
 * @jls 8.3 Field Declarations
 */

	function getField(string name) public returns(Field)
	{
			checkMemberAccess(Member.PUBLIC, .getCallerClass(), true);
			Field field = Field(getField0(name));
			if()
			{
			}
			return field;
	}

	/**
 * Returns a {@code Method} object that reflects the specified public
 * member method of the class or interface represented by this
 * {@code Class} object. The {@code name} parameter is a
 * {@code String} specifying the simple name of the desired method. The
 * {@code parameterTypes} parameter is an array of {@code Class}
 * objects that identify the method's formal parameter types, in declared
 * order. If {@code parameterTypes} is {@code null}, it is
 * treated as if it were an empty array.
 *
 * <p> If the {@code name} is "{@code <init>}" or "{@code <clinit>}" a
 * {@code NoSuchMethodException} is raised. Otherwise, the method to
 * be reflected is determined by the algorithm that follows.  Let C be the
 * class or interface represented by this object:
 * <OL>
 * <LI> C is searched for a <I>matching method</I>, as defined below. If a
 *      matching method is found, it is reflected.</LI>
 * <LI> If no matching method is found by step 1 then:
 *   <OL TYPE="a">
 *   <LI> If C is a class other than {@code Object}, then this algorithm is
 *        invoked recursively on the superclass of C.</LI>
 *   <LI> If C is the class {@code Object}, or if C is an interface, then
 *        the superinterfaces of C (if any) are searched for a matching
 *        method. If any such method is found, it is reflected.</LI>
 *   </OL></LI>
 * </OL>
 *
 * <p> To find a matching method in a class or interface C:&nbsp; If C
 * declares exactly one public method with the specified name and exactly
 * the same formal parameter types, that is the method reflected. If more
 * than one such method is found in C, and one of these methods has a
 * return type that is more specific than any of the others, that method is
 * reflected; otherwise one of the methods is chosen arbitrarily.
 *
 * <p>Note that there may be more than one matching method in a
 * class because while the Java language forbids a class to
 * declare multiple methods with the same signature but different
 * return types, the Java virtual machine does not.  This
 * increased flexibility in the virtual machine can be used to
 * implement various language features.  For example, covariant
 * returns can be implemented with {@linkplain
 * java.lang.reflect.Method#isBridge bridge methods}; the bridge
 * method and the method being overridden would have the same
 * signature but different return types.
 *
 * <p> If this {@code Class} object represents an array type, then this
 * method does not find the {@code clone()} method.
 *
 * <p> Static methods declared in superinterfaces of the class or interface
 * represented by this {@code Class} object are not considered members of
 * the class or interface.
 *
 * @param name the name of the method
 * @param parameterTypes the list of parameters
 * @return the {@code Method} object that matches the specified
 *         {@code name} and {@code parameterTypes}
 * @throws NoSuchMethodException if a matching method is not found
 *         or if the name is "&lt;init&gt;"or "&lt;clinit&gt;".
 * @throws NullPointerException if {@code name} is {@code null}
 * @throws SecurityException
 *         If a security manager, <i>s</i>, is present and
 *         the caller's class loader is not the same as or an
 *         ancestor of the class loader for the current class and
 *         invocation of {@link SecurityManager#checkPackageAccess
 *         s.checkPackageAccess()} denies access to the package
 *         of this class.
 *
 * @jls 8.2 Class Members
 * @jls 8.4 Method Declarations
 * @since JDK1.1
 */

	function getMethod(string name, Class parameterTypes) public returns(Method)
	{
			checkMemberAccess(Member.PUBLIC, .getCallerClass(), true);
			Method method;
			if()
			{
			}
			return method;
	}

	/**
 * Returns a {@code Constructor} object that reflects the specified
 * public constructor of the class represented by this {@code Class}
 * object. The {@code parameterTypes} parameter is an array of
 * {@code Class} objects that identify the constructor's formal
 * parameter types, in declared order.
 *
 * If this {@code Class} object represents an inner class
 * declared in a non-static context, the formal parameter types
 * include the explicit enclosing instance as the first parameter.
 *
 * <p> The constructor to reflect is the public constructor of the class
 * represented by this {@code Class} object whose formal parameter
 * types match those specified by {@code parameterTypes}.
 *
 * @param parameterTypes the parameter array
 * @return the {@code Constructor} object of the public constructor that
 *         matches the specified {@code parameterTypes}
 * @throws NoSuchMethodException if a matching method is not found.
 * @throws SecurityException
 *         If a security manager, <i>s</i>, is present and
 *         the caller's class loader is not the same as or an
 *         ancestor of the class loader for the current class and
 *         invocation of {@link SecurityManager#checkPackageAccess
 *         s.checkPackageAccess()} denies access to the package
 *         of this class.
 *
 * @since JDK1.1
 */

	function getConstructor(Class parameterTypes) public returns(Constructor)
	{
			checkMemberAccess(Member.PUBLIC, .getCallerClass(), true);
			return 
	}

	/**
 * Returns a {@code Field} object that reflects the specified declared
 * field of the class or interface represented by this {@code Class}
 * object. The {@code name} parameter is a {@code String} that specifies
 * the simple name of the desired field.
 *
 * <p> If this {@code Class} object represents an array type, then this
 * method does not find the {@code length} field of the array type.
 *
 * @param name the name of the field
 * @return  the {@code Field} object for the specified field in this
 *          class
 * @throws  NoSuchFieldException if a field with the specified name is
 *          not found.
 * @throws  NullPointerException if {@code name} is {@code null}
 * @throws  SecurityException
 *          If a security manager, <i>s</i>, is present and any of the
 *          following conditions is met:
 *
 *          <ul>
 *
 *          <li> the caller's class loader is not the same as the
 *          class loader of this class and invocation of
 *          {@link SecurityManager#checkPermission
 *          s.checkPermission} method with
 *          {@code RuntimePermission("accessDeclaredMembers")}
 *          denies access to the declared field
 *
 *          <li> the caller's class loader is not the same as or an
 *          ancestor of the class loader for the current class and
 *          invocation of {@link SecurityManager#checkPackageAccess
 *          s.checkPackageAccess()} denies access to the package
 *          of this class
 *
 *          </ul>
 *
 * @since JDK1.1
 * @jls 8.2 Class Members
 * @jls 8.3 Field Declarations
 */

	function getDeclaredField(string name) public returns(Field)
	{
			checkMemberAccess(Member.DECLARED, .getCallerClass(), true);
			Field field = Field(searchFields(privateGetDeclaredFields(false), name));
			if()
			{
			}
			return field;
	}

	/**
 * Returns a {@code Method} object that reflects the specified
 * declared method of the class or interface represented by this
 * {@code Class} object. The {@code name} parameter is a
 * {@code String} that specifies the simple name of the desired
 * method, and the {@code parameterTypes} parameter is an array of
 * {@code Class} objects that identify the method's formal parameter
 * types, in declared order.  If more than one method with the same
 * parameter types is declared in a class, and one of these methods has a
 * return type that is more specific than any of the others, that method is
 * returned; otherwise one of the methods is chosen arbitrarily.  If the
 * name is "&lt;init&gt;"or "&lt;clinit&gt;" a {@code NoSuchMethodException}
 * is raised.
 *
 * <p> If this {@code Class} object represents an array type, then this
 * method does not find the {@code clone()} method.
 *
 * @param name the name of the method
 * @param parameterTypes the parameter array
 * @return  the {@code Method} object for the method of this class
 *          matching the specified name and parameters
 * @throws  NoSuchMethodException if a matching method is not found.
 * @throws  NullPointerException if {@code name} is {@code null}
 * @throws  SecurityException
 *          If a security manager, <i>s</i>, is present and any of the
 *          following conditions is met:
 *
 *          <ul>
 *
 *          <li> the caller's class loader is not the same as the
 *          class loader of this class and invocation of
 *          {@link SecurityManager#checkPermission
 *          s.checkPermission} method with
 *          {@code RuntimePermission("accessDeclaredMembers")}
 *          denies access to the declared method
 *
 *          <li> the caller's class loader is not the same as or an
 *          ancestor of the class loader for the current class and
 *          invocation of {@link SecurityManager#checkPackageAccess
 *          s.checkPackageAccess()} denies access to the package
 *          of this class
 *
 *          </ul>
 *
 * @jls 8.2 Class Members
 * @jls 8.4 Method Declarations
 * @since JDK1.1
 */

	function getDeclaredMethod(string name, Class parameterTypes) public returns(Method)
	{
			checkMemberAccess(Member.DECLARED, .getCallerClass(), true);
			Method method;
			if()
			{
			}
			return method;
	}

	/**
 * Returns a {@code Constructor} object that reflects the specified
 * constructor of the class or interface represented by this
 * {@code Class} object.  The {@code parameterTypes} parameter is
 * an array of {@code Class} objects that identify the constructor's
 * formal parameter types, in declared order.
 *
 * If this {@code Class} object represents an inner class
 * declared in a non-static context, the formal parameter types
 * include the explicit enclosing instance as the first parameter.
 *
 * @param parameterTypes the parameter array
 * @return  The {@code Constructor} object for the constructor with the
 *          specified parameter list
 * @throws  NoSuchMethodException if a matching method is not found.
 * @throws  SecurityException
 *          If a security manager, <i>s</i>, is present and any of the
 *          following conditions is met:
 *
 *          <ul>
 *
 *          <li> the caller's class loader is not the same as the
 *          class loader of this class and invocation of
 *          {@link SecurityManager#checkPermission
 *          s.checkPermission} method with
 *          {@code RuntimePermission("accessDeclaredMembers")}
 *          denies access to the declared constructor
 *
 *          <li> the caller's class loader is not the same as or an
 *          ancestor of the class loader for the current class and
 *          invocation of {@link SecurityManager#checkPackageAccess
 *          s.checkPackageAccess()} denies access to the package
 *          of this class
 *
 *          </ul>
 *
 * @since JDK1.1
 */

	function getDeclaredConstructor(Class parameterTypes) public returns(Constructor)
	{
			checkMemberAccess(Member.DECLARED, .getCallerClass(), true);
			return 
	}

	/**
 * Finds a resource with a given name.  The rules for searching resources
 * associated with a given class are implemented by the defining
 * {@linkplain ClassLoader class loader} of the class.  This method
 * delegates to this object's class loader.  If this object was loaded by
 * the bootstrap class loader, the method delegates to {@link
 * ClassLoader#getSystemResourceAsStream}.
 *
 * <p> Before delegation, an absolute resource name is constructed from the
 * given resource name using this algorithm:
 *
 * <ul>
 *
 * <li> If the {@code name} begins with a {@code '/'}
 * (<tt>'&#92;u002f'</tt>), then the absolute name of the resource is the
 * portion of the {@code name} following the {@code '/'}.
 *
 * <li> Otherwise, the absolute name is of the following form:
 *
 * <blockquote>
 *   {@code modified_package_name/name}
 * </blockquote>
 *
 * <p> Where the {@code modified_package_name} is the package name of this
 * object with {@code '/'} substituted for {@code '.'}
 * (<tt>'&#92;u002e'</tt>).
 *
 * </ul>
 *
 * @param  name name of the desired resource
 * @return      A {@link java.io.InputStream} object or {@code null} if
 *              no resource with this name is found
 * @throws  NullPointerException If {@code name} is {@code null}
 * @since  JDK1.1
 */

	function getResourceAsStream(string name) public returns(InputStream)
	{
			name = resolveName(name);
			ClassLoader cl = ClassLoader(getClassLoader0());
			if()
			{
					// A system class.

					return .getSystemResourceAsStream(name);
			}
			return .getResourceAsStream(name);
	}

	/**
 * Finds a resource with a given name.  The rules for searching resources
 * associated with a given class are implemented by the defining
 * {@linkplain ClassLoader class loader} of the class.  This method
 * delegates to this object's class loader.  If this object was loaded by
 * the bootstrap class loader, the method delegates to {@link
 * ClassLoader#getSystemResource}.
 *
 * <p> Before delegation, an absolute resource name is constructed from the
 * given resource name using this algorithm:
 *
 * <ul>
 *
 * <li> If the {@code name} begins with a {@code '/'}
 * (<tt>'&#92;u002f'</tt>), then the absolute name of the resource is the
 * portion of the {@code name} following the {@code '/'}.
 *
 * <li> Otherwise, the absolute name is of the following form:
 *
 * <blockquote>
 *   {@code modified_package_name/name}
 * </blockquote>
 *
 * <p> Where the {@code modified_package_name} is the package name of this
 * object with {@code '/'} substituted for {@code '.'}
 * (<tt>'&#92;u002e'</tt>).
 *
 * </ul>
 *
 * @param  name name of the desired resource
 * @return      A  {@link java.net.URL} object or {@code null} if no
 *              resource with this name is found
 * @since  JDK1.1
 */

	function getResource(string name) public returns(URL)
	{
			name = resolveName(name);
			ClassLoader cl = ClassLoader(getClassLoader0());
			if()
			{
					// A system class.

					return .getSystemResource(name);
			}
			return .getResource(name);
	}

	/**
 * protection domain returned when the internal domain is null
 */

	ProtectionDomain static  allPermDomain;

	/**
 * Returns the {@code ProtectionDomain} of this class.  If there is a
 * security manager installed, this method first calls the security
 * manager's {@code checkPermission} method with a
 * {@code RuntimePermission("getProtectionDomain")} permission to
 * ensure it's ok to get the
 * {@code ProtectionDomain}.
 *
 * @return the ProtectionDomain of this class
 *
 * @throws SecurityException
 *        if a security manager exists and its
 *        {@code checkPermission} method doesn't allow
 *        getting the ProtectionDomain.
 *
 * @see java.security.ProtectionDomain
 * @see SecurityManager#checkPermission
 * @see java.lang.RuntimePermission
 * @since 1.2
 */

	function getProtectionDomain() public returns(ProtectionDomain)
	{
			SecurityManager sm = SecurityManager(.getSecurityManager());
			if()
			{
					.checkPermission(SecurityConstants.GET_PD_PERMISSION);
			}
			ProtectionDomain pd = ProtectionDomain(getProtectionDomain0());
			if()
			{
					if()
					{
							Permissions perms;
							.add(SecurityConstants.ALL_PERMISSION);
							;
					}
					pd = allPermDomain;
			}
			return pd;
	}

	/**
 * Returns the ProtectionDomain of this class.
 */

	function getProtectionDomain0() virtual external returns(ProtectionDomain);

	/*
     * Return the Virtual Machine's Class object for the named
     * primitive type.
     */

	function getPrimitiveClass(string name) virtual external returns(Class);

	/*
     * Check if client is allowed to access members.  If access is denied,
     * throw a SecurityException.
     *
     * This method also enforces package access.
     *
     * <p> Default policy: allow all clients access with normal Java access
     * control.
     */

	function checkMemberAccess(int32 which, Class caller, bool checkProxyInterfaces) private
	{
			SecurityManager s = SecurityManager(.getSecurityManager());
			if()
			{
					/* Default policy allows access to all {@link Member#PUBLIC} members,
             * as well as access to classes that have the same class loader as the caller.
             * In all other cases, it requires RuntimePermission("accessDeclaredMembers")
             * permission.
             */

					ClassLoader ccl;
					ClassLoader cl = ClassLoader(getClassLoader0());
					if(which != Member.PUBLIC)
					{
							if(ccl != cl)
							{
									.checkPermission(SecurityConstants.CHECK_MEMBER_ACCESS_PERMISSION);
							}
					}
			}
	}

	/*
     * Checks if a client loaded in ClassLoader ccl is allowed to access this
     * class under the current package access policy. If access is denied,
     * throw a SecurityException.
     */

	function checkPackageAccess(ClassLoader ccl, bool checkProxyInterfaces) private
	{
			SecurityManager s = SecurityManager(.getSecurityManager());
			if()
			{
					ClassLoader cl = ClassLoader(getClassLoader0());
					// check package access on the proxy interfaces

					if()
					{
					}
			}
	}

	/**
 * Add a package name prefix if the name is not absolute Remove leading "/"
 * if name is absolute
 */

	function resolveName(string name) private returns(String)
	{
			if()
			{
					return name;
			}
			if(!.startsWith("/");)
			{
					Class c;
					while(.isArray())
					{
							c = .getComponentType();

					}
					string memory baseName = string(.getName());
					int32 index = int32(.lastIndexOf("."));
					if(index != -1;)
					{
							name = .substring(0, index).replace(".", "/") + "/" + name;
					}
			}
			else
			{
					name = .substring(1);
			}

			return name;
	}

	// Caches for certain reflective results

	bool static  useCaches = bool(true);

	SoftReference transient  reflectionData;

	// that redefines this class or a superclass.

	int32 transient  classRedefinedCount = int32(0);

	// Lazily create and cache ReflectionData

	function reflectionData() private returns(ReflectionData)
	{
			SoftReference reflectionData = SoftReference();
			int32 classRedefinedCount = int32();
			ReflectionData rd;
			if(useCaches &&  &&  && rd.redefinedCount == classRedefinedCount)
			{
					return rd;
			}
			// -> create and replace new instance

			return newReflectionData(reflectionData, classRedefinedCount);
	}

	function newReflectionData(SoftReference oldReflectionData, int32 classRedefinedCount) private returns(ReflectionData)
	{
			if(!useCaches;);
			while(true)
			{
					ReflectionData rd = new ReflectionData(classRedefinedCount);
					// else retry

					oldReflectionData = ;
					classRedefinedCount = ;
					if( &&  && rd.redefinedCount == classRedefinedCount)
					{
							return rd;
					}

			}
	}

	// Generic signature handling

	function getGenericSignature0() virtual external returns(String);

	// Generic info repository; lazily initialized

	ClassRepository transient  genericInfo

	// accessor for factory

	function getFactory() private returns(GenericsFactory)
	{
			// create scope and factory

			return 
	}

	// generic info is lazily initialized

	function getGenericInfo() private returns(ClassRepository)
	{
			ClassRepository genericInfo = ClassRepository();
			if()
			{
					string memory signature = string(getGenericSignature0());
					if()
					{
							genericInfo = ClassRepository.NONE;
					}
					else
					{
							genericInfo = .make(signature, getFactory());
					}

					 = genericInfo;
			}
			return 
	}

	function getExecutableTypeAnnotationBytes(Executable ex) internal returns(

	function getField0(string name) private returns(Field)
	{
			// class which is being queried.

			Field res;
			// Search declared public fields

			if()
			{
					return res;
			}
			for(int32 i = int32(0); i < interfaces.length; i++)
			{
					Class c = Class(interfaces[uint256(i)]);
					if()
					{
							return res;
					}
			}
			// Direct superclass, recursively

			if(!isInterface();)
			{
					Class c = Class(getSuperclass());
					if()
					{
							if()
							{
									return res;
							}
					}
			}
			return 
	}

	/**
 * use serialVersionUID from JDK 1.1 for interoperability
 */

	int64 static  immutable serialVersionUID;

	

	/**
 * Returns the assertion status that would be assigned to this
 * class if it were to be initialized at the time this method is invoked.
 * If this class has had its assertion status set, the most recent
 * setting will be returned; otherwise, if any package default assertion
 * status pertains to this class, the most recent setting for the most
 * specific pertinent package default assertion status is returned;
 * otherwise, if this class is not a system class (i.e., it has a
 * class loader) its class loader's default assertion status is returned;
 * otherwise, the system class default assertion status is returned.
 * <p>
 * Few programmers will have any need for this method; it is provided
 * for the benefit of the JRE itself.  (It allows a class to determine at
 * the time that it is initialized whether assertions should be enabled.)
 * Note that this method is not guaranteed to return the actual
 * assertion status that was (or will be) associated with the specified
 * class when it was (or will be) initialized.
 *
 * @return the desired assertion status of the specified class.
 * @see    java.lang.ClassLoader#setClassAssertionStatus
 * @see    java.lang.ClassLoader#setPackageAssertionStatus
 * @see    java.lang.ClassLoader#setDefaultAssertionStatus
 * @since  1.4
 */

	function desiredAssertionStatus() public returns(bool)
	{
			ClassLoader loader = ClassLoader(getClassLoader());
			// If the loader is null this is a system class, so ask the VM

			if();
			return 
	}

	// Retrieves the desired assertion status of this class from the VM

	function desiredAssertionStatus0(Class clazz) virtual external returns(bool);

	/**
 * Returns true if and only if this class was declared as an enum in the
 * source code.
 *
 * @return true if and only if this class was declared as an enum in the
 *     source code
 * @since 1.5
 */

	function isEnum() public returns(bool)
	{
			// don't do the former.

			return () != 0 && ;
	}

	// Fetches the factory for reflective objects

	function getReflectionFactory() private returns(ReflectionFactory)
	{
			if()
			{
					;
			}
			return reflectionFactory;
	}

	ReflectionFactory static  reflectionFactory;

	// To be able to query system properties as soon as they're available

	bool static  initted = bool(false);

	function checkInitted() private
	{
			if(initted);
	}

	

	/**
 * Returns a map from simple name to enum constant.  This package-private
 * method is used internally by Enum to implement
 * {@code public static <T extends Enum<T>> T valueOf(Class<T>, String)}
 * efficiently.  Note that the map is returned by this method is
 * created lazily on first use.  Typically it won't ever get created.
 */

	function enumConstantDirectory() internal returns(Map)
	{
			if()
			{
					if();
					Map m;
					enumConstantDirectory = m;
			}
			return enumConstantDirectory;
	}

	Map transient  enumConstantDirectory;

	/**
 * Casts an object to the class or interface represented
 * by this {@code Class} object.
 *
 * @param obj the object to be cast
 * @return the object after casting, or null if obj is null
 *
 * @throws ClassCastException if the object is not
 * null and is not assignable to the type T.
 *
 * @since 1.5
 */

	function cast(Object obj) public returns(T)
	{
			if();
			return T(obj);
	}

	function cannotCastMsg(Object obj) private returns(String)
	{
			return "Cannot cast " + .getClass().getName() + " to " + getName();
	}

	/**
 * Casts this {@code Class} object to represent a subclass of the class
 * represented by the specified class object.  Checks that the cast
 * is valid, and throws a {@code ClassCastException} if it is not.  If
 * this method succeeds, it always returns a reference to this class object.
 *
 * <p>This method is useful when a client needs to "narrow" the type of
 * a {@code Class} object to pass it to an API that restricts the
 * {@code Class} objects that it is willing to accept.  A cast would
 * generate a compile-time warning, as the correctness of the cast
 * could not be checked at runtime (because generic types are implemented
 * by erasure).
 *
 * @param <U> the type to cast this class object to
 * @param clazz the class of the type to cast this class object to
 * @return this {@code Class} object, cast to represent a subclass of
 *    the specified class object.
 * @throws ClassCastException if this {@code Class} object does not
 *    represent a subclass of the specified class (here "subclass" includes
 *    the class itself).
 * @since 1.5
 */

	function asSubclass(Class clazz) public returns(Class)
	{
	}

	/**
 * @throws NullPointerException {@inheritDoc}
 * @since 1.5
 */

	function getAnnotation(Class annotationClass) public returns(A)
	{
			return A();
	}

	/**
 * {@inheritDoc}
 * @throws NullPointerException {@inheritDoc}
 * @since 1.5
 */

	function isAnnotationPresent(Class annotationClass) public returns(bool)
	{
			return 
	}

	/**
 * @throws NullPointerException {@inheritDoc}
 * @since 1.8
 */

	function getDeclaredAnnotation(Class annotationClass) public returns(A)
	{
			return A();
	}

	// Annotations cache

	AnnotationData transient  annotationData;

	function annotationData() private returns(AnnotationData)
	{
			while(true)
			{
					// retry loop

					AnnotationData annotationData = AnnotationData();
					int32 classRedefinedCount = int32();
					if( && annotationData.redefinedCount == classRedefinedCount)
					{
							return annotationData;
					}
					// null or stale annotationData -> optimistically create new instance

					AnnotationData newAnnotationData = AnnotationData(createAnnotationData(classRedefinedCount));

			}
	}

	function createAnnotationData(int32 classRedefinedCount) private returns(AnnotationData)
	{
			Map declaredAnnotations;
			Class superClass = Class(getSuperclass());
			Map annotations;
			if()
			{
					Map superAnnotations = Map(.annotationData().annotations);
			}
			if()
			{
					// no inherited annotations -> share the Map with declaredAnnotations

					annotations = declaredAnnotations;
			}
			else
			{
					// at least one inherited annotation -> declared may override inherited

					.putAll(declaredAnnotations);
			}

			return new AnnotationData(annotations, declaredAnnotations, classRedefinedCount);
	}

	AnnotationType transient  annotationType;

	function casAnnotationType(AnnotationType oldType, AnnotationType newType) internal returns(bool)
	{
			return 
	}

	function getAnnotationType() internal returns(AnnotationType)
	{
			return annotationType;
	}

	function getDeclaredAnnotationMap() internal returns(Map)
	{
			return annotationData().declaredAnnotations;
	}

	/* Backing store of user-defined values pertaining to this class.
     * Maintained by the ClassValue class.
     */

	ClassValueMap transient  classValueMap;

	/**
 * Returns an {@code AnnotatedType} object that represents the use of a
 * type to specify the superclass of the entity represented by this {@code
 * Class} object. (The <em>use</em> of type Foo to specify the superclass
 * in '...  extends Foo' is distinct from the <em>declaration</em> of type
 * Foo.)
 *
 * <p> If this {@code Class} object represents a type whose declaration
 * does not explicitly indicate an annotated superclass, then the return
 * value is an {@code AnnotatedType} object representing an element with no
 * annotations.
 *
 * <p> If this {@code Class} represents either the {@code Object} class, an
 * interface type, an array type, a primitive type, or void, the return
 * value is {@code null}.
 *
 * @return an object representing the superclass
 * @since 1.8
 */

	function getAnnotatedSuperclass() public returns(AnnotatedType)
	{
			if( || isInterface() || isArray() || isPrimitive() || )
			{
					return 
			}
			return 
	}

}

library Class_Library
{
	function registerNatives() virtual external;

	/**
 * Returns the {@code Class} object associated with the class or
 * interface with the given string name.  Invoking this method is
 * equivalent to:
 *
 * <blockquote>
 *  {@code Class.forName(className, true, currentLoader)}
 * </blockquote>
 *
 * where {@code currentLoader} denotes the defining class loader of
 * the current class.
 *
 * <p> For example, the following code fragment returns the
 * runtime {@code Class} descriptor for the class named
 * {@code java.lang.Thread}:
 *
 * <blockquote>
 *   {@code Class t = Class.forName("java.lang.Thread")}
 * </blockquote>
 * <p>
 * A call to {@code forName("X")} causes the class named
 * {@code X} to be initialized.
 *
 * @param      className   the fully qualified name of the desired class.
 * @return     the {@code Class} object for the class with the
 *             specified name.
 * @exception LinkageError if the linkage fails
 * @exception ExceptionInInitializerError if the initialization provoked
 *            by this method fails
 * @exception ClassNotFoundException if the class cannot be located
 */

	function forName(string className) public returns(Class)
	{
			return 
	}

	/**
 * Returns the {@code Class} object associated with the class or
 * interface with the given string name, using the given class loader.
 * Given the fully qualified name for a class or interface (in the same
 * format returned by {@code getName}) this method attempts to
 * locate, load, and link the class or interface.  The specified class
 * loader is used to load the class or interface.  If the parameter
 * {@code loader} is null, the class is loaded through the bootstrap
 * class loader.  The class is initialized only if the
 * {@code initialize} parameter is {@code true} and if it has
 * not been initialized earlier.
 *
 * <p> If {@code name} denotes a primitive type or void, an attempt
 * will be made to locate a user-defined class in the unnamed package whose
 * name is {@code name}. Therefore, this method cannot be used to
 * obtain any of the {@code Class} objects representing primitive
 * types or void.
 *
 * <p> If {@code name} denotes an array class, the component type of
 * the array class is loaded but not initialized.
 *
 * <p> For example, in an instance method the expression:
 *
 * <blockquote>
 *  {@code Class.forName("Foo")}
 * </blockquote>
 *
 * is equivalent to:
 *
 * <blockquote>
 *  {@code Class.forName("Foo", true, this.getClass().getClassLoader())}
 * </blockquote>
 *
 * Note that this method throws errors related to loading, linking or
 * initializing as specified in Sections 12.2, 12.3 and 12.4 of <em>The
 * Java Language Specification</em>.
 * Note that this method does not check whether the requested class
 * is accessible to its caller.
 *
 * <p> If the {@code loader} is {@code null}, and a security
 * manager is present, and the caller's class loader is not null, then this
 * method calls the security manager's {@code checkPermission} method
 * with a {@code RuntimePermission("getClassLoader")} permission to
 * ensure it's ok to access the bootstrap class loader.
 *
 * @param name       fully qualified name of the desired class
 * @param initialize if {@code true} the class will be initialized.
 *                   See Section 12.4 of <em>The Java Languag                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      e Specification</em>.
 * @param loader     class loader from which the class must be loaded
 * @return           class object representing the desired class
 *
 * @exception LinkageError if the linkage fails
 * @exception ExceptionInInitializerError if the initialization provoked
 *            by this method fails
 * @exception ClassNotFoundException if the class cannot be located by
 *            the specified class loader
 *
 * @see       java.lang.Class#forName(String)
 * @see       java.lang.ClassLoader
 * @since     1.2
 */

	function forName(string name, bool initialize, ClassLoader loader) public returns(Class)
	{
			return 
	}

	/**
 * Called after security checks have been made.
 */

	function forName0(string name, bool initialize, ClassLoader loader) virtual external returns(Class);

	function toClass(Type o) private returns(Class)
	{
			return Class(o);
	}

	/**
 * Character.isDigit answers {@code true} to some non-ascii
 * digits.  This one does not.
 */

	function isAsciiDigit(byte c) private returns(bool)
	{
			return "0" <= c && c <= "9";
	}

	/*
     * Return the Virtual Machine's Class object for the named
     * primitive type.
     */

	function getPrimitiveClass(string name) virtual external returns(Class);

	function casReflectionData(Class clazz, SoftReference oldData, SoftReference newData) internal returns(bool)
	{
			return 
	}

	function casAnnotationType(Class clazz, AnnotationType oldType, AnnotationType newType) internal returns(bool)
	{
			return 
	}

	function casAnnotationData(Class clazz, AnnotationData oldData, AnnotationData newData) internal returns(bool)
	{
			return 
	}

	function getExecutableTypeAnnotationBytes(Executable ex) internal returns(

	// Retrieves the desired assertion status of this class from the VM

	function desiredAssertionStatus0(Class clazz) virtual external returns(bool);

	// Fetches the factory for reflective objects

	function getReflectionFactory() private returns(ReflectionFactory)
	{
			if()
			{
					;
			}
			return reflectionFactory;
	}

	function checkInitted() private
	{
			if(initted);
	}

}

