import SwiftUI

protocol FakeItem: Identifiable {
    var name: String { get }
}

class FakeFile: FakeItem {
    let id = UUID()
    let name: String
    let type: String
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
}

class FakeFolder: FakeItem {
    let id = UUID()
    let name: String
    let items: [any FakeItem]
    
    init(name: String, items: [any FakeItem]) {
        self.name = name
        self.items = items
    }
}

struct FileManagerView: View {
    @State private var appeared = false
    
    let fakeFileSystem: [FakeFolder] = [
        FakeFolder(name: "dev", items: [
            FakeFile(name: "aes_0", type: "file"),
            FakeFile(name: "apfs-raw-device.2.0", type: "file"),
            FakeFile(name: "bpf0", type: "file"),
            FakeFile(name: "bpf1", type: "file"),
            FakeFile(name: "bpf2", type: "file"),
            FakeFile(name: "bpf3", type: "file"),
            FakeFile(name: "console", type: "file"),
            FakeFile(name: "cu.iap.uart-1", type: "file"),
            FakeFile(name: "disk0", type: "file"),
            FakeFile(name: "disk0s1", type: "file"),
            FakeFile(name: "disk1", type: "file"),
            FakeFile(name: "disk1s1", type: "file"),
            FakeFile(name: "disk1s2", type: "file"),
            FakeFile(name: "disk1s3", type: "file"),
            FakeFile(name: "disk1s4", type: "file"),
            FakeFile(name: "disk1s5", type: "file"),
            FakeFile(name: "disk1s6", type: "file"),
            FakeFile(name: "disk1s7", type: "file"),
            FakeFile(name: "disk2", type: "file"),
            FakeFile(name: "disk3", type: "file"),
            FakeFile(name: "fsevents", type: "file"),
            FakeFile(name: "klog", type: "file"),
            FakeFolder(name: "monotonic", items: [
                FakeFile(name: "uncore", type: "txt")
            ]),
            FakeFile(name: "null", type: "file"),
            FakeFile(name: "oslog", type: "file"),
            FakeFile(name: "oslog_stream", type: "file"),
            FakeFile(name: "perfmon_core", type: "file"),
            FakeFile(name: "perfmon_uncore", type: "file"),
            FakeFile(name: "pf", type: "file"),
            FakeFile(name: "pfm", type: "file"),
            FakeFile(name: "ptmx", type: "file"),
            FakeFile(name: "ptyp0", type: "file"),
            FakeFile(name: "ptyp1", type: "file"),
            FakeFile(name: "ptyp2", type: "file"),
            FakeFile(name: "ptyp3", type: "file"),
            FakeFile(name: "ptyp4", type: "file"),
            FakeFile(name: "ptyp5", type: "file"),
            FakeFile(name: "ptyp6", type: "file"),
            FakeFile(name: "ptyp7", type: "file"),
            FakeFile(name: "ptyp8", type: "file"),
            FakeFile(name: "ptyp9", type: "file"),
            FakeFile(name: "ptypa", type: "file"),
            FakeFile(name: "ptypb", type: "file"),
            FakeFile(name: "ptypc", type: "file"),
            FakeFile(name: "ptypd", type: "file"),
            FakeFile(name: "ptype", type: "file"),
            FakeFile(name: "ptypf", type: "file"),
            FakeFile(name: "random", type: "file"),
            FakeFile(name: "rsidk0", type: "file"),
            FakeFile(name: "rdisk0s1", type: "file"),
            FakeFile(name: "rdisk1", type: "file"),
            FakeFile(name: "rdisk1s1", type: "file"),
            FakeFile(name: "rdisk1s2", type: "file"),
            FakeFile(name: "rdisk1s3", type: "file"),
            FakeFile(name: "rdisk1s4", type: "file"),
            FakeFile(name: "rdisk1s5", type: "file"),
            FakeFile(name: "rdisk1s6", type: "file"),
            FakeFile(name: "rdisk1s7", type: "file"),
            FakeFile(name: "rdisk2", type: "file"),
            FakeFile(name: "rdisk3", type: "file"),
            FakeFile(name: "tty", type: "file"),
            FakeFile(name: "ttyp.iap.uart-1", type: "file"),
            FakeFile(name: "ttyp0", type: "file"),
            FakeFile(name: "ttyp1", type: "file"),
            FakeFile(name: "ttyp2", type: "file"),
            FakeFile(name: "ttyp3", type: "file"),
            FakeFile(name: "ttyp4", type: "file"),
            FakeFile(name: "ttyp5", type: "file"),
            FakeFile(name: "ttyp6", type: "file"),
            FakeFile(name: "ttyp7", type: "file"),
            FakeFile(name: "ttyp8", type: "file"),
            FakeFile(name: "ttyp9", type: "file"),
            FakeFile(name: "ttypa", type: "file"),
            FakeFile(name: "ttypb", type: "file"),
            FakeFile(name: "ttypc", type: "file"),
            FakeFile(name: "ttypd", type: "file"),
            FakeFile(name: "ttype", type: "file"),
            FakeFile(name: "ttypf", type: "file"),
            FakeFile(name: "uart-iap-uart-1", type: "file"),
            FakeFile(name: "urandom", type: "file"),
            FakeFile(name: "zero", type: "file")
        ]),
    FakeFolder(name: "usr", items: [
        FakeFolder(name: "bin", items: [
            FakeFile(name: "abmlite", type: "bin"),
            FakeFile(name: "afktool", type: "bin"),
            FakeFile(name: "brctl", type: "bin"),
            FakeFile(name: "codecctl", type: "bin"),
            FakeFile(name: "DumpBasebandCrash", type: "bin"),
            FakeFile(name: "fileproviderctl", type: "bin"),
            FakeFile(name: "footprint", type: "bin"),
            FakeFile(name: "hidutil", type: "bin"),
            FakeFile(name: "hpmdiagnose", type: "bin"),
            FakeFile(name: "IOMFB_FDR_Loader", type: "bin"),
            FakeFile(name: "kbdebug", type: "bin"),
            FakeFile(name: "lsdiagnose", type: "bin"),
            FakeFile(name: "ltop", type: "bin"),
            FakeFile(name: "nfsstat", type: "bin"),
            FakeFile(name: "PerfPowerServicesExtended", type: "bin"),
            FakeFile(name: "powerlogHelperd", type: "bin"),
            FakeFile(name: "swift-inspect", type: "bin"),
            FakeFile(name: "sysdiagnose", type: "bin"),
            FakeFile(name: "tailspin", type: "bin"),
            FakeFile(name: "taskinfo", type: "bin"),
            FakeFile(name: "umtool", type: "bin"),
            FakeFile(name: "vm_stat", type: "bin"),
            FakeFile(name: "zprint", type: "bin")
        ]),
        FakeFolder(name: "standalone", items: []),
        FakeFolder(name: "libexec", items: []),
        FakeFolder(name: "sbin", items: []),
        FakeFolder(name: "lib", items: [
            FakeFolder(name: "bbmasks", items: [
                FakeFile(name: "D53g_Audio.dmc", type: "dmc"),
                FakeFile(name: "D53g_Coex.dmc", type: "dmc"),
                FakeFile(name: "D53g_Default.dmc", type: "dmc"),
                FakeFile(name: "D53g_GPS.dmc", type: "dmc"),
                FakeFile(name: "D53g_Lite.dmc", type: "dmc"),
                FakeFile(name: "D53g_RF.dmc", type: "dmc"),
                FakeFile(name: "D53g_Sleep.dmc", type: "dmc"),
                FakeFile(name: "D53g_STx.dmc", type: "dmc"),
                FakeFile(name: "D53g_SUPL.dmc", type: "dmc"),
                FakeFile(name: "D53g_Verbose.dmc", type: "dmc"),
                FakeFile(name: "D53g_VoLTE.dmc", type: "dmc"),
                FakeFile(name: "D53p_Audio.dmc", type: "dmc"),
                FakeFile(name: "D53p_Coex.dmc", type: "dmc"),
                FakeFile(name: "D53p_Default.dmc", type: "dmc"),
                FakeFile(name: "D53p_GPS.dmc", type: "dmc"),
                FakeFile(name: "D53p_Lite.dmc", type: "dmc"),
                FakeFile(name: "D53p_RF.dmc", type: "dmc"),
                FakeFile(name: "D53p_Sleep.dmc", type: "dmc"),
                FakeFile(name: "D53p_STx.dmc", type: "dmc"),
                FakeFile(name: "D53p_SUPL.dmc", type: "dmc"),
                FakeFile(name: "D53p_Verbose.dmc", type: "dmc"),
                FakeFile(name: "D53p_VoLTE.dmc", type: "dmc")
            ]),
            FakeFile(name: "dyld", type: "dylib"),
            FakeFile(name: "libBacktraceRecording.dylib", type: "dylib"),
            FakeFile(name: "libCoreKE.dylib", type: "dylib"),
            FakeFile(name: "libFaultOrdering.dylib", type: "dylib"),
            FakeFile(name: "libMainThreadChecker.dylib", type: "dylib"),
            FakeFile(name: "libMTLCapture.dylib", type: "dylib"),
            FakeFile(name: "libMTLToolsDiagnostics.dylib", type: "dylib"),
            FakeFile(name: "libRPAC.dylib", type: "dylib"),
            FakeFile(name: "libSystem.B_asan.dylib", type: "dylib"),
            FakeFile(name: "libSystem_asan.dylib", type: "dylib"),
            FakeFolder(name: "log", items: []),
            FakeFolder(name: "swift", items: [
                FakeFile(name: "libswiftCreateML.dylib", type: "dylib"),
                FakeFile(name: "libswiftRemoteMirror.dylib", type: "dylib"),
                FakeFolder(name: "System.swiftcrossimport", items: [
                    FakeFile(name: "Foundation.swiftoverlay", type: "txt")
                ])
            ]),
            FakeFolder(name: "system", items: [
                FakeFolder(name: "introspection", items: [
                    FakeFile(name: "libdispatch.dylib", type: "dylib")
                ])
            ]),
            FakeFolder(name: "updaters", items: []),
            FakeFolder(name: "usd", items: []),
            FakeFolder(name: "xpc", items: [
                FakeFolder(name: "support.bundle", items: [
                    FakeFolder(name: "_CodeSignature", items: [
                        FakeFile(name: "CodeResources", type: "txt")
                    ]),
                    FakeFile(name: "info.plist", type: "plist"),
                    FakeFile(name: "support", type: "binary")
                ])
            ]),
            FakeFolder(name: "share", items: [
    FakeFolder(name: "com.apple.languageassetd", items: [
        FakeFile(name: "AssetInfo.plist", type: "plist")
    ]),
    FakeFolder(name: "misc", items: [
        FakeFile(name: "syscalls.json", type: "json"),
        FakeFile(name: "trace.codes", type: "txt")
    ]),
    FakeFolder(name: "zoneinfo", items: []),
    FakeFolder(name: "firmware", items: [
        FakeFolder(name: "bluetooth", items: [
            FakeFile(name: "ABC123XYZ_CRB_WW_08132020.ptb", type: "txt"),
            FakeFile(name: "DEF456UVW_CRB_WW_20221213.bin", type: "bin"),
            FakeFile(name: "GHI789RST_CRB_WW_08132020.ptb", type: "txt"),
            FakeFile(name: "JKL012MNO_CRB_WW_20221213.bin", type: "bin"),
            FakeFile(name: "PQR345STU_CRB_WW_20221213.bin", type: "bin"),
            FakeFile(name: "VWX678YZA_CRB_WW_20221213.bin", type: "bin")
        ])
    ]),
    FakeFolder(name: "locale", items: [
        FakeFolder(name: "UTF-8", items: [
            FakeFile(name: "LC_CTYPE", type: "txt")
        ])
    ]),
    FakeFolder(name: "morphun", items: [
        FakeFile(name: "config.properties", type: "txt"),
        FakeFolder(name: "dictionary", items: [])
    ]),
    FakeFolder(name: "progressui", items: [
        FakeFolder(name: "images-2x", items: [
            FakeFile(name: "solidfill.png", type: "png"),
            FakeFile(name: "emptyfill.png", type: "png"),
            FakeFile(name: "applelogo.png", type: "png")
        ]),
        FakeFile(name: "applelogo@2x.tga", type: "png"),
        FakeFile(name: "applelogo@3x.tga", type: "png")
    ]),
    FakeFolder(name: "tokenizer", items: [
        FakeFolder(name: "ja", items: [
            FakeFile(name: "matrix.bin", type: "bin"),
            FakeFile(name: "unk.dic", type: "txt"),
            FakeFile(name: "sys.dic", type: "txt"),
            FakeFile(name: "dicrc", type: "txt"),
            FakeFile(name: "char.bin", type: "bin")
        ]),
        FakeFolder(name: "zh", items: [
            FakeFolder(name: "yue-Hant", items: []),
            FakeFolder(name: "Hans", items: []),
            FakeFolder(name: "Hant", items: [])
        ]),
        FakeFolder(name: "ko", items: [
            FakeFile(name: "matrix.bin", type: "bin"),
            FakeFile(name: "unk.dic", type: "txt"),
            FakeFile(name: "sys.dic", type: "txt"),
            FakeFile(name: "dicrc", type: "txt"),
            FakeFile(name: "char.bin", type: "bin")
        ])
    ]),
    FakeFolder(name: "langid", items: [
        FakeFile(name: "langid.inv", type: "txt")
    ]),
    FakeFolder(name: "zoneinfo.default", items: [
        FakeFolder(name: "Africa", items: [])
    ]),
    FakeFolder(name: "icu", items: [
        FakeFile(name: "icudt70l.dat", type: "dylib"),
        FakeFile(name: "icutzformat.txt", type: "txt")
    ]),
    FakeFolder(name: "CSI", items: [
        FakeFile(name: "merger.pl", type: "txt")
    ])
])
        ]), // Close lib items array
    ]), // Close usr items array
    FakeFolder(name: "bin", items: [ // Start new root folder
        FakeFile(name: "df.dylib", type: "dylib"),
            FakeFile(name: "ps.dylib", type: "dylib")
        ]),
        FakeFolder(name: "sbin", items: [
    FakeFile(name: "mount_hfs", type: "bin"),
    FakeFile(name: "mount_apfs", type: "bin"),
    FakeFile(name: "fsck", type: "bin"),
    FakeFile(name: "fsck_exfat", type: "bin"),
    FakeFile(name: "fsck_hfs", type: "bin"),
    FakeFile(name: "fsck_apfs", type: "bin"),
    FakeFile(name: "mount_lifs", type: "bin"),
    FakeFile(name: "fsck_msdos", type: "bin"),
    FakeFile(name: "newfs_apfs", type: "bin"),
    FakeFile(name: "umount", type: "bin"),
    FakeFile(name: "mount_nfs", type: "bin"),
    FakeFile(name: "mount", type: "bin"),
    FakeFile(name: "newfs_hfs", type: "bin"),
    FakeFile(name: "launchd", type: "bin"),
    FakeFile(name: "newfs_exfat", type: "bin"),
    FakeFile(name: "mount_tmpfs", type: "bin"),
    FakeFile(name: "newfs_msdos", type: "bin")
    ]),
        FakeFolder(name: "etc", items: [
            FakeFolder(name: "racoon", items: []),
            FakeFolder(name: "asl", items: []),
            FakeFolder(name: "ppp", items: [])
        ] + Array(0...9).map { FakeFile(name: "config\($0)", type: "file") }),
        FakeFolder(name: "System", items: [
FakeFolder(name: "Cryptexes", items: [
    FakeFolder(name: "OS", items: [
        FakeFolder(name: "usr", items: [
            FakeFolder(name: "lib", items: [
                FakeFile(name: "libobjc-trampolines.dylib", type: "dylib"),
                FakeFile(name: "libstdc++.6.dylib", type: "dylib"),
                FakeFile(name: "libstdc++.6.0.9.dylib", type: "dylib"),
                FakeFolder(name: "swift", items: []),
                FakeFile(name: "libffi-trampolines.dylib", type: "dylib"),
                FakeFile(name: "libstdc++.dylib", type: "dylib")
            ]),
            FakeFolder(name: "System", items: [
                FakeFolder(name: "DriverKit", items: [
                    FakeFolder(name: "System", items: [
                        FakeFolder(name: "Library", items: [
                            FakeFolder(name: "dyld", items: [
                                FakeFile(name: "dyld_shared_cache_arm64e.symbols", type: "symbols"),
                                FakeFile(name: "dyld_shared_cache_arm64e", type: "binary")
                            ])
                        ])
                    ])
                ]),
                FakeFolder(name: "Library", items: [
                    FakeFolder(name: "Caches", items: []),
                    FakeFolder(name: "CoreServices", items: []),
                    FakeFolder(name: "Frameworks", items: []),
                    FakeFolder(name: "PrivateFrameworks", items: []),
                    FakeFolder(name: "Accounts", items: [])
                ])
            ])
        ])
    ]),
    FakeFolder(name: "App", items: [
        FakeFolder(name: "usr", items: [
            FakeFolder(name: "libexec", items: [
                FakeFile(name: "com.apple.Safari.History", type: "binary"),
                FakeFile(name: "webbookmarksd", type: "binary"),
                FakeFile(name: "webpushd", type: "binary"),
                FakeFile(name: "AuthenticationServiceAgent", type: "binary"),
                FakeFile(name: "safarifetcherd", type: "binary"),
                FakeFile(name: "webinspectord", type: "binary"),
                FakeFile(name: "passwordbreachd", type: "binary")
            ])
        ]),
        FakeFolder(name: "System", items: [
            FakeFolder(name: "Library", items: [
                FakeFolder(name: "UserNotifications", items: []),
                FakeFolder(name: "Trial", items: []),
                FakeFolder(name: "CoreServices", items: []),
                FakeFolder(name: "UsageBundles", items: []),
                FakeFolder(name: "AWD", items: []),
                FakeFolder(name: "DataClassMigrators", items: []),
                FakeFolder(name: "PreferenceBundles", items: []),
                FakeFolder(name: "PreferencesSyncBundles", items: []),
                FakeFolder(name: "CacheDelete", items: []),
                FakeFolder(name: "Accounts", items: []),
                FakeFolder(name: "Assistant", items: [])
            ])
        ])
    ])
]),
FakeFolder(name: "DriverKit", items: [
    FakeFolder(name: "usr", items: [
        FakeFolder(name: "include", items: [
            FakeFolder(name: "c++", items: [
                FakeFolder(name: "v1", items: [])
            ])
        ]),
        FakeFolder(name: "lib", items: [
            FakeFolder(name: "system", items: []),
            FakeFile(name: "libSystem_debug.dylib", type: "dylib")
        ])
    ]),
    FakeFolder(name: "Runtime", items: [
        FakeFolder(name: "usr", items: [
            FakeFolder(name: "include", items: [])
        ]),
        FakeFolder(name: "System", items: [
            FakeFolder(name: "Library", items: [
                FakeFolder(name: "Frameworks", items: [
                    FakeFolder(name: "System.framework", items: []),
                    FakeFolder(name: "Kernel.framework", items: [])
                ])
            ])
        ])
    ]),
    FakeFolder(name: "System", items: [
        FakeFolder(name: "Library", items: [
            FakeFolder(name: "Frameworks", items: [
                FakeFolder(name: "AudioDriverKit.framework", items: []),
                FakeFolder(name: "PCIDriverKit.framework", items: []),
                FakeFolder(name: "DriverKit.framework", items: []),
                FakeFolder(name: "NetworkingDriverKit.framework", items: []),
                FakeFolder(name: "USBDriverKit.framework", items: []),
                FakeFolder(name: "HIDDriverKit.framework", items: [])
            ]),
            FakeFolder(name: "PrivateFrameworks", items: [
                FakeFolder(name: "OLYHALDriverKit.framework", items: []),
                FakeFolder(name: "CoreCaptureDriverKit.framework", items: []),
                FakeFolder(name: "IOFileValidation.framework", items: []),
                FakeFolder(name: "MallocStackLogging.framework", items: []),
                FakeFolder(name: "TimeSensitiveNetworking.framework", items: []),
                FakeFolder(name: "AFKDriverKit.framework", items: []),
                FakeFolder(name: "IO80211DriverKit.framework", items: []),
                FakeFolder(name: "BroadcomWLANDriverKit.framework", items: [])
            ])
        ])
    ])
]),
FakeFolder(name: "Library", items: [
    FakeFolder(name: "Pearl", items: [])
]),
FakeFolder(name: "Applications", items: [
    FakeFolder(name: "Family", items: [
        FakeFolder(name: "inviteMessageBubbleExtension.appex", items: [])
    ])
]),
FakeFolder(name: "Developer", items: [])
        ]),
        FakeFolder(name: "var", items: [
            FakeFolder(name: ".DocumentRevisions-V100", items: []),
            FakeFolder(name: ".fseventsd", items: []),
            FakeFile(name: ".overprovisioning_file", type: "txt"),
            FakeFolder(name: "audit", items: []),
            FakeFolder(name: "buddy", items: []),
            FakeFolder(name: "containers", items: [
                FakeFolder(name: "Bundle", items: [
                    FakeFolder(name: "Application", items: [
                        FakeFolder(name: "FaceTime", items: []),
                        FakeFolder(name: "Mail", items: []),
                        FakeFolder(name: "TestFlight", items: []),
                        FakeFolder(name: "Happy April Fools!", items: [])
                    ])
                ]),
                FakeFolder(name: "Data", items: [
                    FakeFolder(name: "System", items: [
                        FakeFolder(name: "com.apple.adid", items: []),
                        FakeFolder(name: "com.apple.akd", items: []),
                        FakeFolder(name: "com.apple.appstored", items: []),
                        FakeFolder(name: "com.apple.apsd", items: []),
                        FakeFolder(name: "com.apple.backboardd", items: [])
                    ])
                ]),
                FakeFolder(name: "Shared", items: [
                    FakeFolder(name: "SystemGroup", items: [
                        FakeFolder(name: "systemgroup.com.mobileservices.diskCache", items: [])
                    ])
                ]),
                FakeFolder(name: "Temp", items: [
                    FakeFolder(name: "Bundle", items: [
                        FakeFolder(name: "Application", items: [])
                    ])
                ])
            ]),
            FakeFolder(name: "datamigrator", items: []),
            FakeFolder(name: "db", items: [
                FakeFolder(name: "accessoryupdater", items: []),
                FakeFolder(name: "amfid", items: []),
                FakeFolder(name: "analyticsd", items: []),
                FakeFolder(name: "astris", items: []),
                FakeFolder(name: "Battery", items: []),
                FakeFolder(name: "biome", items: []),
                FakeFolder(name: "com.apple.dt.automationmode", items: []),
                FakeFile(name: "com.apple.networkextension.tracker-info", type: "txt"),
                FakeFolder(name: "com.apple.xpc.launchd", items: []),
                FakeFolder(name: "com.apple.xpc.roleaccount.staging", items: []),
                FakeFolder(name: "darwindaemon", items: []),
                FakeFolder(name: "datadetectors", items: [])
            ]),
            FakeFolder(name: "dextcores", items: []),
            FakeFolder(name: "dirs_cleaner", items: []),
            FakeFolder(name: "empty", items: []),
            FakeFolder(name: "folders", items: []),
            FakeFolder(name: "installd", items: []),
            FakeFolder(name: "keybags", items: []),
            FakeFolder(name: "Keychains", items: []),
            FakeFolder(name: "lib", items: []),
            FakeFolder(name: "log", items: []),
            FakeFolder(name: "logs", items: []),
            FakeFolder(name: "Managed Preferences", items: []),
            FakeFolder(name: "mobile", items: []),
            FakeFolder(name: "MobileAsset", items: []),
            FakeFolder(name: "MobileSoftwareUpdate", items: []),
            FakeFolder(name: "msgs", items: []),
            FakeFolder(name: "networkd", items: []),
            FakeFolder(name: "preferences", items: []),
            FakeFolder(name: "protected", items: []),
            FakeFolder(name: "root", items: []),
            FakeFolder(name: "run", items: []),
            FakeFolder(name: "select", items: []),
            FakeFolder(name: "tmp", items: []),
            FakeFolder(name: "vm", items: []),
            FakeFolder(name: "wireless", items: [])
        ]),
        FakeFolder(name: "Library", items: [
    FakeFolder(name: "Caches", items: []),
    FakeFolder(name: "Filesystems", items: []),
    FakeFolder(name: "Wallpaper", items: [
        FakeFolder(name: "Collections", items: []),
        FakeFile(name: "DefaultWallpapers-iphone.plist", type: "plist"),
        FakeFolder(name: "Stills", items: [])
    ]),
    FakeFolder(name: "RegionFeatures", items: [
        FakeFile(name: "RegionFeatures_audio.txt", type: "txt"),
        FakeFile(name: "RegionFeatures_iphone.txt", type: "txt"),
        FakeFile(name: "RegionFeatures_ipod.txt", type: "txt"),
        FakeFile(name: "RegionFeatures_ipad.txt", type: "txt"),
        FakeFile(name: "RegionFeatures_watch.txt", type: "txt")
    ]),
    FakeFolder(name: "Updates", items: []),
    FakeFolder(name: "LaunchDaemons", items: [
        FakeFile(name: "com.apple.factory.NFQRCoded.plist", type: "plist")
    ]),
    FakeFolder(name: "Ringtones", items: [
        FakeFile(name: "Hillside.m4r", type: "m4r"),
        FakeFile(name: "Illuminate.m4r", type: "m4r"),
        FakeFile(name: "Timba.m4r", type: "m4r"),
        FakeFile(name: "Boing.m4r", type: "m4r"),
        FakeFile(name: "Beacon.m4r", type: "m4r"),
        FakeFile(name: "Motorcycle.m4r", type: "m4r")
    ]),
    FakeFolder(name: "LaunchAgents", items: [
        FakeFile(name: "com.apple.AuthenticationServiceAgent.plist", type: "plist")
    ]),
    FakeFolder(name: "Frameworks", items: []),
    FakeFolder(name: "MobileDevice", items: [
        FakeFolder(name: "ProvisioningProfiles", items: [
            FakeFile(name: "mis.db", type: "db"),
            FakeFile(name: "mis.db-wal", type: "db"),
            FakeFile(name: "mis.db-shm", type: "db")
        ])
    ]),
    FakeFolder(name: "Logs", items: [
        FakeFolder(name: "AppleSupport", items: []),
        FakeFolder(name: "OTACrashCopier", items: []),
        FakeFolder(name: "CrashReporter", items: []),
        FakeFile(name: "lockdownd.log", type: "log")
    ]),
    FakeFolder(name: "Preferences", items: [
        FakeFolder(name: "SystemConfiguration", items: []),
        FakeFile(name: "com.apple,networkextension.uuidcache.plist", type: "plist")
    ]),
    FakeFolder(name: "Audio", items: [
        FakeFolder(name: "Plug-Ins", items: []),
        FakeFolder(name: "Tunings", items: [])
    ]),
    FakeFolder(name: "Managed Preferences", items: [
        FakeFolder(name: "mobile", items: [])
    ]),
    FakeFolder(name: "Keychains", items: [
        FakeFile(name: "keychain-2.db-wal", type: "db")
    ]),
    FakeFolder(name: "Internet Plug-Ins", items: []),
    FakeFolder(name: "Printers", items: []),
    FakeFolder(name: "Application Support", items: [])
]),
        FakeFolder(name: "private", items: [
    FakeFolder(name: "var", items: [
        FakeFolder(name: "tmp", items: []),
        FakeFolder(name: ".fseventsd", items: []),
        FakeFolder(name: "preferences", items: []),
        FakeFolder(name: ".DocumentRevisions-V100", items: []),
        FakeFolder(name: "Keychains", items: []),
        FakeFolder(name: "logs", items: []),
        FakeFolder(name: "keybags", items: []),
        FakeFolder(name: "MobileSoftwareUpdate", items: []),
        FakeFolder(name: "log", items: []),
        FakeFolder(name: "run", items: []),
        FakeFolder(name: "vm", items: []),
        FakeFolder(name: "hardware", items: []),
        FakeFolder(name: "containers", items: []),
        FakeFolder(name: "dirs_cleaner", items: []),
        FakeFolder(name: "db", items: []),
        FakeFolder(name: "mobile", items: []),
        FakeFolder(name: "root", items: []),
        FakeFolder(name: "lib", items: []),
        FakeFolder(name: "installd", items: []),
        FakeFolder(name: "networkd", items: []),
        FakeFolder(name: "MobileAsset", items: []),
        FakeFolder(name: "wireless", items: []),
        FakeFolder(name: "MobileDevice", items: []),
        FakeFolder(name: "Managed Preferences", items: []),
        FakeFolder(name: "dextcores", items: []),
        FakeFolder(name: "empty", items: []),
        FakeFolder(name: "buddy", items: []),
        FakeFolder(name: "msgs", items: []),
        FakeFolder(name: "audit", items: []),
        FakeFolder(name: "folders", items: []),
        FakeFolder(name: "select", items: []),
        FakeFolder(name: "protected", items: []),
        FakeFolder(name: "datamigrator", items: [])
    ]),
    FakeFolder(name: "preboot", items: []),
    FakeFolder(name: "etc", items: []),
    FakeFolder(name: "system_data", items: []),
    FakeFolder(name: "xarts", items: [])
]),
        FakeFolder(name: "tmp", items: Array(0...9).map { FakeFolder(name: "temp\($0)", items: []) }),
        FakeFolder(name: "Applications", items: Array(0...9).map { FakeFile(name: "App\($0).app", type: "app") }),
        FakeFolder(name: "cores", items: []),
        FakeFolder(name: "Developer", items: [
            
            
            FakeFolder(name: "usr", items: []),
            FakeFolder(name: "Library", items: []),
            FakeFolder(name: "Applications", items: []),
            FakeFile(name: ".TrustCache", type: "txt")
        ])
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "0A0A12")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack {
                        Text("/")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                        Text("Read Only")
                            .font(.system(size: 12, weight: .medium))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(hex: "FF2D55").opacity(0.2))
                            .foregroundColor(Color(hex: "FF2D55"))
                            .clipShape(Capsule())
                    }
                    .padding()
                    .background(
                        Color(hex: "1A1A25")
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                    )
                    
                    List {
                        ForEach(fakeFileSystem) { folder in
                            FolderRow(folder: folder)
                                .listRowBackground(Color(hex: "0F0F17"))
                                .listRowSeparatorTint(Color.white.opacity(0.1))
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color(hex: "0A0A12"))
                    .listStyle(.plain)
                }
                .opacity(appeared ? 1 : 0)
                .offset(y: appeared ? 0 : 50)
            }
            .navigationBarHidden(true)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    appeared = true
                }
            }
        }
    }
}

struct FolderRow: View {
    let folder: FakeFolder
    
    var body: some View {
        if folder.items.isEmpty {
            HStack {
                Image(systemName: "folder.fill")
                    .foregroundColor(Color(hex: "FF9500"))
                    .font(.system(size: 18))
                    .padding(8)
                    .background(Color(hex: "FF9500").opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(folder.name)
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                
                Spacer()
                
                Text("Empty")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
        } else {
            NavigationLink(destination: SubFolderView(folder: folder)) {
                HStack {
                    Image(systemName: "folder.fill")
                        .foregroundColor(Color(hex: "FF9500"))
                        .font(.system(size: 18))
                        .padding(8)
                        .background(Color(hex: "FF9500").opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text(folder.name)
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                    
                    Spacer()
                    
                    Text("\(folder.items.count) items")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
        }
    }
}

struct SubFolderView: View {
    let folder: FakeFolder
    @State private var appeared = false
    
    var body: some View {
        ZStack {
            Color(hex: "0A0A12")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                List {
                    ForEach(0..<folder.items.count, id: \.self) { index in
                        let item = folder.items[index]
                        if let subFolder = item as? FakeFolder {
                            FolderRow(folder: subFolder)
                                .listRowBackground(Color(hex: "0F0F17"))
                                .listRowSeparatorTint(Color.white.opacity(0.1))
                        } else if let file = item as? FakeFile {
                            FileRow(file: file)
                                .listRowBackground(Color(hex: "0F0F17"))
                                .listRowSeparatorTint(Color.white.opacity(0.1))
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color(hex: "0A0A12"))
                .listStyle(.plain)
            }
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 20)
        }
        .navigationTitle(folder.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(hex: "1A1A25"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                appeared = true
            }
        }
    }
}

struct FileRow: View {
    let file: FakeFile
    
    var iconName: String {
        switch file.type {
        case "folder": return "folder.fill"
        case "app": return "app.fill"
        case "dylib": return "doc.fill"
        case "bin": return "terminal.fill"
        case "log": return "doc.text.fill"
        case "txt": return "doc.text.fill"
        case "file":
            if file.name.starts(with: "disk") || file.name.starts(with: "rdisk") {
                return "internaldrive.fill"
            } else if file.name.contains("tty") || file.name.contains("pty") {
                return "terminal.fill"
            } else if file.name == "random" || file.name == "urandom" {
                return "dice.fill"
            } else if file.name == "null" || file.name == "zero" {
                return "circle.slash"
            } else {
                return "chevron.left.forwardslash.chevron.right"
            }
        case "dmc":
            return "waveform.path.ecg"
        case "plist":
            return "list.bullet.rectangle"
        case "binary":
            return "chevron.left.forwardslash.chevron.right"
        case "json":
            return "curlybraces"
        case "png":
            return "photo.fill"
        case "symbols":
            return "doc.text.magnifyingglass"
        case "framework":
            return "shippingbox.fill"
        case "m4r":
            return "music.note"
        case "db":
            return "cylinder.split.1x2"
        case "log":
            return "text.alignleft"
        default: return "doc.fill"
        }
    }
    
    var iconColor: Color {
        switch file.type {
        case "folder": return Color(hex: "FF9500")
        case "app": return Color(hex: "FF2D55")
        case "dylib": return Color(hex: "30D158")
        case "bin": return Color(hex: "0A84FF")
        case "log": return Color.gray
        case "txt": return Color(hex: "5856D6")
        case "file":
            if file.name.starts(with: "disk") || file.name.starts(with: "rdisk") {
                return Color(hex: "FF3B30")
            } else if file.name.contains("tty") || file.name.contains("pty") {
                return Color(hex: "0A84FF")
            } else {
                return Color(hex: "64D2FF")
            }
        case "dmc":
            return Color(hex: "BF5AF2")
        case "plist":
            return Color(hex: "32D74B")
        case "binary":
            return Color(hex: "FF453A")
        case "json":
            return Color(hex: "FF9F0A")
        case "png":
            return Color(hex: "32D74B")
        case "symbols":
            return Color(hex: "FF9F0A")
        case "framework":
            return Color(hex: "BF5AF2")
        case "m4r":
            return Color(hex: "FF375F")
        case "db":
            return Color(hex: "30D158")
        case "log":
            return Color(hex: "64D2FF")
        default: return Color.white
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
                .font(.system(size: 18))
                .padding(8)
                .background(iconColor.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(file.name)
                .foregroundColor(.white)
                .padding(.leading, 8)
            
            Spacer()
            
            if file.type == "file" {
                Text("device")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            } else {
                Text(file.type)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}
