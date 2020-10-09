#!/bin/bash

RULES=(Rule_01 Rule_02 Rule_03 Rule_04 Rule_05 Rule_06 Rule_07 Rule_08 Rule_09 Rule_10 Rule_11 Rule_12 Rule_14 Rule_50)
CHECKERS="-enable-checker core.CallAndMessage -enable-checker core.DivideZero -enable-checker core.DynamicTypePropagation -enable-checker core.NonNullParamChecker -enable-checker core.NullDereference -enable-checker core.StackAddressEscape -enable-checker core.UndefinedBinaryOperatorResult -enable-checker core.VLASize -enable-checker core.uninitialized.ArraySubscript -enable-checker core.uninitialized.Assign -enable-checker core.uninitialized.Branch -enable-checker core.uninitialized.CapturedBlockVariable -enable-checker core.uninitialized.UndefReturn -enable-checker cplusplus.InnerPointer -enable-checker cplusplus.Move -enable-checker cplusplus.NewDelete -enable-checker cplusplus.NewDeleteLeaks -enable-checker deadcode.DeadStores -enable-checker nullability.NullPassedToNonnull -enable-checker nullability.NullReturnedFromNonnull -enable-checker security.insecureAPI.UncheckedReturn -enable-checker security.insecureAPI.getpw -enable-checker security.insecureAPI.gets -enable-checker security.insecureAPI.mkstemp -enable-checker security.insecureAPI.mktemp -enable-checker security.insecureAPI.vfork -enable-checker unix.API -enable-checker unix.Malloc -enable-checker unix.MallocSizeof -enable-checker unix.MismatchedDeallocator -enable-checker unix.Vfork -enable-checker unix.cstring.BadSizeArg -enable-checker unix.cstring.NullArg -enable-checker nullability.NullableDereferenced -enable-checker nullability.NullablePassedToNonnull -enable-checker nullability.NullableReturnedFromNonnull -enable-checker optin.cplusplus.UninitializedObject -enable-checker optin.cplusplus.VirtualCall -enable-checker optin.mpi.MPI-Checker -enable-checker optin.osx.OSObjectCStyleCast -enable-checker optin.osx.cocoa.localizability.EmptyLocalizationContextChecker -enable-checker optin.osx.cocoa.localizability.NonLocalizedStringChecker -enable-checker optin.performance.GCDAntipattern -enable-checker optin.performance.Padding -enable-checker optin.portability.UnixAPI -enable-checker osx.API -enable-checker osx.MIG -enable-checker osx.NumberObjectConversion -enable-checker osx.OSObjectRetainCount -enable-checker osx.ObjCProperty -enable-checker osx.SecKeychainAPI -enable-checker osx.cocoa.AtSync -enable-checker osx.cocoa.AutoreleaseWrite -enable-checker osx.cocoa.ClassRelease -enable-checker osx.cocoa.Dealloc -enable-checker osx.cocoa.IncompatibleMethodTypes -enable-checker osx.cocoa.Loops -enable-checker osx.cocoa.MissingSuperCall -enable-checker osx.cocoa.NSAutoreleasePool -enable-checker osx.cocoa.NSError -enable-checker osx.cocoa.NilArg -enable-checker osx.cocoa.NonNilReturnValue -enable-checker osx.cocoa.ObjCGenerics -enable-checker osx.cocoa.RetainCount -enable-checker osx.cocoa.RunLoopAutoreleaseLeak -enable-checker osx.cocoa.SelfInit -enable-checker osx.cocoa.SuperDealloc -enable-checker osx.cocoa.UnusedIvars -enable-checker osx.cocoa.VariadicMethodTypes -enable-checker osx.coreFoundation.CFError -enable-checker osx.coreFoundation.CFNumber -enable-checker osx.coreFoundation.CFRetainRelease -enable-checker osx.coreFoundation.containers.OutOfBounds -enable-checker osx.coreFoundation.containers.PointerSizedValues -enable-checker security.FloatLoopCounter -enable-checker security.insecureAPI.DeprecatedOrUnsafeBufferHandling -enable-checker security.insecureAPI.bcmp -enable-checker security.insecureAPI.bcopy -enable-checker security.insecureAPI.bzero -enable-checker security.insecureAPI.rand -enable-checker security.insecureAPI.strcpy -enable-checker valist.CopyToSelf -enable-checker valist.Uninitialized -enable-checker valist.Unterminated"

SAMPLES_HIGH=0
SAMPLES_MED=0
SAMPLES_LOW=0
SCORE_HIGH=0
SCORE_MED=0
SCORE_LOW=0

for i in ${RULES[@]}; do
    RULE_HIGH=0
    RULE_MED=0
    RULE_LOW=0
    RULE_SAMPLES_HIGH=0
    RULE_SAMPLES_MED=0
    RULE_SAMPLES_LOW=0

    for j in $i*/*high*.c; do
	if [ -f $j ]; then
	    scan-build-9 $CHECKERS --force-analyze-debug-code --status-bugs clang -Wall -c $j || let RULE_HIGH++
	    let RULE_SAMPLES_HIGH++
	fi
    done

    for j in $i*/*medium*.c; do
	if [ -f $j ]; then
	    scan-build-9 $CHECKERS --force-analyze-debug-code --status-bugs clang -Wall -c $j || let RULE_MED++
	    let RULE_SAMPLES_MED++
	fi
    done

    for j in $i*/*low*.c; do
	if [ -f $j ]; then
	    scan-build-9 $CHECKERS --force-analyze-debug-code --status-bugs clang -Wall -c $j || let RULE_LOW++
	    let RULE_SAMPLES_LOW++
	fi
    done

    echo "$i score High: $RULE_HIGH/$RULE_SAMPLES_HIGH Medium: $RULE_MED/$RULE_SAMPLES_MED Low: $RULE_LOW/$RULE_SAMPLES_LOW"

    let SCORE_HIGH+=$RULE_HIGH
    let SCORE_MED+=$RULE_MED
    let SCORE_LOW+=$RULE_LOW
    let SAMPLES_HIGH+=$RULE_SAMPLES_HIGH
    let SAMPLES_MED+=$RULE_SAMPLES_MED
    let SAMPLES_LOW+=$RULE_SAMPLES_LOW
done

echo "Combined score High: $SCORE_HIGH/$SAMPLES_HIGH Medium: $SCORE_MED/$SAMPLES_MED Low: $SCORE_LOW/$SAMPLES_LOW"
