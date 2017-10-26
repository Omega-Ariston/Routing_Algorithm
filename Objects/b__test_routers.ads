pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Scalar_Values;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2017 (20170515-63)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_test_routers" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#47754a17#;
   pragma Export (C, u00001, "test_routersB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0a55feef#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#87cd2ab9#;
   pragma Export (C, u00005, "ada__calendar__delaysB");
   u00006 : constant Version_32 := 16#b27fb9e9#;
   pragma Export (C, u00006, "ada__calendar__delaysS");
   u00007 : constant Version_32 := 16#0d7f1a43#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#5b279c75#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#85a06f66#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#1a0dcc03#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#ac24596d#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#4c8a8c47#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#88327e42#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#047ef179#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#18d5fcc5#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#9df1ae6d#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00040, "ada__containersS");
   u00041 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00041, "ada__exceptions__tracebackB");
   u00042 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00042, "ada__exceptions__tracebackS");
   u00043 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00043, "system__bounded_stringsB");
   u00044 : constant Version_32 := 16#455da021#;
   pragma Export (C, u00044, "system__bounded_stringsS");
   u00045 : constant Version_32 := 16#42315736#;
   pragma Export (C, u00045, "system__crtlS");
   u00046 : constant Version_32 := 16#08e0d717#;
   pragma Export (C, u00046, "system__dwarf_linesB");
   u00047 : constant Version_32 := 16#b1bd2788#;
   pragma Export (C, u00047, "system__dwarf_linesS");
   u00048 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00048, "ada__charactersS");
   u00049 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00049, "ada__characters__handlingB");
   u00050 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00050, "ada__characters__handlingS");
   u00051 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00051, "ada__characters__latin_1S");
   u00052 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00052, "ada__stringsS");
   u00053 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00053, "ada__strings__mapsB");
   u00054 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00054, "ada__strings__mapsS");
   u00055 : constant Version_32 := 16#9dc9b435#;
   pragma Export (C, u00055, "system__bit_opsB");
   u00056 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00056, "system__bit_opsS");
   u00057 : constant Version_32 := 16#0626fdbb#;
   pragma Export (C, u00057, "system__unsigned_typesS");
   u00058 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00058, "ada__strings__maps__constantsS");
   u00059 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00059, "interfacesS");
   u00060 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00060, "system__address_imageB");
   u00061 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00061, "system__address_imageS");
   u00062 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00062, "system__img_unsB");
   u00063 : constant Version_32 := 16#99d2c14c#;
   pragma Export (C, u00063, "system__img_unsS");
   u00064 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00064, "system__ioB");
   u00065 : constant Version_32 := 16#ace27677#;
   pragma Export (C, u00065, "system__ioS");
   u00066 : constant Version_32 := 16#11faaec1#;
   pragma Export (C, u00066, "system__mmapB");
   u00067 : constant Version_32 := 16#08d13e5f#;
   pragma Export (C, u00067, "system__mmapS");
   u00068 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00068, "ada__io_exceptionsS");
   u00069 : constant Version_32 := 16#9d8ecedc#;
   pragma Export (C, u00069, "system__mmap__os_interfaceB");
   u00070 : constant Version_32 := 16#8f4541b8#;
   pragma Export (C, u00070, "system__mmap__os_interfaceS");
   u00071 : constant Version_32 := 16#54632e7c#;
   pragma Export (C, u00071, "system__os_libB");
   u00072 : constant Version_32 := 16#ed466fde#;
   pragma Export (C, u00072, "system__os_libS");
   u00073 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00073, "system__case_utilB");
   u00074 : constant Version_32 := 16#16a9e8ef#;
   pragma Export (C, u00074, "system__case_utilS");
   u00075 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00075, "system__stringsB");
   u00076 : constant Version_32 := 16#4c1f905e#;
   pragma Export (C, u00076, "system__stringsS");
   u00077 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00077, "interfaces__cB");
   u00078 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00078, "interfaces__cS");
   u00079 : constant Version_32 := 16#d0bc914c#;
   pragma Export (C, u00079, "system__object_readerB");
   u00080 : constant Version_32 := 16#7f932442#;
   pragma Export (C, u00080, "system__object_readerS");
   u00081 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00081, "system__val_lliB");
   u00082 : constant Version_32 := 16#a8846798#;
   pragma Export (C, u00082, "system__val_lliS");
   u00083 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00083, "system__val_lluB");
   u00084 : constant Version_32 := 16#7cd4aac9#;
   pragma Export (C, u00084, "system__val_lluS");
   u00085 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00085, "system__val_utilB");
   u00086 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00086, "system__val_utilS");
   u00087 : constant Version_32 := 16#5bbc3f2f#;
   pragma Export (C, u00087, "system__exception_tracesB");
   u00088 : constant Version_32 := 16#167fa1a2#;
   pragma Export (C, u00088, "system__exception_tracesS");
   u00089 : constant Version_32 := 16#d178f226#;
   pragma Export (C, u00089, "system__win32S");
   u00090 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00090, "system__wch_conB");
   u00091 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00091, "system__wch_conS");
   u00092 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00092, "system__wch_stwB");
   u00093 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00093, "system__wch_stwS");
   u00094 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00094, "system__wch_cnvB");
   u00095 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00095, "system__wch_cnvS");
   u00096 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00096, "system__wch_jisB");
   u00097 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00097, "system__wch_jisS");
   u00098 : constant Version_32 := 16#a99e1d66#;
   pragma Export (C, u00098, "system__os_primitivesB");
   u00099 : constant Version_32 := 16#b82f904e#;
   pragma Export (C, u00099, "system__os_primitivesS");
   u00100 : constant Version_32 := 16#b6166bc6#;
   pragma Export (C, u00100, "system__task_lockB");
   u00101 : constant Version_32 := 16#532ab656#;
   pragma Export (C, u00101, "system__task_lockS");
   u00102 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00102, "system__win32__extS");
   u00103 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00103, "system__tracesB");
   u00104 : constant Version_32 := 16#c0bde992#;
   pragma Export (C, u00104, "system__tracesS");
   u00105 : constant Version_32 := 16#bcec81df#;
   pragma Export (C, u00105, "ada__containers__helpersB");
   u00106 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00106, "ada__containers__helpersS");
   u00107 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00107, "ada__finalizationS");
   u00108 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00108, "ada__streamsB");
   u00109 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00109, "ada__streamsS");
   u00110 : constant Version_32 := 16#d85792d6#;
   pragma Export (C, u00110, "ada__tagsB");
   u00111 : constant Version_32 := 16#8813468c#;
   pragma Export (C, u00111, "ada__tagsS");
   u00112 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00112, "system__htableB");
   u00113 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00113, "system__htableS");
   u00114 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00114, "system__string_hashB");
   u00115 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00115, "system__string_hashS");
   u00116 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00116, "system__val_unsB");
   u00117 : constant Version_32 := 16#168e1080#;
   pragma Export (C, u00117, "system__val_unsS");
   u00118 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00118, "system__finalization_rootB");
   u00119 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00119, "system__finalization_rootS");
   u00120 : constant Version_32 := 16#70f25dad#;
   pragma Export (C, u00120, "system__atomic_countersB");
   u00121 : constant Version_32 := 16#86fcacb5#;
   pragma Export (C, u00121, "system__atomic_countersS");
   u00122 : constant Version_32 := 16#5fc82639#;
   pragma Export (C, u00122, "system__machine_codeS");
   u00123 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00123, "ada__float_text_ioB");
   u00124 : constant Version_32 := 16#af9f2fd5#;
   pragma Export (C, u00124, "ada__float_text_ioS");
   u00125 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00125, "ada__text_ioB");
   u00126 : constant Version_32 := 16#95711eac#;
   pragma Export (C, u00126, "ada__text_ioS");
   u00127 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00127, "interfaces__c_streamsB");
   u00128 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00128, "interfaces__c_streamsS");
   u00129 : constant Version_32 := 16#6f0d52aa#;
   pragma Export (C, u00129, "system__file_ioB");
   u00130 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00130, "system__file_ioS");
   u00131 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00131, "system__file_control_blockS");
   u00132 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00132, "ada__text_io__float_auxB");
   u00133 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00133, "ada__text_io__float_auxS");
   u00134 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00134, "ada__text_io__generic_auxB");
   u00135 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00135, "ada__text_io__generic_auxS");
   u00136 : constant Version_32 := 16#8aa4f090#;
   pragma Export (C, u00136, "system__img_realB");
   u00137 : constant Version_32 := 16#f508d0da#;
   pragma Export (C, u00137, "system__img_realS");
   u00138 : constant Version_32 := 16#36373acb#;
   pragma Export (C, u00138, "system__fat_llfS");
   u00139 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00139, "system__float_controlB");
   u00140 : constant Version_32 := 16#d25cc204#;
   pragma Export (C, u00140, "system__float_controlS");
   u00141 : constant Version_32 := 16#3e932977#;
   pragma Export (C, u00141, "system__img_lluB");
   u00142 : constant Version_32 := 16#4feffd78#;
   pragma Export (C, u00142, "system__img_lluS");
   u00143 : constant Version_32 := 16#62d0e74f#;
   pragma Export (C, u00143, "system__powten_tableS");
   u00144 : constant Version_32 := 16#faa9a7b2#;
   pragma Export (C, u00144, "system__val_realB");
   u00145 : constant Version_32 := 16#cc89f629#;
   pragma Export (C, u00145, "system__val_realS");
   u00146 : constant Version_32 := 16#b2a569d2#;
   pragma Export (C, u00146, "system__exn_llfB");
   u00147 : constant Version_32 := 16#8ede3ae4#;
   pragma Export (C, u00147, "system__exn_llfS");
   u00148 : constant Version_32 := 16#6ad59d2c#;
   pragma Export (C, u00148, "system__fat_fltS");
   u00149 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00149, "ada__integer_text_ioB");
   u00150 : constant Version_32 := 16#b85ee1d1#;
   pragma Export (C, u00150, "ada__integer_text_ioS");
   u00151 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00151, "ada__text_io__integer_auxB");
   u00152 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00152, "ada__text_io__integer_auxS");
   u00153 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00153, "system__img_biuB");
   u00154 : constant Version_32 := 16#c00475f6#;
   pragma Export (C, u00154, "system__img_biuS");
   u00155 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00155, "system__img_llbB");
   u00156 : constant Version_32 := 16#81c36508#;
   pragma Export (C, u00156, "system__img_llbS");
   u00157 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00157, "system__img_lliB");
   u00158 : constant Version_32 := 16#23efd4e9#;
   pragma Export (C, u00158, "system__img_lliS");
   u00159 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00159, "system__img_llwB");
   u00160 : constant Version_32 := 16#28af469e#;
   pragma Export (C, u00160, "system__img_llwS");
   u00161 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00161, "system__img_wiuB");
   u00162 : constant Version_32 := 16#ae45f264#;
   pragma Export (C, u00162, "system__img_wiuS");
   u00163 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00163, "system__val_intB");
   u00164 : constant Version_32 := 16#7a05ab07#;
   pragma Export (C, u00164, "system__val_intS");
   u00165 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00165, "ada__numericsS");
   u00166 : constant Version_32 := 16#03fc996e#;
   pragma Export (C, u00166, "ada__real_timeB");
   u00167 : constant Version_32 := 16#c3d451b0#;
   pragma Export (C, u00167, "ada__real_timeS");
   u00168 : constant Version_32 := 16#cb56a7b3#;
   pragma Export (C, u00168, "system__taskingB");
   u00169 : constant Version_32 := 16#70384b95#;
   pragma Export (C, u00169, "system__taskingS");
   u00170 : constant Version_32 := 16#c71f56c0#;
   pragma Export (C, u00170, "system__task_primitivesS");
   u00171 : constant Version_32 := 16#fa769fc7#;
   pragma Export (C, u00171, "system__os_interfaceS");
   u00172 : constant Version_32 := 16#22b0e2af#;
   pragma Export (C, u00172, "interfaces__c__stringsB");
   u00173 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00173, "interfaces__c__stringsS");
   u00174 : constant Version_32 := 16#fc754292#;
   pragma Export (C, u00174, "system__task_primitives__operationsB");
   u00175 : constant Version_32 := 16#24684c98#;
   pragma Export (C, u00175, "system__task_primitives__operationsS");
   u00176 : constant Version_32 := 16#da8ccc08#;
   pragma Export (C, u00176, "system__interrupt_managementB");
   u00177 : constant Version_32 := 16#0f60a80c#;
   pragma Export (C, u00177, "system__interrupt_managementS");
   u00178 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00178, "system__multiprocessorsB");
   u00179 : constant Version_32 := 16#0a0c1e4b#;
   pragma Export (C, u00179, "system__multiprocessorsS");
   u00180 : constant Version_32 := 16#77769007#;
   pragma Export (C, u00180, "system__task_infoB");
   u00181 : constant Version_32 := 16#e54688cf#;
   pragma Export (C, u00181, "system__task_infoS");
   u00182 : constant Version_32 := 16#9471a5c6#;
   pragma Export (C, u00182, "system__tasking__debugB");
   u00183 : constant Version_32 := 16#f1f2435f#;
   pragma Export (C, u00183, "system__tasking__debugS");
   u00184 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00184, "system__concat_2B");
   u00185 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00185, "system__concat_2S");
   u00186 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00186, "system__concat_3B");
   u00187 : constant Version_32 := 16#39d0dd9d#;
   pragma Export (C, u00187, "system__concat_3S");
   u00188 : constant Version_32 := 16#18e0e51c#;
   pragma Export (C, u00188, "system__img_enum_newB");
   u00189 : constant Version_32 := 16#53ec87f8#;
   pragma Export (C, u00189, "system__img_enum_newS");
   u00190 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00190, "system__stack_usageB");
   u00191 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00191, "system__stack_usageS");
   u00192 : constant Version_32 := 16#fe1ffede#;
   pragma Export (C, u00192, "ada__strings__boundedB");
   u00193 : constant Version_32 := 16#89c18940#;
   pragma Export (C, u00193, "ada__strings__boundedS");
   u00194 : constant Version_32 := 16#7ec26662#;
   pragma Export (C, u00194, "ada__strings__superboundedB");
   u00195 : constant Version_32 := 16#da6addee#;
   pragma Export (C, u00195, "ada__strings__superboundedS");
   u00196 : constant Version_32 := 16#144f64ae#;
   pragma Export (C, u00196, "ada__strings__searchB");
   u00197 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00197, "ada__strings__searchS");
   u00198 : constant Version_32 := 16#933d1555#;
   pragma Export (C, u00198, "system__compare_array_unsigned_8B");
   u00199 : constant Version_32 := 16#9ba3f0b5#;
   pragma Export (C, u00199, "system__compare_array_unsigned_8S");
   u00200 : constant Version_32 := 16#97d13ec4#;
   pragma Export (C, u00200, "system__address_operationsB");
   u00201 : constant Version_32 := 16#21ac3f0b#;
   pragma Export (C, u00201, "system__address_operationsS");
   u00202 : constant Version_32 := 16#39741a5d#;
   pragma Export (C, u00202, "exceptionsB");
   u00203 : constant Version_32 := 16#bae1bad2#;
   pragma Export (C, u00203, "exceptionsS");
   u00204 : constant Version_32 := 16#b8a4f841#;
   pragma Export (C, u00204, "ada__task_identificationB");
   u00205 : constant Version_32 := 16#874f76c4#;
   pragma Export (C, u00205, "ada__task_identificationS");
   u00206 : constant Version_32 := 16#f9053daa#;
   pragma Export (C, u00206, "system__tasking__utilitiesB");
   u00207 : constant Version_32 := 16#14a33d48#;
   pragma Export (C, u00207, "system__tasking__utilitiesS");
   u00208 : constant Version_32 := 16#bc23950c#;
   pragma Export (C, u00208, "system__tasking__initializationB");
   u00209 : constant Version_32 := 16#efd25374#;
   pragma Export (C, u00209, "system__tasking__initializationS");
   u00210 : constant Version_32 := 16#72fc64c4#;
   pragma Export (C, u00210, "system__soft_links__taskingB");
   u00211 : constant Version_32 := 16#5ae92880#;
   pragma Export (C, u00211, "system__soft_links__taskingS");
   u00212 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00212, "ada__exceptions__is_null_occurrenceB");
   u00213 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00213, "ada__exceptions__is_null_occurrenceS");
   u00214 : constant Version_32 := 16#e774edef#;
   pragma Export (C, u00214, "system__tasking__task_attributesB");
   u00215 : constant Version_32 := 16#6bc95a13#;
   pragma Export (C, u00215, "system__tasking__task_attributesS");
   u00216 : constant Version_32 := 16#ab2f8f51#;
   pragma Export (C, u00216, "system__tasking__queuingB");
   u00217 : constant Version_32 := 16#d1ba2fcb#;
   pragma Export (C, u00217, "system__tasking__queuingS");
   u00218 : constant Version_32 := 16#8bdfec1d#;
   pragma Export (C, u00218, "system__tasking__protected_objectsB");
   u00219 : constant Version_32 := 16#a9001c61#;
   pragma Export (C, u00219, "system__tasking__protected_objectsS");
   u00220 : constant Version_32 := 16#17aa7da7#;
   pragma Export (C, u00220, "system__tasking__protected_objects__entriesB");
   u00221 : constant Version_32 := 16#427cf21f#;
   pragma Export (C, u00221, "system__tasking__protected_objects__entriesS");
   u00222 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00222, "system__restrictionsB");
   u00223 : constant Version_32 := 16#c1c3a556#;
   pragma Export (C, u00223, "system__restrictionsS");
   u00224 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00224, "system__traces__taskingB");
   u00225 : constant Version_32 := 16#09f07b39#;
   pragma Export (C, u00225, "system__traces__taskingS");
   u00226 : constant Version_32 := 16#bf39825f#;
   pragma Export (C, u00226, "generic_message_structuresS");
   u00227 : constant Version_32 := 16#2c6470be#;
   pragma Export (C, u00227, "generic_routers_configurationS");
   u00228 : constant Version_32 := 16#d5b4f1ad#;
   pragma Export (C, u00228, "routers_configuration_structuresB");
   u00229 : constant Version_32 := 16#73ddea8c#;
   pragma Export (C, u00229, "routers_configuration_structuresS");
   u00230 : constant Version_32 := 16#80fb7ec4#;
   pragma Export (C, u00230, "topologiesB");
   u00231 : constant Version_32 := 16#35583929#;
   pragma Export (C, u00231, "topologiesS");
   u00232 : constant Version_32 := 16#dde34de3#;
   pragma Export (C, u00232, "system__exp_intB");
   u00233 : constant Version_32 := 16#2b83b7c4#;
   pragma Export (C, u00233, "system__exp_intS");
   u00234 : constant Version_32 := 16#a2250034#;
   pragma Export (C, u00234, "system__storage_pools__subpoolsB");
   u00235 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00235, "system__storage_pools__subpoolsS");
   u00236 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00236, "system__finalization_mastersB");
   u00237 : constant Version_32 := 16#695cb8f2#;
   pragma Export (C, u00237, "system__finalization_mastersS");
   u00238 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00238, "system__img_boolB");
   u00239 : constant Version_32 := 16#c779f0d3#;
   pragma Export (C, u00239, "system__img_boolS");
   u00240 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00240, "system__storage_poolsB");
   u00241 : constant Version_32 := 16#114d1f95#;
   pragma Export (C, u00241, "system__storage_poolsS");
   u00242 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00242, "system__storage_pools__subpools__finalizationB");
   u00243 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00243, "system__storage_pools__subpools__finalizationS");
   u00244 : constant Version_32 := 16#3c420900#;
   pragma Export (C, u00244, "system__stream_attributesB");
   u00245 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00245, "system__stream_attributesS");
   u00246 : constant Version_32 := 16#03e689ee#;
   pragma Export (C, u00246, "generic_routerB");
   u00247 : constant Version_32 := 16#8b6d6dc1#;
   pragma Export (C, u00247, "generic_routerS");
   u00248 : constant Version_32 := 16#0abb5837#;
   pragma Export (C, u00248, "generic_router_linksB");
   u00249 : constant Version_32 := 16#267d71e6#;
   pragma Export (C, u00249, "generic_router_linksS");
   u00250 : constant Version_32 := 16#7095fec5#;
   pragma Export (C, u00250, "id_dispenserB");
   u00251 : constant Version_32 := 16#a411273f#;
   pragma Export (C, u00251, "id_dispenserS");
   u00252 : constant Version_32 := 16#9e0f35f2#;
   pragma Export (C, u00252, "generic_routersB");
   u00253 : constant Version_32 := 16#bd8852de#;
   pragma Export (C, u00253, "generic_routersS");
   u00254 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00254, "gnatS");
   u00255 : constant Version_32 := 16#f2886c31#;
   pragma Export (C, u00255, "gnat__command_lineB");
   u00256 : constant Version_32 := 16#c8b918ca#;
   pragma Export (C, u00256, "gnat__command_lineS");
   u00257 : constant Version_32 := 16#3791e504#;
   pragma Export (C, u00257, "ada__strings__unboundedB");
   u00258 : constant Version_32 := 16#9fdb1809#;
   pragma Export (C, u00258, "ada__strings__unboundedS");
   u00259 : constant Version_32 := 16#906460f4#;
   pragma Export (C, u00259, "gnat__directory_operationsB");
   u00260 : constant Version_32 := 16#b33d66bb#;
   pragma Export (C, u00260, "gnat__directory_operationsS");
   u00261 : constant Version_32 := 16#e5480ede#;
   pragma Export (C, u00261, "ada__strings__fixedB");
   u00262 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00262, "ada__strings__fixedS");
   u00263 : constant Version_32 := 16#923eb7bb#;
   pragma Export (C, u00263, "gnat__os_libS");
   u00264 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00264, "system__pool_globalB");
   u00265 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00265, "system__pool_globalS");
   u00266 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00266, "system__memoryB");
   u00267 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00267, "system__memoryS");
   u00268 : constant Version_32 := 16#3b5cd14a#;
   pragma Export (C, u00268, "ada__command_lineB");
   u00269 : constant Version_32 := 16#3cdef8c9#;
   pragma Export (C, u00269, "ada__command_lineS");
   u00270 : constant Version_32 := 16#084c16d0#;
   pragma Export (C, u00270, "gnat__regexpS");
   u00271 : constant Version_32 := 16#908d8e33#;
   pragma Export (C, u00271, "system__regexpB");
   u00272 : constant Version_32 := 16#119226f4#;
   pragma Export (C, u00272, "system__regexpS");
   u00273 : constant Version_32 := 16#b4645806#;
   pragma Export (C, u00273, "gnat__stringsS");
   u00274 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00274, "system__assertionsB");
   u00275 : constant Version_32 := 16#ff2dadac#;
   pragma Export (C, u00275, "system__assertionsS");
   u00276 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00276, "system__concat_4B");
   u00277 : constant Version_32 := 16#4cc4aa18#;
   pragma Export (C, u00277, "system__concat_4S");
   u00278 : constant Version_32 := 16#276453b7#;
   pragma Export (C, u00278, "system__img_lldB");
   u00279 : constant Version_32 := 16#c1828851#;
   pragma Export (C, u00279, "system__img_lldS");
   u00280 : constant Version_32 := 16#bd3715ff#;
   pragma Export (C, u00280, "system__img_decB");
   u00281 : constant Version_32 := 16#9c8d88e3#;
   pragma Export (C, u00281, "system__img_decS");
   u00282 : constant Version_32 := 16#d34f9f29#;
   pragma Export (C, u00282, "system__random_numbersB");
   u00283 : constant Version_32 := 16#f1b831a2#;
   pragma Export (C, u00283, "system__random_numbersS");
   u00284 : constant Version_32 := 16#40a8df0e#;
   pragma Export (C, u00284, "system__random_seedB");
   u00285 : constant Version_32 := 16#69b0a863#;
   pragma Export (C, u00285, "system__random_seedS");
   u00286 : constant Version_32 := 16#1713e61a#;
   pragma Export (C, u00286, "system__scalar_valuesB");
   u00287 : constant Version_32 := 16#8c04866f#;
   pragma Export (C, u00287, "system__scalar_valuesS");
   u00288 : constant Version_32 := 16#96bbd7c2#;
   pragma Export (C, u00288, "system__tasking__rendezvousB");
   u00289 : constant Version_32 := 16#ea18a31e#;
   pragma Export (C, u00289, "system__tasking__rendezvousS");
   u00290 : constant Version_32 := 16#6896b958#;
   pragma Export (C, u00290, "system__tasking__entry_callsB");
   u00291 : constant Version_32 := 16#df420580#;
   pragma Export (C, u00291, "system__tasking__entry_callsS");
   u00292 : constant Version_32 := 16#1dc86ab7#;
   pragma Export (C, u00292, "system__tasking__protected_objects__operationsB");
   u00293 : constant Version_32 := 16#ba36ad85#;
   pragma Export (C, u00293, "system__tasking__protected_objects__operationsS");
   u00294 : constant Version_32 := 16#d8fc9f88#;
   pragma Export (C, u00294, "system__tasking__stagesB");
   u00295 : constant Version_32 := 16#e9cef940#;
   pragma Export (C, u00295, "system__tasking__stagesS");
   u00296 : constant Version_32 := 16#f89f7823#;
   pragma Export (C, u00296, "system__val_boolB");
   u00297 : constant Version_32 := 16#c832ed26#;
   pragma Export (C, u00297, "system__val_boolS");
   u00298 : constant Version_32 := 16#83947c18#;
   pragma Export (C, u00298, "system__val_enumB");
   u00299 : constant Version_32 := 16#89bac3ad#;
   pragma Export (C, u00299, "system__val_enumS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.exp_int%s
   --  system.exp_int%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_dec%s
   --  system.img_dec%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_lld%s
   --  system.img_lld%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  gnat.strings%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%s
   --  system.img_real%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.scalar_values%s
   --  system.scalar_values%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.val_util%s
   --  system.standard_library%s
   --  system.exception_traces%s
   --  ada.exceptions%s
   --  system.wch_stw%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.os_lib%s
   --  system.bit_ops%s
   --  ada.characters.handling%s
   --  ada.exceptions.traceback%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.containers%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.wch_stw%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  interfaces.c%s
   --  system.win32%s
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.os_lib%b
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%b
   --  ada.exceptions.traceback%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  ada.exceptions.last_chance_handler%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  interfaces.c%b
   --  ada.strings.maps%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.object_reader%b
   --  ada.command_line%s
   --  ada.command_line%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.numerics%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.strings.superbounded%s
   --  ada.strings.superbounded%b
   --  ada.strings.bounded%s
   --  ada.strings.bounded%b
   --  gnat.os_lib%s
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.val_bool%s
   --  system.val_bool%b
   --  system.val_enum%s
   --  system.val_enum%b
   --  system.val_real%s
   --  system.val_real%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools%b
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.val_int%s
   --  system.val_int%b
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking%b
   --  system.task_primitives.operations%b
   --  system.tasking.debug%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%s
   --  ada.text_io.float_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  gnat.directory_operations%s
   --  gnat.directory_operations%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.regexp%s
   --  system.regexp%b
   --  gnat.regexp%s
   --  gnat.command_line%s
   --  gnat.command_line%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.initialization%b
   --  system.tasking.task_attributes%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  ada.task_identification%s
   --  ada.task_identification%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  exceptions%s
   --  exceptions%b
   --  generic_router_links%s
   --  generic_router_links%b
   --  id_dispenser%s
   --  id_dispenser%b
   --  topologies%s
   --  topologies%b
   --  routers_configuration_structures%s
   --  routers_configuration_structures%b
   --  generic_routers_configuration%s
   --  generic_message_structures%s
   --  generic_router%s
   --  generic_router%b
   --  generic_routers%s
   --  generic_routers%b
   --  test_routers%b
   --  END ELABORATION ORDER

end ada_main;
